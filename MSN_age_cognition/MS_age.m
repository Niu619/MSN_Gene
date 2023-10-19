%% Regional MS and age
 %%  Calculating regional MS for each subject
   
load('G:\Cam_CAN\test_struc\experiment\DK_308_out\MS_metric.mat');   
for i = 1:length(subname)          % 
    subname(i).MS_metric_eight(logical(eye(size(subname(i).MS_metric_eight))))=0;  
    subname(i).regional_MS_eight = sum(subname(i).MS_metric_eight)/(length(subname(i).MS_metric_eight)-1);
    subname(i).MS_metric_five(logical(eye(size(subname(i).MS_metric_five))))=0;
    subname(i).regional_MS_five = sum(subname(i).MS_metric_five)/(length(subname(i).MS_metric_five)-1);
end
    clear i
save('G:\Cam_CAN\test_struc\experiment\DK_308_out\MS_metric.mat','subname');   
% save('F:\2018\dlbs_imaging1\organized_imaging_data\out\3DT1\HCP_OUT\MS_metric.mat','subname'); dllas  


%% Five structural features    
clear, clc
%load('F:\2018\dlbs_imaging1\organized_imaging_data\out\3DT1\HCP_OUT\MS_metric.mat');DLBS
load('G:\Cam_CAN\test_struc\experiment\DK_308_out\MS_metric.mat');
for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
end
    clear i
meanMS_five = mean(totalMS_five);       % mean MSN
DK308_mask = spm_vol('G:\Cam_CAN\test_struc\experiment\DK_308_fsaverage\500mm_parcellation_308region\DK308_cortical_consecutive.nii');   % to image
[X,XYZ] = spm_read_vols(DK308_mask);
for i = 1:length(meanMS_five)       % 
    a = find(X==i);
    X(a(:)) = meanMS_five(1,i);
    clear a
end
clear i    
% for i = length(meanMS_five)+1:max(X(:))       % 
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V = DK308_mask;
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\meanMS_five.nii';
% V.fname = 'F:\2018\dlbs_imaging1\organized_imaging_data\out\3DT1\HCP_OUT\img_result\meanMS_five.nii';   DLBS
spm_write_vol(V,X);   
clear X XYZ 

% Partial correlation analysis£¬ sex¡¢education¡¢eTIV

