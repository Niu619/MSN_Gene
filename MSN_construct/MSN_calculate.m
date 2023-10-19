function  MSN_calculate( xls )

data = importdata(xls);
area1 = data.area(2:end,2:end); 
volume1 = data.volume(2:end,2:end);
thickness1 = data.thickness(2:end,2:end);
thicknessstd1 = data.thicknessstd(2:end,2:end);
meancurv1 = data.meancurv(2:end,2:end);
gauscurv1 = data.gauscurv(2:end,2:end);
foldind1 = data.foldind(2:end,2:end);
curvind1 = data.curvind(2:end,2:end);

subname = dir(); 
subname(:) = [];
subnum = size(area1); 
for i = 1:subnum(1,1)
    subname(i).name = data.area(i+1,1);  
end
subname = rmfield(subname, {'folder', 'date', 'bytes', 'isdir', 'datenum'});
clear i 

% area(:,1) = [];volume(:,1) = [];thickness(:,1) = [];thicknessstd(:,1) = []; 
% meancurv(:,1) = [];gauscurv(:,1) = [];foldind(:,1) = [];curvind(:,1) = [];
[area,volume,thickness,thicknessstd,meancurv,gauscurv,foldind,curvind] = deal(zeros(subnum(1),subnum(2)));
for i = 1:subnum(1)
        for j = 1:subnum(2)
            area(i, j) = str2num(area1{i,j}); 
            volume(i, j) = str2num(volume1{i,j});
            thickness(i, j) = str2num(thickness1{i,j});
            thicknessstd(i, j) = str2num(thicknessstd1{i,j});
            meancurv(i, j) = str2num(meancurv1{i,j});
            gauscurv(i, j) = str2num(gauscurv1{i,j});
            foldind(i, j) = str2num(foldind1{i,j});
            curvind(i, j) = str2num(curvind1{i,j});
        end
end

z_area = zscore(transpose(area));                  
z_volume = zscore(transpose(volume));
z_thickness = zscore(transpose(thickness));
z_thicknessstd = zscore(transpose(thicknessstd));
z_meancurv = zscore(transpose(meancurv));
z_gauscurv = zscore(transpose(gauscurv));
z_foldind = zscore(transpose(foldind));
z_curvind = zscore(transpose(curvind));
clear area volume thickness thicknessstd meancurv gauscurv foldind curvind ij
clear area1 volume1 thickness1 thicknessstd1 meancurv1 gauscurv1 foldind1 curvind1

roinum = size(z_area);
for i = 1:subnum(1,1)                                
    single_sub_metric = zeros(roinum(1,1),8);
    single_sub_metric(:,1) = z_area(:,i);
    single_sub_metric(:,2) = z_volume(:,i);
    single_sub_metric(:,3) = z_thickness(:,i);
    single_sub_metric(:,4) = z_thicknessstd(:,i);
    single_sub_metric(:,5) = z_meancurv(:,i);
    single_sub_metric(:,6) = z_gauscurv(:,i);
    single_sub_metric(:,7) = z_foldind(:,i);
    single_sub_metric(:,8) = z_curvind(:,i);
    subname(i).struc_metric_eight = single_sub_metric';
    a = corr(subname(i).struc_metric_eight,subname(i).struc_metric_eight);
    subname(i).MS_metric_eight = a;
    clear single_sub_metric a 
end
    clear i

     
for i = 1:subnum(1,1)                                
    single_sub_metric = zeros(roinum(1,1),5);
    single_sub_metric(:,1) = z_area(:,i);
    single_sub_metric(:,2) = z_volume(:,i);
    single_sub_metric(:,3) = z_thickness(:,i);
    single_sub_metric(:,4) = z_meancurv(:,i);
    single_sub_metric(:,5) = z_gauscurv(:,i);
    subname(i).struc_metric_five = single_sub_metric';
    a = corr(subname(i).struc_metric_five,subname(i).struc_metric_five); 
    subname(i).MS_metric_five = a;
    clear single_sub_metric a
end
    clear i   
    save('MS_metric.mat','subname'); 
end

