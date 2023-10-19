%% PLS1 genes and cell-type specific genes
clear
%%     Cam_CAN
              % PLS1+ overlap number
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
%PLS1_gene = geneTable.PLS1_gene;
PLS1_posi_gene = geneTable.PLS1_posi_gene;   
PLS1_posi_gene = PLS1_posi_gene(1:1095);    % 
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:4296);              % 

nperm = 5000;                               % 
number_null = zeros(7,5000);                % 
for i = 1:nperm
    new_order = randperm(4296);             % 
    new_cell_gene = cell_gene(new_order(:));% 
    new_Astro = new_cell_gene(1:661);       % Astro 
    new_Endo = new_cell_gene(662:1358);     % Endo 
    new_Micro = new_cell_gene(1359:1835);   % Micro 
    new_Neuro_Ex = new_cell_gene(1836:2829);% Neuro-Ex
    new_Neuro_In = new_cell_gene(2830:3546);% Neuro-In 
    new_Oligo = new_cell_gene(3547:4170);   % Oligo 
    new_OPC = new_cell_gene(4171:4296);     % OPC 
    geneselect_Astro = intersect(PLS1_posi_gene, new_Astro);      
    geneselect_Endo = intersect(PLS1_posi_gene, new_Endo);       
    geneselect_Micro = intersect(PLS1_posi_gene, new_Micro);      
    geneselect_Neuro_Ex = intersect(PLS1_posi_gene, new_Neuro_Ex);
    geneselect_Neuro_In = intersect(PLS1_posi_gene, new_Neuro_In);
    geneselect_Oligo = intersect(PLS1_posi_gene, new_Oligo);     
    geneselect_OPC = intersect(PLS1_posi_gene, new_OPC);          
    number_null(1,i) = length(geneselect_Astro);   
    number_null(2,i) = length(geneselect_Endo);    
    number_null(3,i) = length(geneselect_Micro);   
    number_null(4,i) = length(geneselect_Neuro_Ex);
    number_null(5,i) = length(geneselect_Neuro_In);
    number_null(6,i) = length(geneselect_Oligo);   
    number_null(7,i) = length(geneselect_OPC);     
    clear new_Astro new_Endo new_Micro new_Neuro_Ex new_Neuro_In new_Oligo new_OPC new_order new_cell_gene
    clear geneselect_Astro geneselect_Endo geneselect_Micro geneselect_Neuro_Ex geneselect_Neuro_In geneselect_Oligo geneselect_OPC
end     % 
    number_null = number_null';
    p = zeros(7,1);
    p(1,1) = length(find(number_null(:,1)>=34))/5000; % p
    p(2,1) = length(find(number_null(:,2)>=69))/5000; 
    p(3,1) = length(find(number_null(:,3)>=45))/5000; 
    p(4,1) = length(find(number_null(:,4)>=159))/5000;
    p(5,1) = length(find(number_null(:,5)>=121))/5000;
    p(6,1) = length(find(number_null(:,6)>=26))/5000;
    p(7,1) = length(find(number_null(:,7)>=9))/5000;
    FDR = mafdr(p,'BH',true);      % FDR correction
clear 

      % PLS1- overlap number          
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:4296);

nperm = 5000;
number_null = zeros(7,5000);
for i = 1:nperm
    new_order = randperm(4296);
    new_cell_gene = cell_gene(new_order(:));
    new_Astro = new_cell_gene(1:661);
    new_Endo = new_cell_gene(662:1358);
    new_Micro = new_cell_gene(1359:1835);
    new_Neuro_Ex = new_cell_gene(1836:2829);
    new_Neuro_In = new_cell_gene(2830:3546);
    new_Oligo = new_cell_gene(3547:4170);
    new_OPC = new_cell_gene(4171:4296);
    geneselect_Astro = intersect(PLS1_nega_gene, new_Astro);
    geneselect_Endo = intersect(PLS1_nega_gene, new_Endo);
    geneselect_Micro = intersect(PLS1_nega_gene, new_Micro);
    geneselect_Neuro_Ex = intersect(PLS1_nega_gene, new_Neuro_Ex);
    geneselect_Neuro_In = intersect(PLS1_nega_gene, new_Neuro_In);
    geneselect_Oligo = intersect(PLS1_nega_gene, new_Oligo);
    geneselect_OPC = intersect(PLS1_nega_gene, new_OPC);
    number_null(1,i) = length(geneselect_Astro);
    number_null(2,i) = length(geneselect_Endo);
    number_null(3,i) = length(geneselect_Micro);
    number_null(4,i) = length(geneselect_Neuro_Ex);
    number_null(5,i) = length(geneselect_Neuro_In);
    number_null(6,i) = length(geneselect_Oligo);
    number_null(7,i) = length(geneselect_OPC);     %
    clear new_Astro new_Endo new_Micro new_Neuro_Ex new_Neuro_In new_Oligo new_OPC new_order new_cell_gene
    clear geneselect_Astro geneselect_Endo geneselect_Micro geneselect_Neuro_Ex geneselect_Neuro_In geneselect_Oligo geneselect_OPC
end
number_null = number_null';
p = zeros(7,1);
    p(1,1) = length(find(number_null(:,1)>=215))/5000;
    p(2,1) = length(find(number_null(:,2)>=98))/5000;
    p(3,1) = length(find(number_null(:,3)>=111))/5000;
    p(4,1) = length(find(number_null(:,4)>=192))/5000;
    p(5,1) = length(find(number_null(:,5)>=148))/5000;
    p(6,1) = length(find(number_null(:,6)>=57))/5000;
    p(7,1) = length(find(number_null(:,7)>=28))/5000;
    FDR = mafdr(p,'BH',true);
