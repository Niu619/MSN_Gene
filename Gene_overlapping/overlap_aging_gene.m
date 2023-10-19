%% Overlopping genes with age-related genes from GWAS
clear, clc
PLS1_gene_table = readtable('H:\DLBS\3DT1\DK_308_out\PLS_out\input\gene_expression_RNAseq.csv');
gene_PLS1 = PLS1_gene_table.Var1(2:10028);
aging_gene_table = readtable('H:\DLBS\3DT1\DK_308_out\PLS_out\output\PLS1_geneWeights.csv'); 
gene_aging = aging_gene_table.aging_gene(1:84);
[overlap,ind_PLS1,ind_aging] = intersect(gene_PLS1,gene_aging);
overlap = char(overlap);    % 

% 
    
expression_table = importdata('H:\DLBS\3DT1\DK_308_out\PLS_out\input\gene_expression_RNAseq.csv');
expression_data = expression_table.data(2:10028,:);
expression_data = zscore(expression_data);            % 
overlap_expression_data = zeros(37,152);
for i = 1:37
    overlap_expression_data(i,:) = expression_data(ind_PLS1(i,1),:);
end          %

clear

% 

expression_data = xlsread('H:\DALLAS\3DT1\DK_308_out\PLS_out\input\expression_data_overlap_aging.xlsx');
%expression_data(:,152) = [];
expression_data = expression_data';
r_score = importdata('H:\DALLAS\3DT1\DK_308_out\PLS_out\input\r_score_5metric_uncorrect_regressTIV.csv');
r_score = r_score.data(1:152);

% Spatial permutation test
x = r_score;
perm_id = xlsread('H:\DALLAS\3DT1\DK_308_out\PLS_out\input\perm_id.xlsx');
perm_id = perm_id(1:152,:);
nroi = size(perm_id,1);  % number of regions
nperm = size(perm_id,2); % number of permutations
corr_type = 'Pearson';
R = zeros(37,1); 
P = zeros(37,1);
for j = 1:37
    y = expression_data(:,j);

    rho_emp = corr(x,y,'type',corr_type);     % empirical correlation
    R(j,1) = rho_emp;                              %
    % permutation of measures
    x_perm = zeros(nroi,nperm);
    y_perm = zeros(nroi,nperm);
    for r = 1:nperm
        for i = 1:nroi
            x_perm(i,r) = x(perm_id(i,r)); % permute x
            y_perm(i,r) = y(perm_id(i,r)); % permute y
        end
    end

    % corrrelation to unpermuted measures
    rho_null_xy = zeros(nperm,1);
    for r = 1:nperm
        rho_null_xy(r) = corr(x_perm(:,r),y,'type',corr_type); % correlate permuted x to unpermuted y
        rho_null_yx(r) = corr(y_perm(:,r),x,'type',corr_type); % correlate permuted y to unpermuted x
    end

    % p-value definition depends on the sign of the empirical correlation
    if rho_emp > 0
        p_perm_xy = sum(rho_null_xy > rho_emp)/nperm;
        p_perm_yx = sum(rho_null_yx > rho_emp)/nperm;
    else
        p_perm_xy = sum(rho_null_xy < rho_emp)/nperm;
        p_perm_yx = sum(rho_null_yx < rho_emp)/nperm;
    end

    % average p-values
    p_perm = (p_perm_xy + p_perm_yx)/2;       
    P(j,1) = p_perm; 
    P_FDR = mafdr(P,'BH',true);           %
    clear p_perm p_perm_xy p_perm_yx rho_emp rho_null_xy rho_null_yx x_perm y_perm y

end
