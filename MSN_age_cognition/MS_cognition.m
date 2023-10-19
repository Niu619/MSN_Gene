%% Regional MS and cognition
clear,clc
%  CAM-Can
load('H:\Cam_CAN\test_struc\experiment\DK_308_out\MS_metric.mat'); 
for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
end
    clear i
fluid_intelligence = xlsread('H:\Cam_CAN\test_struc\experiment\DK_308_out\behavior.xlsx','RT454','J2:J455');
[R,P] = corr(fluid_intelligence,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                  % fluid intelligence
 

mean_RT = xlsread('H:\Cam_CAN\test_struc\experiment\DK_308_out\behavior.xlsx','RT454','E2:E455');
[R_RT,P_RT] = corr(mean_RT,totalMS_five);
p_fdr_RT = mafdr(P_RT,'BHFDR',1);
posisite = find(p_fdr_RT < 0.005);
negasite = find(p_fdr_RT >= 0.005);
R_RT(negasite(:)) = 0;               % mRT

%   DLBS

load('H:\DALLAS\3DT1\DK_308_out\MS_metric.mat'); 
for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
end
    clear i
    
DC_total = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','DC_total','B2:B305');
[R,P] = corr(DC_total,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % DC_total  304


DSYM = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','DSYM','B2:B299');
subject = xlsread('H:\DALLAS\3DT1\DK_308_out\Dallas-orig.xlsx','304','A2:A305');
missing = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','DSYM','F2:F7');
site = zeros(length(missing),1);
for i = 1:length(missing)
    site(i,1) = find(subject == missing(i,1));  
end    
clear i

totalMS_five(site(:),:) = [];
[R,P] = corr(DSYM,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % DSYM  298
 
for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
end
    clear i
    
ETSLS_total = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','ETSLS_total','B2:B305');
[R,P] = corr(ETSLS_total,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % ETSLS_total   304

SOC = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','SOC','B2:B305');
[R,P] = corr(SOC,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % SOC   304

SST_SSRT = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','SST_SSRT','B2:B305');
[R,P] = corr(SST_SSRT,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % SST_SSRT  304

LNS_total = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','LNS_total','B2:B305');
[R,P] = corr(LNS_total,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % LNS_total  304 

SWM = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','SWM','B2:B305');
[R,P] = corr(SWM,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % SWM  304

HOP_immediate = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','HOP_immediate','B2:B305');
[R,P] = corr(HOP_immediate,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % HOP_immediate  304

VRM = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','VRM','B2:B304');
[R,P] = corr(VRM,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % VRM   303 

for i = 1:length(subname)
    totalMS_five(i,:) = subname(i).regional_MS_five;
end
    clear i
subject = xlsread('H:\DALLAS\3DT1\DK_308_out\Dallas-orig.xlsx','304','A2:A305');
missing = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','RAVENS','E2:E38');
site = zeros(length(missing),1);
for i = 1:length(missing)
    site(i,1) = find(subject == missing(i,1));  
end    
clear i
totalMS_five(site(:),:) = [];

RAVENS = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','RAVENS','B2:B268');
[R,P] = corr(RAVENS,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % RAVENS   267 

HOP_delay = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','HOP_delay','B2:B268');
[R,P] = corr(HOP_delay,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % HOP_delay   267 

HOP_recog = xlsread('H:\DALLAS\3DT1\DK_308_out\cognition.xlsx','HOP_recog','B2:B268');
[R,P] = corr(HOP_recog,totalMS_five);
p_fdr = mafdr(P,'BHFDR',1);
posisite = find(p_fdr < 0.005);
negasite = find(p_fdr >= 0.005);
R(negasite(:)) = 0;                % HOP_recog   267 