clear 


%%     DLBS
              % PLS1+ overlap number
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\whole_gene.xlsx');
%PLS1_gene = geneTable.PLS1_gene;   
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);    %
cell_gene = geneTable.cell_gene(1:4296);              % 

nperm = 5000;                          
number_null = zeros(7,5000);               
for i = 1:nperm
    new_order = randperm(4296);             
    new_cell_gene = cell_gene(new_order(:));% 
    new_Astro = new_cell_gene(1:661);       % Astro
    new_Endo = new_cell_gene(662:1358);     % Endo 
    new_Micro = new_cell_gene(1359:1835);   % Micro 
    new_Neuro_Ex = new_cell_gene(1836:2829);% Neuro-Ex 
    new_Neuro_In = new_cell_gene(2830:3546);% Neuro-In
    new_Oligo = new_cell_gene(3547:4170);   % Oligo 
    new_OPC = new_cell_gene(4171:4296);     % OPC 
    geneselect_Astro = intersect(PLS1_posi_gene, new_Astro);      
    geneselect_Endo = intersect(PLS1_posi_gene, new_Endo);       
    geneselect_Micro = intersect(PLS1_posi_gene, new_Micro);     
    geneselect_Neuro_Ex = intersect(PLS1_posi_gene, new_Neuro_Ex);
    geneselect_Neuro_In = intersect(PLS1_posi_gene, new_Neuro_In);
    geneselect_Oligo = intersect(PLS1_posi_gene, new_Oligo);      
    geneselect_OPC = intersect(PLS1_posi_gene, new_OPC);          
    number_null(1,i) = length(geneselect_Astro);   
    number_null(2,i) = length(geneselect_Endo);   
    number_null(3,i) = length(geneselect_Micro);   
    number_null(4,i) = length(geneselect_Neuro_Ex);
    number_null(5,i) = length(geneselect_Neuro_In);
    number_null(6,i) = length(geneselect_Oligo);   
    number_null(7,i) = length(geneselect_OPC);    
    clear new_Astro new_Endo new_Micro new_Neuro_Ex new_Neuro_In new_Oligo new_OPC new_order new_cell_gene
    clear geneselect_Astro geneselect_Endo geneselect_Micro geneselect_Neuro_Ex geneselect_Neuro_In geneselect_Oligo geneselect_OPC
end     % 
    number_null = number_null';
    p = zeros(7,1);
    p(1,1) = length(find(number_null(:,1)>=40))/5000; % p
    p(2,1) = length(find(number_null(:,2)>=77))/5000; 
    p(3,1) = length(find(number_null(:,3)>=52))/5000; 
    p(4,1) = length(find(number_null(:,4)>=190))/5000;
    p(5,1) = length(find(number_null(:,5)>=149))/5000;
    p(6,1) = length(find(number_null(:,6)>=28))/5000; 
    p(7,1) = length(find(number_null(:,7)>=11))/5000;
    FDR = mafdr(p,'BH',true);      % FDR correction
clear 

      % PLS1- overlap number           
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:4296);

nperm = 5000;
number_null = zeros(7,5000);
for i = 1:nperm
    new_order = randperm(4296);
    new_cell_gene = cell_gene(new_order(:));
    new_Astro = new_cell_gene(1:661);
    new_Endo = new_cell_gene(662:1358);
    new_Micro = new_cell_gene(1359:1835);
    new_Neuro_Ex = new_cell_gene(1836:2829);
    new_Neuro_In = new_cell_gene(2830:3546);
    new_Oligo = new_cell_gene(3547:4170);
    new_OPC = new_cell_gene(4171:4296);
    geneselect_Astro = intersect(PLS1_nega_gene, new_Astro);
    geneselect_Endo = intersect(PLS1_nega_gene, new_Endo);
    geneselect_Micro = intersect(PLS1_nega_gene, new_Micro);
    geneselect_Neuro_Ex = intersect(PLS1_nega_gene, new_Neuro_Ex);
    geneselect_Neuro_In = intersect(PLS1_nega_gene, new_Neuro_In);
    geneselect_Oligo = intersect(PLS1_nega_gene, new_Oligo);
    geneselect_OPC = intersect(PLS1_nega_gene, new_OPC);
    number_null(1,i) = length(geneselect_Astro);
    number_null(2,i) = length(geneselect_Endo);
    number_null(3,i) = length(geneselect_Micro);
    number_null(4,i) = length(geneselect_Neuro_Ex);
    number_null(5,i) = length(geneselect_Neuro_In);
    number_null(6,i) = length(geneselect_Oligo);
    number_null(7,i) = length(geneselect_OPC);     %
    clear new_Astro new_Endo new_Micro new_Neuro_Ex new_Neuro_In new_Oligo new_OPC new_order new_cell_gene
    clear geneselect_Astro geneselect_Endo geneselect_Micro geneselect_Neuro_Ex geneselect_Neuro_In geneselect_Oligo geneselect_OPC
end
number_null = number_null';
p = zeros(7,1);
    p(1,1) = length(find(number_null(:,1)>=209))/5000;
    p(2,1) = length(find(number_null(:,2)>=82))/5000;
    p(3,1) = length(find(number_null(:,3)>=97))/5000;
    p(4,1) = length(find(number_null(:,4)>=172))/5000;
    p(5,1) = length(find(number_null(:,5)>=133))/5000;
    p(6,1) = length(find(number_null(:,6)>=47))/5000;
    p(7,1) = length(find(number_null(:,7)>=26))/5000;
    FDR = mafdr(p,'BH',true);
clear 