covariate = zeros(454,3);
% covariate(:,1) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','Choice-RT','I2:I455');
% covariate(:,2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');
covariate(:,1:2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','G2:H455');
covariate(:,3) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\total_result454','eTIV','B1:B454');
age = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');

[r,p] = partialcorr(totalMS_five,age,covariate);
[X,XYZ] = spm_read_vols(DK308_mask);  % 
for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_five_uncorrect.nii';   % uncorrected
spm_write_vol(V,X);   
clear X XYZ

                % FDR correction
pvalue_fdr = mafdr(p,'BHFDR',1);
posisite = find(pvalue_fdr < 0.005);
negasite = find(pvalue_fdr >= 0.005);
r(negasite(:)) = 0;
                         
[X,XYZ] = spm_read_vols(DK308_mask);%  to image

for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       %
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_five_FDRcorrect.nii';   % FDR correction
spm_write_vol(V,X);   
clear X XYZ age covariate negasite p r posisite pvalue_fdr

% unregress eTIV

covariate = zeros(454,2);
% covariate(:,1) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','Choice-RT','I2:I455');
% covariate(:,2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');
covariate(:,1:2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','G2:H455');
% covariate(:,3) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\total_result454','eTIV','B1:B454');
age = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');

[r,p] = partialcorr(totalMS_five,age,covariate);
[X,XYZ] = spm_read_vols(DK308_mask); % 
for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       % 
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_five_uncorrect_uneTIV.nii';   %
spm_write_vol(V,X);   
clear X XYZ
            
%% Eight structural features
clear, clc
load('G:\Cam_CAN\test_struc\experiment\DK_308_out\MS_metric.mat');
for i = 1:length(subname)
    totalMS_eight(i,:) = subname(i).regional_MS_eight;
end
    clear i
meanMS_eight = mean(totalMS_eight);       % mean MSN
DK308_mask = spm_vol('G:\Cam_CAN\test_struc\experiment\DK_308_fsaverage\500mm_parcellation_308region\DK308_cortical_consecutive.nii');   % to image
[X,XYZ] = spm_read_vols(DK308_mask);
for i = 1:length(meanMS_eight)
    a = find(X==i);
    X(a(:)) = meanMS_eight(1,i);
    clear a
end
clear i 
% for i = length(meanMS_eight)+1:max(X(:))
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end    
% clear i    

V = DK308_mask;
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\meanMS_eight.nii';
spm_write_vol(V,X);   
clear X XYZ 
% Partial correlation analysis£¬ sex¡¢education¡¢eTIV

covariate = zeros(454,3);
% covariate(:,1) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','Choice-RT','I2:I455');
% covariate(:,2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');
covariate(:,1:2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','G2:H455');
covariate(:,3) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\total_result454','eTIV','B1:B454');
age = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');

[r,p] = partialcorr(totalMS_eight,age,covariate);
[X,XYZ] = spm_read_vols(DK308_mask);      % 

for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       % 
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_eight_uncorrect.nii';   % uncorrected
spm_write_vol(V,X);   
clear X XYZ

                % FDR correction
pvalue_fdr = mafdr(p,'BHFDR',1);
posisite = find(pvalue_fdr < 0.005);
negasite = find(pvalue_fdr >= 0.005);
r(negasite(:)) = 0;
                         
[X,XYZ] = spm_read_vols(DK308_mask);%  to image

for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       %
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_eight_FDRcorrect.nii';   %
spm_write_vol(V,X);   
clear X XYZ age covariate negasite p r posisite pvalue_fdr

% Partial correlation analysis£¬ unregress eTIV

covariate = zeros(454,2);
% covariate(:,1) = xlsread('G:\Cam_CAN\test_struc\experiment\HCP_out\behavior','Choice-RT','I2:I455');
% covariate(:,2) = xlsread('G:\Cam_CAN\test_struc\experiment\HCP_out\behavior','RT454','D2:D455');
covariate(:,1:2) = xlsread('G:\Cam_CAN\test_struc\experiment\HCP_out\behavior','RT454','G2:H455');
% covariate(:,3) = xlsread('G:\Cam_CAN\test_struc\experiment\HCP_out\total_result454','eTIV','B1:B454');
age = xlsread('G:\Cam_CAN\test_struc\experiment\HCP_out\behavior','RT454','D2:D455');

[r,p] = partialcorr(totalMS_eight,age,covariate);
[X,XYZ] = spm_read_vols(DK308_mask); % 
for i = 1:length(r)       % 
    a = find(X==i);
    X(a(:)) = r(i,1);
    clear a
end
clear i    
% for i = length(r)+1:max(X(:))       % 
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_eight_uncorrect_uneTIV.nii';   % 
spm_write_vol(V,X);   
clear X XYZ


%%              DLBS data
%%   Calculating regional MS for each subject 
   
load('H:\DLBS\3DT1\DK_308_out\MS_metric.mat');   
for i = 1:length(subname)          % 
    subname(i).MS_metric_eight(logical(eye(size(subname(i).MS_metric_eight))))=0;  
    subname(i).regional_MS_eight = sum(subname(i).MS_metric_eight)/(length(subname(i).MS_metric_eight)-1);
    subname(i).MS_metric_five(logical(eye(size(subname(i).MS_metric_five))))=0;
    subname(i).regional_MS_five = sum(subname(i).MS_metric_five)/(length(subname(i).MS_metric_five)-1);
end
    clear i
save('H:\DLBS\3DT1\DK_308_out\MS_metric.mat','subname');   

%% Five structural features
clear, clc
load('H:\DLBS\3DT1\DK_308_out\MS_metric.mat');
for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
    totalMS_eight(i,:) = subname(i).regional_MS_eight;
end
    clear i
meanMS_five = mean(totalMS_five);       % mean MSN
meanMS_eight = mean(totalMS_eight);
% DK308_mask = spm_vol('G:\Cam_CAN\test_struc\experiment\DK_308_fsaverage\500mm_parcellation_308region\DK308_cortical_consecutive.nii');   % to image
% [X,XYZ] = spm_read_vols(DK308_mask);
% for i = 1:length(meanMS_five)       % 
%     a = find(X==i);
%     X(a(:)) = meanMS_five(1,i);
%     clear a
% end
% clear i    
% for i = length(meanMS_five)+1:max(X(:))       % 
%     a = find(X==i);
%     X(a(:)) = 0;
%     clear a
% end
% clear i  
% V = DK308_mask;
% V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\meanMS_five.nii';
% % V.fname = 'F:\2018\dlbs_imaging1\organized_imaging_data\out\3DT1\HCP_OUT\img_result\meanMS_five.nii';
% spm_write_vol(V,X);   
% clear X XYZ 

% Partial correlation analysis£¬ sex¡¢education¡¢eTIV

covariate = zeros(304,3);
% covariate(:,1) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','Choice-RT','I2:I455');
% covariate(:,2) = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\behavior','RT454','D2:D455');
covariate(:,1:2) = xlsread('H:\DLBS\3DT1\DK_308_out\DLBS','Sheet2','D2:E305');
covariate(:,3) = xlsread('H:\DLBS\3DT1\DK_308_out\total_result304','eTIV','B2:B305');
age = xlsread('H:\DLBS\3DT1\DK_308_out\DLBS','Sheet2','B2:B305');

[r,p] = partialcorr(totalMS_five,age,covariate);    %  
% [X,XYZ] = spm_read_vols(DK308_mask);  % 
% for i = 1:length(r)       % 
%     a = find(X==i);
%     X(a(:)) = r(i,1);
%     clear a
% end
% clear i    
% % for i = length(r)+1:max(X(:))       
% %     a = find(X==i);
% %     X(a(:)) = 0;
% %     clear a
% % end
% % clear i  
% V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_five_uncorrect.nii';   % 
% spm_write_vol(V,X);   
% clear X XYZ
% 
%                 % FDR correction
% pvalue_fdr = mafdr(p,'BHFDR',1);
% posisite = find(pvalue_fdr < 0.005);
% negasite = find(pvalue_fdr >= 0.005);
% r(negasite(:)) = 0;
%                          
% [X,XYZ] = spm_read_vols(DK308_mask);%  
% 
% for i = 1:length(r)       % 
%     a = find(X==i);
%     X(a(:)) = r(i,1);
%     clear a
% end
% clear i    
% % for i = length(r)+1:max(X(:))       %
% %     a = find(X==i);
% %     X(a(:)) = 0;
% %     clear a
% % end
% % clear i  
% V.fname = 'G:\Cam_CAN\test_struc\experiment\DK_308_out\img_result\r_map_five_FDRcorrect.nii';   % 
% spm_write_vol(V,X);   
% clear X XYZ age covariate negasite p r posisite pvalue_fdr
% 












