%% Screen for genes that have both gene expression and cell type
   clear, clc 
% Astro
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Astro.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:1187);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);       % 
clear    
% Endo
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Endo.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:1253);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear   
% Micro
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Micro.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:1073);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear   
% Neuro-Ex
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-Ex.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:1276);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear   
% Neuro-In
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-In.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:985);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear
% Oligo
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Oligo.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:1208);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear
% OPC
cellTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\OPC.xlsx');  
PLS1Table = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\whole_gene.xlsx');
PLS1_gene = PLS1Table.PLS1_gene;
cell_gene = cellTable.cell_gene_total;
cell_gene = cell_gene(1:179);
overlap = intersect(PLS1_gene, cell_gene);   
overlap = char(overlap);   
clear

   %%The number of genes that actually overlap between PLS1+, PLS1- and each cell type, respectively.  matlab_2016b
   % Astro 
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Astro.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:661);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Astro.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Astro.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear 

 
   % Endo
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Endo.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:697);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Endo.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Endo.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear 
    
% Micro
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Micro.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:477);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Micro.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Micro.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Neuro-Ex
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-Ex.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:994);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-Ex.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-Ex.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Neuro-In
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-In.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:717);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-In.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Neuro-In.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Oligo
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Oligo.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:624);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Oligo.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\Oligo.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% OPC
geneTable = readtable('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\OPC.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene;
PLS1_posi_gene = PLS1_posi_gene(1:1095);
PLS1_nega_gene = geneTable.PLS1_nega_gene;
PLS1_nega_gene = PLS1_nega_gene(1:1727);
cell_gene = geneTable.cell_gene;
cell_gene = cell_gene(1:126);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\OPC.xlsx','Sheet1','B2:B1096');
PLS1_nega_ID = xlsread('G:\Cam_CAN\test_struc\experiment\DK_308_out\cell_out\OPC.xlsx','Sheet1','D2:D1728');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
                   %% DLBS data 
   % Astro    
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Astro.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:661);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Astro.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Astro.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear 

 
   % Endo
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Endo.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:697);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Endo.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Endo.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear 
    
% Micro
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Micro.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:477);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Micro.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Micro.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Neuro-Ex
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-Ex.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:994);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-Ex.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-Ex.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Neuro-In
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-In.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:717);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-In.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Neuro-In.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% Oligo
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\Oligo.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:624);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Oligo.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\Oligo.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear     
    
% OPC
geneTable = readtable('H:\DLBS\3DT1\DK_308_out\cell_out\OPC.xlsx');
PLS1_posi_gene = geneTable.PLS1_posi_gene(1:1289);
PLS1_nega_gene = geneTable.PLS1_nega_gene(1:1549);
cell_gene = geneTable.cell_gene(1:126);
[posi_overlap_gene, IND_PLS1_posi, IND_cell_posi] = intersect(PLS1_posi_gene, cell_gene);
[nega_overlap_gene, IND_PLS1_nega, IND_cell_nega] = intersect(PLS1_nega_gene, cell_gene);
overlap_number_posi = length(posi_overlap_gene);
overlap_number_nega = length(nega_overlap_gene);
PLS1_posi_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\OPC.xlsx','Sheet1','B2:B1290');
PLS1_nega_ID = xlsread('H:\DLBS\3DT1\DK_308_out\cell_out\OPC.xlsx','Sheet1','D2:D1550');
posi_overlap_ID = PLS1_posi_ID(IND_PLS1_posi(:));
nega_overlap_ID = PLS1_nega_ID(IND_PLS1_nega(:));
posi_overlap_gene = char(posi_overlap_gene);
nega_overlap_gene = char(nega_overlap_gene);
clear










