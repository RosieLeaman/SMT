function a = plotData()
%
a = 0;

timeScale33 = 0.033;
timeScale15 = 0.015;
spaceScale = 0.097;
spaceScale2 = spaceScale*spaceScale;

% load data

bigFolder = '/Users/rml524/Google Drive/Spring 2018/tracking';
bigColIaFolder = '/Users/rml524/Google Drive/Spring 2018/tracking/colIa';

rfacStatFolder = [bigFolder,'/rfac stat/'];
rfacStatAF568Folder = [bigFolder,'/rfac stat AF568/'];
rfacStatEDTAFolder = [bigFolder,'/rfac stat EDTA/'];
rfacStatEGTAFolder = [bigFolder,'/rfac stat EGTA/'];
rfacLogFolder = [bigFolder,'/rfac log/'];
mgStatFolder = [bigFolder,'/MG1655 stat/'];
mgLogFolder = [bigFolder,'/MG1655 log/'];
mgStatEDTAFolder = [bigFolder,'/MG1655 stat EDTA/'];
mgStatEGTAFolder = [bigFolder,'/MG1655 stat EGTA/'];
mgStatUreaFolder = [bigFolder,'/MG1655 stat urea/'];
mgLogEDTAFolder = [bigFolder,'/MG1655 log EDTA/']; % NO TRACKS AS OF 12/4
mgLogUreaFolder = [bigFolder,'/MG1655 log urea/'];
impStatFolder = [bigFolder,'/imp stat/'];

% colIa

mgColIaFolder = [bigColIaFolder,'/MG1655/'];
mgColIaUreaFolder = [bigColIaFolder,'/MG1655 300mM urea/'];

% individual names

rfacStat33Loc = [rfacStatFolder,'rfacStat33Simple.mat'];
rfacStat15Loc = [rfacStatFolder,'rfacStat15Simple.mat'];
rfacStat33NoJumpsRemovedLoc = [rfacStatFolder,'rfacStat33SimpleNoJumpsRemoved.mat'];

rfacStat33AF568Loc = [rfacStatAF568Folder,'rfacStat33AF568Simple.mat'];
rfacStat15AF568Loc = [rfacStatAF568Folder,'rfacStat15AF568Simple.mat'];

rfacLog33Loc = [rfacLogFolder,'rfacLog33Simple.mat'];
rfacLog15Loc = [rfacLogFolder,'rfacLog15Simple.mat'];
rfacLog33NoJumpsRemovedLoc = [rfacLogFolder,'rfacLog33SimpleNoJumpsRemoved.mat'];

rfacStatEDTA33Loc = [rfacStatEDTAFolder,'rfacStatEDTA33Simple.mat'];
rfacStatEDTA15Loc = [rfacStatEDTAFolder,'rfacStatEDTA15Simple.mat'];

rfacStatEGTA33Loc = [rfacStatEGTAFolder,'rfacStatEGTA33Simple.mat'];
rfacStatEGTA15Loc = [rfacStatEGTAFolder,'rfacStatEGTA15Simple.mat'];

mgStat33Loc = [mgStatFolder,'mgStat33Simple.mat'];
mgStat15Loc = [mgStatFolder,'mgStat15Simple.mat'];

mgStatGaussian33Loc = [mgStatFolder,'mgStat_gaussian33Simple'];
mgStat33NoJumpsRemovedLoc = [mgStatFolder,'mgStat33SimpleNoJumpsRemoved.mat'];
mgStat33Min30FrameLoc = [mgStatFolder,'mgStat33Min30FrameSimple.mat'];
mgStat33Min30FrameGaussianLoc = [mgStatFolder,'mgStat33Min30FrameGaussianSimple.mat'];

mgLog33Loc = [mgLogFolder,'mgLog33Simple.mat'];
mgLog15Loc = [mgLogFolder,'mgLog15Simple.mat'];
mgLog33NoJumpsRemovedLoc = [mgLogFolder,'mgLog33SimpleNoJumpsRemoved.mat'];
mgLog33Min30FrameLoc = [mgLogFolder,'mgLog33Min30FrameSimple.mat'];
mgLogGaussian33Loc = [mgLogFolder,'mgLog33GaussianSimple.mat'];

mgStatEDTA33Loc = [mgStatEDTAFolder,'mgStatEDTA33Simple.mat'];
mgStatEDTA15Loc = [mgStatEDTAFolder,'mgStatEDTA15Simple.mat'];

mgStatEGTA33Loc = [mgStatEGTAFolder,'mgStatEGTA33Simple.mat'];
mgStatEGTA15Loc = [mgStatEGTAFolder,'mgStatEGTA15Simple.mat'];

mgLogEDTA33Loc = [mgLogEDTAFolder,'mgLogEDTA33Simple.mat'];

mgStatUrea33Loc = [mgStatUreaFolder,'mgStatUrea33Simple.mat'];
mgStatUrea15Loc = [mgStatUreaFolder,'mgStatUrea15Simple.mat'];

mgLogUrea33Loc = [mgLogUreaFolder,'mgLogUrea33Simple.mat'];
mgLogUrea15Loc = [mgLogUreaFolder,'mgLogUrea15Simple.mat'];

impStat33Loc = [impStatFolder,'impStat33Simple.mat'];
impStat15Loc = [impStatFolder,'impStat15Simple.mat'];

% colIa

mgColIa33Loc = [mgColIaFolder,'33ms/mgColIa33Simple.mat'];
mgColIaUrea33Loc = [mgColIaUreaFolder,'33ms/mgColIaUrea33Simple.mat'];

% plot data %%%%%%

mgStat15Data = loadData(mgStat15Loc);
mgLog15Data = loadData(mgLog15Loc);
mgStatEDTA15Data = loadData(mgStatEDTA15Loc);
mgStatEGTA15Data = loadData(mgStatEGTA15Loc);
mgStatUrea15Data = loadData(mgStatUrea15Loc);
mgLogUrea15Data = loadData(mgLogUrea15Loc);
%mgLogEDTAData = loadData(mgLogEDTA15Loc);
rfacStat15Data = loadData(rfacStat15Loc);
rfacLog15Data = loadData(rfacLog15Loc);
rfacStatEGTA15Data = loadData(rfacStatEGTA15Loc);
rfacStatEDTA15Data = loadData(rfacStatEDTA15Loc);
impStat15Data = loadData(impStat15Loc);

mgStatData = loadData(mgStat33Loc);
mgStatNoJumpsRemovedData = loadData(mgStat33NoJumpsRemovedLoc);
mgStatGaussianData = loadData(mgStatGaussian33Loc);
mgStatMin30FrameData = loadData(mgStat33Min30FrameLoc);
mgStatMin30FrameGaussianData = loadData(mgStat33Min30FrameGaussianLoc);
mgLogData = loadData(mgLog33Loc);
mgLogNoJumpsRemovedData = loadData(mgLog33NoJumpsRemovedLoc);
mgLogMin30FrameData = loadData(mgLog33Min30FrameLoc);
mgStatEDTAData = loadData(mgStatEDTA33Loc);
mgLogGaussianData = loadData(mgLogGaussian33Loc);
mgStatEGTAData = loadData(mgStatEGTA33Loc);
mgStatUreaData = loadData(mgStatUrea33Loc);
mgLogUreaData = loadData(mgLogUrea33Loc);
mgLogEDTAData = loadData(mgLogEDTA33Loc);
rfacStatData = loadData(rfacStat33Loc);
rfacStatNoJumpsRemovedData = loadData(rfacStat33NoJumpsRemovedLoc);
rfacStatAF568Data = loadData(rfacStat33AF568Loc);
rfacLogData = loadData(rfacLog33Loc);
rfacLogNoJumpsRemovedData = loadData(rfacLog33NoJumpsRemovedLoc);
rfacStatEGTAData = loadData(rfacStatEGTA33Loc);
rfacStatEDTAData = loadData(rfacStatEDTA33Loc);
impStatData = loadData(impStat33Loc);

% colIa
mgColIaData = loadData(mgColIa33Loc);
mgColIaUreaData = loadData(mgColIaUrea33Loc);

mgStat = getStepDownFromLoad(mgStatData);
mgStatNoJumpsRemoved = getStepDownFromLoad(mgStatNoJumpsRemovedData);
mgStatGaussian = getStepDownFromLoad(mgStatGaussianData);
mgStatMin30Frame = getStepDownFromLoad(mgStatMin30FrameData);
mgStatMin30FrameGaussian = getStepDownFromLoad(mgStatMin30FrameGaussianData);
mgLog = getStepDownFromLoad(mgLogData);
mgLogNoJumpsRemoved = getStepDownFromLoad(mgLogNoJumpsRemovedData);
mgLogMin30Frame = getStepDownFromLoad(mgLogMin30FrameData);
mgLogGaussian = getStepDownFromLoad(mgLogGaussianData);
mgStatEDTA = getStepDownFromLoad(mgStatEDTAData);
mgStatEGTA = getStepDownFromLoad(mgStatEGTAData);
mgStatUrea = getStepDownFromLoad(mgStatUreaData);
mgLogUrea = getStepDownFromLoad(mgLogUreaData);
rfacStat = getStepDownFromLoad(rfacStatData);
rfacStatNoJumpsRemoved = getStepDownFromLoad(rfacStatNoJumpsRemovedData);
rfacStatAF568 = getStepDownFromLoad(rfacStatAF568Data);
rfacLog = getStepDownFromLoad(rfacLogData);
rfacLogNoJumpsRemoved = getStepDownFromLoad(rfacLogNoJumpsRemovedData);
rfacStatEDTA = getStepDownFromLoad(rfacStatEDTAData);
rfacStatEGTA = getStepDownFromLoad(rfacStatEGTAData);
impStat = getStepDownFromLoad(impStatData);
mgColIa = getStepDownFromLoad(mgColIaData);
mgColIaUrea = getStepDownFromLoad(mgColIaUreaData);

[mgStatConf,mgStatDiff] = getConfinedDiffusiveFromLoad(mgStatData);
[mgStatNoJumpsConf,mgStatNoJumpsDiff] = getConfinedDiffusiveFromLoad(mgStatNoJumpsRemovedData);
[mgStatGaussianConf,mgStatGaussianDiff] = getConfinedDiffusiveFromLoad(mgStatGaussianData);
[mgStatMin30FrameConf,mgStatMin30FrameDiff] = getConfinedDiffusiveFromLoad(mgStatMin30FrameData);
[mgStatMin30FrameGaussianConf,mgStatMin30FrameGaussianDiff] = getConfinedDiffusiveFromLoad(mgStatMin30FrameGaussianData);
[mgLogConf,mgLogDiff] = getConfinedDiffusiveFromLoad(mgLogData);
[mgLogNoJumpsConf,mgLogNoJumpsDiff] = getConfinedDiffusiveFromLoad(mgLogNoJumpsRemovedData);
[mgLogMin30FrameConf,mgLogMin30FrameDiff] = getConfinedDiffusiveFromLoad(mgLogMin30FrameData);
[mgLogGaussianConf,mgLogGaussianDiff] = getConfinedDiffusiveFromLoad(mgLogGaussianData);
[mgStatEDTAConf,mgStatEDTADiff] = getConfinedDiffusiveFromLoad(mgStatEDTAData);
[mgStatEGTAConf,mgStatEGTADiff] = getConfinedDiffusiveFromLoad(mgStatEGTAData);
[mgStatUreaConf,mgStatUreaDiff] = getConfinedDiffusiveFromLoad(mgStatUreaData);
[mgLogUreaConf,mgLogUreaDiff] = getConfinedDiffusiveFromLoad(mgLogUreaData);
[mgLogEDTAConf,mgLogEDTADiff] = getConfinedDiffusiveFromLoad(mgLogEDTAData);
[rfacStatConf,rfacStatDiff] = getConfinedDiffusiveFromLoad(rfacStatData);
[rfacStatNoJumpsConf,rfacStatNoJumpsDiff] = getConfinedDiffusiveFromLoad(rfacStatNoJumpsRemovedData);
[rfacStatAF568Conf,rfacStatAF568Diff] = getConfinedDiffusiveFromLoad(rfacStatAF568Data);
[rfacLogConf,rfacLogDiff] = getConfinedDiffusiveFromLoad(rfacLogData);
[rfacLogNoJumpsConf,rfacLogNoJumpsDiff] = getConfinedDiffusiveFromLoad(rfacLogNoJumpsRemovedData);
[rfacStatEDTAConf,rfacStatEDTADiff] = getConfinedDiffusiveFromLoad(rfacStatEDTAData);
[rfacStatEGTAConf,rfacStatEGTADiff] = getConfinedDiffusiveFromLoad(rfacStatEGTAData);
[impStatConf,impStatDiff] = getConfinedDiffusiveFromLoad(impStatData);
[mgColIaConf,mgColIaDiff] = getConfinedDiffusiveFromLoad(mgColIaData);
[mgColIaUreaConf,mgColIaUreaDiff] = getConfinedDiffusiveFromLoad(mgColIaUreaData);

[mgStat15Conf,mgStat15Diff] = getConfinedDiffusiveFromLoad(mgStat15Data);
[mgLog15Conf,mgLog15Diff] = getConfinedDiffusiveFromLoad(mgLog15Data);
[mgStatEDTA15Conf,mgStat15EDTADiff] = getConfinedDiffusiveFromLoad(mgStatEDTA15Data);
[mgStatEGTA15Conf,mgStatEGTA15Diff] = getConfinedDiffusiveFromLoad(mgStatEGTA15Data);
[mgStatUrea15Conf,mgStatUrea15Diff] = getConfinedDiffusiveFromLoad(mgStatUrea15Data);
[mgLogUrea15Conf,mgLogUrea15Diff] = getConfinedDiffusiveFromLoad(mgLogUrea15Data);
[rfacStat15Conf,rfacStat15Diff] = getConfinedDiffusiveFromLoad(rfacStat15Data);
[rfacLog15Conf,rfacLog15Diff] = getConfinedDiffusiveFromLoad(rfacLog15Data);
[rfacStatEGTA15Conf,rfacStatEGTA15Diff] = getConfinedDiffusiveFromLoad(rfacStatEGTA15Data);
[rfacStatEDTA15Conf,rfacStatEDTA15Diff] = getConfinedDiffusiveFromLoad(rfacStatEDTA15Data);
[impStat15Conf,impStat15Diff] = getConfinedDiffusiveFromLoad(impStat15Data);


% spitOutQuantityData(mgStatData,'MG1655 stat. 33ms')
% disp('-----------')

x = 0:500;

temp = getMSDEqualLength(mgStatConf);
MSD = mean(temp);          
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['MG stat conf diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['MG stat conf diffusion coefficient early: ',num2str(polyvar(1)/4)]);


temp = getMSDEqualLength(mgLogConf);
MSD = mean(temp);          
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['MG log conf diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['MG log conf diffusion coefficient early: ',num2str(polyvar(1)/4)]);


temp = getMSDEqualLength(rfacStatConf);
MSD = mean(temp);          
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['rfac stat conf diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['rfac stat conf diffusion coefficient early: ',num2str(polyvar(1)/4)]);


temp = getMSDEqualLength(rfacLogConf);
MSD = mean(temp);          
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['rfac exp conf diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['rfac exp conf diffusion coefficient early: ',num2str(polyvar(1)/4)]);

 
temp = getMSDEqualLength(mgStatEDTAConf);
MSD = mean(temp);
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['MG stat EDTA conf diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['MG stat EDTA conf diffusion coefficient early: ',num2str(polyvar(1)/4)]);


temp = getMSDEqualLength(mgStatEDTADiff);
MSD = mean(temp);
timeLinear = calcTimeToNotLinear(MSD)-1;
shortX = x(1:timeLinear)*timeScale33;
polyvar = polyfit(shortX,MSD(1:timeLinear)*spaceScale2,1);
disp(['MG stat EDTA diff diffusion coefficient: ',num2str(polyvar(1)/4)]);
shortX = x(1:4)*timeScale33;
polyvar = polyfit(shortX,MSD(1:4)*spaceScale2,1);
disp(['MG stat EDTA diff diffusion coefficient early: ',num2str(polyvar(1)/4)]);

% plot a step size probability distribution

allSteps1 = calcNStepProbabilityDistrbnCombined(mgStatConf,1);
allSteps2 = calcNStepProbabilityDistrbnCombined(mgStatConf,2);
allSteps10 = calcNStepProbabilityDistrbnCombined(mgStatConf,10);

figure;
subplot(1,3,1)
histogram(allSteps1)
title('1-step')
subplot(1,3,2)
histogram(allSteps2)
title('2-step')
subplot(1,3,3)
histogram(allSteps10)
title('10-step')

figure;
hold on;
histogram(allSteps1,'normalization','probability')
histogram(allSteps2,'normalization','probability')
histogram(allSteps10,'normalization','probability')

figure;
cdfplot(allSteps1)
title('just conf')

stepsMGEDTAConf = calcNStepProbabilityDistrbnCombined(mgStatEDTAConf,1);
stepsMGEDTADiff = calcNStepProbabilityDistrbnCombined(mgStatEDTADiff,1);
stepsMGEDTABoth = calcNStepProbabilityDistrbnCombined(mgStatEDTA,1);

figure;
hold on;
histogram(stepsMGEDTAConf,'normalization','probability')
histogram(stepsMGEDTADiff,'normalization','probability')
histogram(stepsMGEDTABoth,'normalization','probability')
legend('conf','diff','both')

[fConf,xConf] = ecdf(stepsMGEDTAConf);
[fDiff,xDiff] = ecdf(stepsMGEDTADiff);
[fBoth,xBoth] = ecdf(stepsMGEDTABoth);

figure; hold on;
plot(xConf,fConf,'linewidth',2)
plot(xDiff,fDiff,'linewidth',2)
plot(xBoth,fBoth,'linewidth',2)
legend('conf','diff','both')
title('MG EDTA')

stepsMGEGTAConf = calcNStepProbabilityDistrbnCombined(mgStatEGTAConf,1);
stepsMGEGTADiff = calcNStepProbabilityDistrbnCombined(mgStatEGTADiff,1);
stepsMGEGTABoth = calcNStepProbabilityDistrbnCombined(mgStatEGTA,1);

[fConf,xConf] = ecdf(stepsMGEGTAConf);
[fDiff,xDiff] = ecdf(stepsMGEGTADiff);
[fBoth,xBoth] = ecdf(stepsMGEGTABoth);

figure; hold on;
plot(xConf,fConf,'linewidth',2)
plot(xDiff,fDiff,'linewidth',2)
plot(xBoth,fBoth,'linewidth',2)
legend('conf','diff','both')
title('MG EGTA')

stepsMGConf = calcNStepProbabilityDistrbnCombined(mgStatConf,1);
stepsMGDiff = calcNStepProbabilityDistrbnCombined(mgStatDiff,1);
stepsMGBoth = calcNStepProbabilityDistrbnCombined(mgStat,1);

[fConf,xConf] = ecdf(stepsMGConf);
[fDiff,xDiff] = ecdf(stepsMGDiff);
[fBoth,xBoth] = ecdf(stepsMGBoth);

figure; hold on;
plot(xConf,fConf,'linewidth',2)
plot(xDiff,fDiff,'linewidth',2)
plot(xBoth,fBoth,'linewidth',2)
legend('conf','diff','both')
title('MG')

% let's fit the data wooo

xcoords = xConf.^2;
ycoords = log(1-fConf);

figure;
plot(xcoords,ycoords)

MSD1 = zeros(1,30);
index1 = 1;
MSD2 = zeros(1,30);
index2 = 1;
for i=1:numel(mgStatMin30FrameConf)
    if numel(mgStatMin30FrameConf(i).MSD) < 50
        MSD1(index1,:) = mgStatMin30FrameConf(i).MSD(1:30);
        index1 = index1 + 1;
    else
        MSD2(index2,:) = mgStatMin30FrameConf(i).MSD(1:30);
        index2 = index2 + 1;
    end
end

figure; hold on;
plot(mean(MSD1)*spaceScale2,'linewidth',2)
plot(mean(MSD2)*spaceScale2,'linewidth',2)
legend(['< 50, N=',num2str(size(MSD1,1))],['>= 50, N=',num2str(size(MSD2,1))])
title('mg stat')

figure; hold on;
counts = zeros(1,7);
countIndex = 1;
for j=[35,40,45,50,55,60,75]
    MSD = zeros(1,30);
    index = 1;
    for i=1:numel(mgLogMin30FrameConf)
        if numel(mgLogMin30FrameConf(i).MSD) < j
            MSD(index,:) = mgLogMin30FrameConf(i).MSD(1:30);
            index = index + 1;
        end
    end
    counts(countIndex) = index;
    countIndex = countIndex + 1;
    plot(mean(MSD)*spaceScale2,'linewidth',2);
end
legend(['<35 N=',num2str(counts(1))],['<40 N=',num2str(counts(2))],['<45 N=',num2str(counts(3))],['<50 N=',num2str(counts(4))],['<55 N=',num2str(counts(5))],['<60 N=',num2str(counts(6))],['<75 N=',num2str(counts(7))])

figure; hold on;
bounds = [0,35,45,55,65,75,85,300];
counts = zeros(1,8);
countIndex = 1;
for j= 2:numel(bounds)
    MSD = zeros(1,30);
    index = 1;
    for i=1:numel(mgLogMin30FrameConf)
        if numel(mgLogMin30FrameConf(i).MSD) > bounds(j-1) && numel(mgLogMin30FrameConf(i).MSD) <= bounds(j)
            MSD(index,:) = mgLogMin30FrameConf(i).MSD(1:30);
            index = index + 1;
        end
    end
    counts(countIndex) = index;
    countIndex = countIndex + 1;
    plot(mean(MSD)*spaceScale2,'linewidth',2);
end
legend(['<35 N=',num2str(counts(1))],['35-45 N=',num2str(counts(2))],['45-55 N=',num2str(counts(3))],['55-65 N=',num2str(counts(4))],['65-75 N=',num2str(counts(5))],['75-85 N=',num2str(counts(6))],['>85 N=',num2str(counts(7))])
set(gca,'fontsize',16);

% compare 15ms with 33ms

[mgStat15Conf,mgStat15Diff] = getConfinedDiffusiveFromLoad(mgStat15Data);
[mgLog15Conf,mgLog15Diff] = getConfinedDiffusiveFromLoad(mgLog15Data);
[mgStatEDTA15Conf,mgStatEDTA15Diff] = getConfinedDiffusiveFromLoad(mgStatEDTA15Data);
[mgStatEGTA15Conf,mgStatEGTA15Diff] = getConfinedDiffusiveFromLoad(mgStatEGTA15Data);
[mgStatUrea15Conf,mgStatUrea15Diff] = getConfinedDiffusiveFromLoad(mgStatUrea15Data);
[mgLogUrea15Conf,mgLogUrea15Diff] = getConfinedDiffusiveFromLoad(mgLogUrea15Data);
[rfacStat15Conf,rfacStat15Diff] = getConfinedDiffusiveFromLoad(rfacStat15Data);
[rfacLog15Conf,rfacLog15Diff] = getConfinedDiffusiveFromLoad(rfacLog15Data);
[rfacStatEGTA15Conf,rfacStatEGTA15Diff] = getConfinedDiffusiveFromLoad(rfacStatEGTA15Data);
[rfacStatEDTA15Conf,rfacStatEDTA15Diff] = getConfinedDiffusiveFromLoad(rfacStatEDTA15Data);
[impStat15Conf,impStat15Diff] = getConfinedDiffusiveFromLoad(impStat15Data);

stepsMGConf = calcNStepProbabilityDistrbnCombined(mgStatConf,1);
stepsMG15Conf = calcNStepProbabilityDistrbnCombined(mgStat15Conf,1);

figure;
hold on;
histogram(stepsMGConf,15,'normalization','probability')
histogram(stepsMG15Conf,15,'normalization','probability')
legend('33ms','15ms')

stepsimpConf = calcNStepProbabilityDistrbnCombined(mgStatConf,1);
stepsimp15Conf = calcNStepProbabilityDistrbnCombined(mgStat15Conf,1);

figure;
hold on;
h33 = histogram(stepsimpConf,15,'normalization','probability');
h15 = histogram(stepsimp15Conf,h33.BinEdges,'normalization','probability');
legend('33ms','15ms')
title('1-step')

stepsimpConf = calcNStepProbabilityDistrbnCombined(mgStatConf,2);
stepsimp15Conf = calcNStepProbabilityDistrbnCombined(mgStat15Conf,2);

figure;
hold on;
h33 = histogram(stepsimpConf,15,'normalization','probability');
h15 = histogram(stepsimp15Conf,h33.BinEdges,'normalization','probability');
legend('33ms','15ms')
title('2-step')

steps33Conf = calcNStepProbabilityDistrbnCombined(mgStatConf,10);
steps15Conf = calcNStepProbabilityDistrbnCombined(mgStat15Conf,10);

figure;
hold on;
h33 = histogram(steps33Conf,15,'normalization','probability');
h15 = histogram(steps15Conf,h33.BinEdges,'normalization','probability');
legend('33ms','15ms')
title('10-step')

figure;
dataCell = {mgStatConf,mgLogConf,rfacStatConf,rfacLogConf};
legendVals = {'MG1655 stat.','MG1655 exp.','waaC- stat.','waaC- exp.'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStat15Conf,mgLog15Conf,rfacStat15Conf,rfacLog15Conf};
legendVals = {'MG1655 stat.','MG1655 exp.','waaC- stat.','waaC- exp.'};
plotMSDerrorCell(dataCell,timeScale15*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStatConf,mgLogConf,rfacStatConf,rfacLogConf};
legendVals = {'MG1655 stat.','MG1655 exp.','waaC- stat.','waaC- exp.'};
plotMSDerrorCellFromOrigin(dataCell,timeScale33,spaceScale2,legendVals)

figure;
dataCell = {mgStat15Conf,mgLog15Conf,rfacStat15Conf,rfacLog15Conf};
legendVals = {'MG1655 stat.','MG1655 exp.','waaC- stat.','waaC- exp.'};
plotMSDerrorCellFromOrigin(dataCell,timeScale15,spaceScale2,legendVals)

figure;
subplot(2,2,1)
plotMSDLASA(mgStatConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat.}','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgLogConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 exp.}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatConf,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat.}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacLogConf,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- exp.}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat.} FAKE','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgLogConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 exp.}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatConf,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat.}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacLogConf,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- exp.}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatDiff,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat.}','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgLogDiff,timeScale33,spaceScale,0)
title('\textbf{MG1655 exp.}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatDiff,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat.}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacLogDiff,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- exp.}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatDiff,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat.} FAKE','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgLogDiff,timeScale33,spaceScale,1)
title('\textbf{MG1655 exp.}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatDiff,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat.}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacLogDiff,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- exp.}','Interpreter','Latex')


% urea
figure;
dataCell = {mgStatConf,mgLogConf,mgStatUreaConf,mgLogUreaConf};
legendVals = {'MG1655 stat.','MG1655 exp.','MG1655 stat. + 300mM urea','MG1655 exp. + 300mM urea'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStatDiff,mgLogDiff,mgStatUreaDiff,mgLogUreaDiff};
legendVals = {'MG1655 stat.','MG1655 exp.','MG1655 stat. + 300mM urea','MG1655 exp. + 300mM urea'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
subplot(1,2,1)
plotMSDLASA(mgStatUreaConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat. + 300mM urea}','Interpreter','Latex')
subplot(1,2,2)
plotMSDLASA(mgLogUreaConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 exp. + 300mM urea}','Interpreter','Latex')

figure;
subplot(1,2,1)
plotMSDLASA(mgStatUreaConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 300mM urea} FAKE','Interpreter','Latex')
subplot(1,2,2)
plotMSDLASA(mgLogUreaConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 exp. + 300mM urea}','Interpreter','Latex')

figure;
dataCell = {mgStatConf,mgStatEDTAConf,mgStatEDTADiff};
legendVals = {'MG1655 stat.','MG1655 stat. + 100mM EDTA','MG1655 stat. + 100mM EDTA Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
subplot(1,2,1)
plotMSDLASA(mgStatEDTAConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EDTA} FAKE','Interpreter','Latex')
subplot(1,2,2)
plotMSDLASA(mgStatEDTADiff,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EDTA Brownian}','Interpreter','Latex')

figure;
dataCell = {mgStatConf,impStatConf,impStatDiff};
legendVals = {'MG1655 stat.','imp stat.','imp stat. Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
subplot(1,2,1)
plotMSDLASA(impStatConf,timeScale33,spaceScale,0)
title('\textbf{imp stat.}','Interpreter','Latex')
subplot(1,2,2)
plotMSDLASA(impStatDiff,timeScale33,spaceScale,0)
title('\textbf{imp stat. Brownian}','Interpreter','Latex')

figure;
subplot(1,2,1)
plotMSDLASA(impStatConf,timeScale33,spaceScale,1)
title('\textbf{imp stat.} FAKE','Interpreter','Latex')
subplot(1,2,2)
plotMSDLASA(impStatDiff,timeScale33,spaceScale,1)
title('\textbf{imp stat. Brownian}','Interpreter','Latex')

figure;
dataCell = {mgStatConf,mgStatEDTAConf,impStatConf};
legendVals = {'MG1655 stat.','MG1655 stat. + 100mM EDTA','imp stat.'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStatConf,mgStatEDTAConf,mgStatEGTAConf,mgStatEDTADiff,mgStatEGTADiff};
legendVals = {'MG1655 stat.','MG1655 stat. + 100mM EDTA','MG1655 stat. + 100mM EGTA','MG1655 stat. + 100mM EDTA Brownian','MG1655 stat. + 100mM EGTA Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {rfacStatConf,rfacStatEDTAConf,rfacStatEGTAConf,rfacStatEDTADiff,rfacStatEGTADiff};
legendVals = {'waaC- stat.','waaC- stat. + 10mM EDTA','waaC- stat. + 10mM EGTA','waaC- stat. + 10mM EDTA Brownian','waaC- stat. + 10mM EGTA Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
subplot(2,2,1)
plotMSDLASA(mgStatEDTAConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat. + 100mM EDTA}','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgStatEGTAConf,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat. + 100mM EGTA}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatEDTAConf,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat. + 10mM EDTA}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacStatEGTAConf,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat. + 10mM EGTA}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatEDTAConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EDTA} FAKE','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgStatEGTAConf,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EGTA}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatEDTAConf,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat. + 10mM EDTA}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacStatEGTAConf,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat. + 10mM EGTA}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatEDTADiff,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat. + 100mM EDTA}','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgStatEGTADiff,timeScale33,spaceScale,0)
title('\textbf{MG1655 stat. + 100mM EGTA}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatEDTADiff,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat. + 10mM EDTA}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacStatEGTADiff,timeScale33,spaceScale,0)
title('\textbf{\textit{waaC}- stat. + 10mM EGTA}','Interpreter','Latex')

figure;
subplot(2,2,1)
plotMSDLASA(mgStatEDTADiff,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EDTA} FAKE','Interpreter','Latex')
subplot(2,2,2)
plotMSDLASA(mgStatEGTADiff,timeScale33,spaceScale,1)
title('\textbf{MG1655 stat. + 100mM EGTA}','Interpreter','Latex')
subplot(2,2,3)
plotMSDLASA(rfacStatEDTADiff,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat. + 10mM EDTA}','Interpreter','Latex')
subplot(2,2,4)
plotMSDLASA(rfacStatEGTADiff,timeScale33,spaceScale,1)
title('\textbf{\textit{waaC}- stat. + 10mM EGTA}','Interpreter','Latex')

figure;
dataCell = {mgStatConf,impStatConf};
legendVals = {'MG1655 stat.','imp stat.'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStatDiff,impStatDiff};
legendVals = {'MG1655 stat.','imp stat.'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {mgStatDiff,mgStatEDTADiff,mgStatEGTADiff};
legendVals = {'MG1655 stat. Brownian','MG1655 stat. + 100mM EDTA Brownian','MG1655 stat. + 100mM EGTA Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

figure;
dataCell = {rfacStatDiff,rfacStatEDTADiff,rfacStatEGTADiff};
legendVals = {'waaC- stat. Brownian','waaC- stat. + 10mM EDTA Brownian','waaC- stat. + 10mM EGTA Brownian'};
plotMSDerrorCell(dataCell,timeScale33*ones(numel(dataCell)),spaceScale2*ones(numel(dataCell)),legendVals)

dataCell = {mgStat,mgStatEDTA,mgStatEGTA,mgStatUrea,rfacStat,rfacStatEDTA,rfacStatEGTA,impStat};
a = getPercDiffusiveWithError(dataCell);

end

%%%%%%%%%%%%%%%%%%%%
% helper functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%

function newStruct = loadData(loc)
    data = load(loc);
    newStruct = data.dataStruct;
end

function newStruct = getWholeTracks(struct)
    newStruct = struct([]);
    index = 1;
    
    % note here also reject trajectories which are too short, still not
    % sure where these come from
    
    for i=1:numel(struct)
        if struct(i).sameTracks == 0 && struct(i).secondPiece == 0 && numel(struct(i).MSD >= 40)
            newStruct(index) = struct(i);
            index = index + 1;
        end
    end
end

function newStruct = getNonBackgroundTracks(struct)
    newStruct = struct([]);
    index = 1;
    
    for i=1:numel(struct)
        if mean(struct(i).MSD(4:end))*0.097*0.097 > 0.008
            newStruct(index) = struct(i);
            index = index + 1;
        end
    end
end

function newStruct = getStepDown(struct)
    newStruct = struct([]);
    index = 1;
    
    for i=1:numel(struct)
        % there is a step && the last step is down
        if numel(struct(i).stepSizes) > 0 && struct(i).stepSizes(end) < 0
            newStruct(index) = struct(i);
            index = index + 1;
        end
    end
end

function [confined,diffusive] = getConfinedDiffusive(struct)
    confined = struct([]);
    indexConfined = 1;
    
    diffusive = struct([]);
    indexDiffusive = 1;
    
    for i=1:numel(struct)
        timeToNotLinear = calcTimeToNotLinear(struct(i).MSD);
        if timeToNotLinear > 10
            diffusive(indexDiffusive) = struct(i);
            indexDiffusive = indexDiffusive + 1;
        else
            confined(indexConfined) = struct(i);
            indexConfined = indexConfined + 1;
        end
    end
end

function [confined,diffusive] = getConfinedDiffusiveFromLoad(struct)
    wholeTracks = getWholeTracks(struct);
    aboveBackground = getNonBackgroundTracks(wholeTracks);
    withStepDown = getStepDown(aboveBackground);
    
    % check the sizes of the MSD!
    newStepDown = struct([]);
    index = 1;
    for i=1:numel(withStepDown)
        if numel(withStepDown(i).MSD) >= 30
            newStepDown(index) = withStepDown(i);
            index = index + 1;
        end
    end
    
    [confined,diffusive] = getConfinedDiffusive(newStepDown);
end

function withStepDown = getStepDownFromLoad(struct)
    wholeTracks = getWholeTracks(struct);
    aboveBackground = getNonBackgroundTracks(wholeTracks);
    withStepDown = getStepDown(aboveBackground);
end

function [group0,group1,group2,group3] = getGroupsFromLoad(struct)
    wholeTracks = getWholeTracks(struct);
    aboveBackground = getNonBackgroundTracks(wholeTracks);
    
    newStruct = struct([]);
    index = 1;
    for i=1:numel(aboveBackground)
        if numel(aboveBackground(i).MSD) >= 30
            newStruct(index) = aboveBackground(i);
            index = index + 1;
        end
    end
    
    [group0,group1,group2,group3] = getGroups(newStruct);
end

function [pole,midcell] = getPoleMidcell(struct)
    pole = struct([]);
    indexPole = 1;
    
    midcell = struct([]);
    indexMidcell = 1;
    
    for i=1:numel(struct)
        if ~isnan(struct(i).top)
            if struct(i).alpha < 0.25 || struct(i).alpha > 0.75
                % pole
                
                pole(indexPole) = struct(i);
                indexPole = indexPole + 1;
                
            else
                % midcell
                
                midcell(indexMidcell) = struct(i);
                indexMidcell = indexMidcell + 1;
                
            end
        end
    end
end

% returns a STRING with the number of entries in struct
function number = num(struct)
    number = [' N = ',num2str(numel(struct))];
end

function [group0,group1,group2,group3] = getGroups(struct)
    group0 = struct([]);
    indexGroup0 = 1;
    
    group1 = struct([]);
    indexGroup1 = 1;
    
    group2 = struct([]);
    indexGroup2 = 1;
    
    group3 = struct([]);
    indexGroup3 = 1;
    
    for i=1:numel(struct)
        if struct(i).group == 0
            group0(indexGroup0) = struct(i);
            indexGroup0 = indexGroup0 + 1;
        elseif struct(i).group == 1
            group1(indexGroup1) = struct(i);
            indexGroup1 = indexGroup1 + 1;
        elseif struct(i).group == 2
            group2(indexGroup2) = struct(i);
            indexGroup2 = indexGroup2 + 1;
        else
            group3(indexGroup3) = struct(i);
            indexGroup3 = indexGroup3 + 1;
        end
    end
end

function num = getNumExperiments(struct)
    experimentIDs = [struct.experimentID];
    
    num = max(experimentIDs);
    
end

% get all the tracks from matching experiments
% note that this returns a cell of structs, not an array of structs like
% the other get functions
function [experiments,experimentNames] = getExperiments(struct)

    numExperiments = getNumExperiments(struct);
    
    experiments = cell(1,numExperiments);
    experimentNames = cell(1,numExperiments);
    
    for i=1:numExperiments
        experiments{i} = struct([]);
        index = 1;
        for j=1:numel(struct)
            if struct(j).experimentID == i
                % get the name. This is the first 6 characters of the file name
                % always.
                experimentNames{i} = struct(j).cellName(1:6);
                experiments{i}(index) = struct(j);
                index = index + 1;
            end
        end
        
    end

end

function plotReplicates(data,saveLoc,timeScale,spaceScale)
    % get the confined and diffusive bits
    [confined,diffusive] = getConfinedDiffusiveFromLoad(data);
    
    % deal with confined, get the experiments   
    [experiments,experimentNames] = getExperiments(confined);
    saveName = [saveLoc,'-confined.png'];
    
    figure;
    plotMSDerrorCell(experiments,timeScale,spaceScale,experimentNames);
    
    MSD = getMSDEqualLength(confined);
    if size(MSD,1) > 1
        numPoints = size(MSD,2);   
        avg = mean(MSD);

        x = 0:(numPoints-1);
        x = x*timeScale;

        pMean = plot(x,avg*spaceScale,'k--','linewidth',2);
        xlabel('Time (s)','Interpreter','Latex')
        ylabel('MSD ($\mu m^2$)','Interpreter','Latex')
        pMean.DisplayName = 'mean';
    end
    
    saveas(gcf,saveName);
    close(gcf);
    
    [experiments,experimentNames] = getExperiments(diffusive);
    saveName = [saveLoc,'-diffusive.png'];
    
    figure;
    plotMSDerrorCell(experiments,timeScale,spaceScale,experimentNames);
    
    MSD = getMSDEqualLength(diffusive);
    if size(MSD,1) > 1
        numPoints = size(MSD,2);   
        avg = mean(MSD);

        x = 0:(numPoints-1);
        x = x*timeScale;

        pMean = plot(x,avg*spaceScale,'k--','linewidth',2);
        xlabel('Time (s)','Interpreter','Latex')
        ylabel('MSD ($\mu m^2$)','Interpreter','Latex')
        pMean.DisplayName = 'mean';
    end
    
    saveas(gcf,saveName);
    close(gcf);
    
    % save info to file too
    spitOutQuantityDataToFile(data,saveLoc,[saveLoc,'-trajCounts.txt'])
end

function plotReplicatesFromOrigin(data,saveLoc,timeScale,spaceScale)
    % get the confined and diffusive bits
    [confined,diffusive] = getConfinedDiffusiveFromLoad(data);
    
    % deal with confined, get the experiments   
    [experiments,experimentNames] = getExperiments(confined);
    saveName = [saveLoc,'-confined.png'];
    MSD = getMSDEqualLengthFromOrigin(confined);
    
    figure;
    plotMSDerrorCellFromOrigin(experiments,timeScale,spaceScale,experimentNames);
    numPoints = size(MSD,2);
    
    avg = mean(MSD);
    
    x = 0:(numPoints-1);
    x = x*timeScale;
    
    plot(x,avg*spaceScale,'k--','linewidth',2)
    saveas(gcf,saveName);
    close(gcf);
    
    [experiments,experimentNames] = getExperiments(diffusive);
    saveName = [saveLoc,'-diffusive.png'];
    MSD = getMSDEqualLengthFromOrigin(diffusive);
    
    figure;
    plotMSDerrorCellFromOrigin(experiments,timeScale,spaceScale,experimentNames);
    numPoints = size(MSD,2);
    
    avg = mean(MSD);
    
    x = 0:(numPoints-1);
    x = x*timeScale;
    
    plot(x,avg*spaceScale,'k--','linewidth',2)
    saveas(gcf,saveName);
    close(gcf);
end

function compare15ms33ms(dataCell,saveName)
    figure;
    legendVals = {'33ms','15ms'};
    plotMSDerrorCell(dataCell,[0.033,0.015],[0.097*0.097,0.097*0.097],legendVals)
    %plotMSDerrorCell(dataCell,[1,1],[1,1],legendVals)
    xlabel('Time (frames)'),ylabel('MSD (px^2)');
    saveas(gcf,saveName);
    close(gcf);
end

function initCount = calcTimeToNotLinear(MSD)
    initCount = 3;
    finished = 0;
    x = 0:(numel(MSD)-1);
    while finished == 0 && initCount < numel(MSD)
        initCount = initCount + 1;
        
        shortX = x(1:initCount);
        
        polyvar = polyfit(shortX,MSD(1:initCount),1);
        
        ydiffs = MSD(1:initCount) - polyval(polyvar,shortX);
        SSresid = sum(ydiffs.^2);
        SStotal = (length(MSD(1:initCount))-1) * var(MSD(1:initCount));
        rsq = 1 - SSresid/SStotal;

        if rsq < 0.9
            finished = 1;
        end
    end
end

function MSD = getMSDEqualLength(struct)
    % 43 is the minimum length a trajectory can be
    MSD = zeros(numel(struct),40);
    
    for i=1:numel(struct)
        MSD(i,:) = struct(i).MSD(1:40);
    end
end

function MSD = getMSDEqualLengthFromOrigin(struct)
    % 43 is the minimum length a trajectory can be
    MSD = zeros(numel(struct),30);
    
    for i=1:numel(struct)
        MSD(i,:) = struct(i).MSD2(1:30);
    end
end

function [MSDLA,MSDSA] = getShortAxisLongAxisMSDEqualLength(struct)
    % 47 is the minimum length a trajectory can be
    MSDLA = zeros(1,23);
    MSDSA = zeros(1,23);
    
    count = 0;
    for i=1:numel(struct)
        if ~isnan(struct(i).top)
            count = count + 1;
            
            MSDLA(count,:) = struct(i).MSDlongAxis(1:23);
            MSDSA(count,:) = struct(i).MSDshortAxis(1:23);
        end
    end
    
    if count == 0
        MSDLA = NaN;
        MSDSA = NaN;
    end
end

function [MSDLA,MSDSA] = getFakeShortAxisLongAxisMSDEqualLength(struct)
    try
    % 47 is the minimum length a trajectory can be
    MSDLA = zeros(1,43);
    MSDSA = zeros(1,43);
    
    count = 0;
    for i=1:numel(struct)
        if ~isnan(struct(i).top)
            count = count + 1;
            
            MSDLA(count,:) = struct(i).MSDfakeLongAxis(1:43);
            MSDSA(count,:) = struct(i).MSDfakeShortAxis(1:43);
        end
    end
    
    if count == 0
        MSDLA = NaN;
        MSDSA = NaN;
    end
    catch
        struct(i).cellName
    end
end

function plotMSDerror(MSD,timeScale,spaceScale)
    numPoints = size(MSD,2);
    numTrajs = size(MSD,1);
    
    avg = mean(MSD);
    stdev = std(MSD);
    sem = stdev/sqrt(numTrajs);
    
    x = 0:(numPoints-1);
    x = x*timeScale;
    
    errorbar(x,avg*spaceScale,sem*spaceScale,'x-','linewidth',2)
    
end

function plotMSDNoError(MSD,timeScale,spaceScale)
    numPoints = size(MSD,2);
    
    avg = mean(MSD);
    
    x = 0:(numPoints-1);
    x = x*timeScale;
    
    plot(x,avg*spaceScale,'x-','linewidth',2)
    
end

% legendVals should be a CELL ARRAY OF STRINGS
% timeScale and spaceScale should be ALSO ARRAYS
function plotMSDerrorCell(dataCell,timeScale,spaceScale,legendVals)
    hold on;
    ns = zeros(numel(dataCell),1);
    for i=1:numel(dataCell)
        MSD = getMSDEqualLength(dataCell{i});
        
        if size(MSD,1) > 1
            plotMSDerror(MSD,timeScale(i),spaceScale(i)); 
        elseif size(MSD,1) == 1
            % can't do an error if only have one traj
            numPoints = size(MSD,2);
            x = 0:(numPoints-1);
            x = x*timeScale(i);
            plot(x,MSD(1,:)*spaceScale(i));
        else
            plot(0,0,'o')
        end
        
        ns(i) = size(MSD,1);
    end
    
    % make the plot look pretty
    set(gca,'FontSize',16);
    grid on;
    axis tight
    xlabel('Time (s)','Interpreter','Latex');ylabel('MSD ($\mu m^2$)','Interpreter','Latex');
    
    newLegendVals = cell(numel(legendVals),1);
    
    for i=1:numel(legendVals)
        newLegendVals{i} = [legendVals{i},num(dataCell{i})];
    end
    
    legend(newLegendVals,'Location','southeast');
end

% legendVals should be a CELL ARRAY OF STRINGS
function plotMSDerrorCellFromOrigin(dataCell,timeScale,spaceScale,legendVals)
    hold on;
    ns = zeros(numel(dataCell),1);
    for i=1:numel(dataCell)
        MSD = getMSDEqualLengthFromOrigin(dataCell{i});
        
        if size(MSD,1) > 1
            plotMSDerror(MSD,timeScale,spaceScale); 
        elseif size(MSD,1) == 1
            % can't do an error if only have one traj
            numPoints = size(MSD,2);
            x = 0:(numPoints-1);
            x = x*timeScale;
            plot(x,MSD(1,:)*spaceScale);
        else
            plot(0,0,'o')
        end
        
        ns(i) = size(MSD,1);
    end
    
    % make the plot look pretty
    set(gca,'FontSize',16);
    grid on;
    axis tight
    xlabel('Time (s)','Interpreter','Latex');ylabel('MSD ($\mu m^2$)','Interpreter','Latex');
    
    newLegendVals = cell(numel(legendVals),1);
    
    for i=1:numel(legendVals)
        newLegendVals{i} = [legendVals{i},num(dataCell{i})];
    end
    
    legend(newLegendVals,'Location','southeast');
end

% this one only takes in one struct at a time
function plotMSDLASA(struct,timeScale,spaceScale,fakeSwitch)
    
    hold on;
    
    if fakeSwitch == 0
        [LA,SA] = getShortAxisLongAxisMSDEqualLength(struct);
    else
        [LA,SA] = getFakeShortAxisLongAxisMSDEqualLength(struct);
    end

    if size(LA,1) > 1
        plotMSDerror(LA,timeScale,spaceScale); 
    elseif size(LA,1) == 1
        % can't do an error if only have one traj
        numPoints = size(LA,2);
        x = 0:(numPoints-1);
        x = x*timeScale;
        plot(x,LA(1,:)*spaceScale);
    else
        plot(0,0,'o')
    end

    if size(SA,1) > 1
        plotMSDerror(SA,timeScale,spaceScale); 
    elseif size(SA,1) == 1
        % can't do an error if only have one traj
        numPoints = size(SA,2);
        x = 0:(numPoints-1);
        x = x*timeScale;
        plot(x,SA(1,:)*spaceScale);
    else
        plot(0,0,'o')
    end
    
    % make the plot look pretty
    set(gca,'FontSize',16);
    grid on;
    axis tight
    
    legend(['LA N=',num2str(size(LA,1))],['SA N=',num2str(size(SA,1))],'Location','southeast')
    
    xlabel('Time (s)','Interpreter','Latex');ylabel('MSD ($\mu m^2$)','Interpreter','Latex');

end

function histogramTimeToNotLinear(struct)
    MSD = getMSDEqualLength(struct);
    
    timeToNotLinear = zeros(size(MSD,1),1);
    
    for i=1:numel(timeToNotLinear)
        timeToNotLinear(i) = calcTimeToNotLinear(MSD(i,:));
    end
    
    histogram(timeToNotLinear,'normalization','probability');
    %histogram(timeToNotLinear,'BinWidth',5,'normalization','probability');
end

function barPercentDiffusive(dataCell,xlabels)
    percentDiffusive = zeros(1,numel(dataCell));
    
    for i=1:numel(dataCell)
        [conf,diffusive] = getConfinedDiffusive(dataCell{i});
        
        percent = numel(diffusive)/(numel(conf)+numel(diffusive));
        
        percentDiffusive(i) = percent;
    end
    
    bar(percentDiffusive);
    
    xticklabels(xlabels);
    xtickangle(60);
    
    % make the plot look pretty
    set(gca,'FontSize',16);
    grid on;
    axis tight
    
end

function percError = getPercDiffusiveWithError(dataCell)
    
    percError = zeros(2,numel(dataCell));
    % is a matrix 2xnumConditions
    % top row average percent diffusive
    % bottom row stdev
    
    for i=1:numel(dataCell)
        experiments = getExperiments(dataCell{i});

        percDiff = zeros(1,numel(experiments));
        for j=1:numel(experiments)
            if numel(experiments{j}) > 20
                % want to check there are actually enough tracks from this
                % experiment to make it worthwhile
                [conf,diffusive] = getConfinedDiffusive(experiments{j});
                percent = numel(diffusive)/(numel(conf)+numel(diffusive));
                percDiff(j) = percent;
            else
                percDiff(j) = NaN;
            end
        end

        if sum(~isnan(percDiff)) > 1
            percError(1,i) = nanmean(percDiff);
            percError(2,i) = nanstd(percDiff);
        else
            percError(1,i) = max(percDiff);
            percError(2,i) = NaN;
        end
    end
end

% get the average diffusion coefficient of all the tracks in struct
function diffCoeff = averageDiffusionCoefficient(struct)
    allDlinear = [struct.Dlinear];
    diffCoeff = mean(allDlinear);
end

% plots a fake recovery curve according to christoph's formula
function plotFakeRecovery(struct,gamma,d,flag)
    
%     d = 0.843; % diameter of spot IN um (ESTIMATE)
%     gamma = 0.622; % depth of photobleach
    
    [confined,diffusive] = getConfinedDiffusive(struct);
    
    percDiffusive = numel(diffusive)/(numel(confined)+numel(diffusive));
    percConfined = numel(confined)/(numel(confined)+numel(diffusive));
    
    DlinearDiffusive = averageDiffusionCoefficient(diffusive);
    DlinearConfined = averageDiffusionCoefficient(confined);
    
    % these D are in px^2/frame. Convert to um^2/s, remembering to divide
    % by 4 to get the diffusion coefficient
    
    DlinearDiffusive = DlinearDiffusive*0.097*0.097*0.25/0.033;
    DlinearConfined = DlinearConfined*0.097*0.097*0.25/0.033;
    
    D2D = 0.25*(percDiffusive*DlinearDiffusive + percConfined*DlinearConfined);
    
    %D2D = 10*D2D;
    
    if flag == 0
        % tauD christoph version
        tauD = ((d/2)*(d/2)*gamma)/(4*D2D);
    else
        tauD = (d*d)/(4*D2D);
    end
    
    times = linspace(0,300,1000); % times in seconds
    
    F = zeros(1,numel(times));
    
    F0 = 1-gamma;
    
    for i=1:numel(times)
        tOverTauD = times(i)/tauD;
        F(i) = ((1+percConfined*tOverTauD)*F0 + percDiffusive*tOverTauD)/(1+tOverTauD);
    end
    
    plot(times,F,'linewidth',2);
    
    xlim([0,300])
    ylim([0,0.8])
    
    set(gca,'FontSize',16);
    grid on;
    
    text(150,0.3,['D = ',num2str(D2D),' um^2/s'])
    text(150,0.35,['perc diffusive = ',num2str(percDiffusive),' um^2/s'])
    text(150,0.4,['mobile fraction = ',num2str((F(end)-F(1))/(1-F(1)))])

end

function plotLongAxisLocationConfinedDiffusive(dataCell,xTickLabels)
    hold on;
    index = 1;
    for i=1:numel(dataCell)
        %  get confined diffusive
        [confined,diffusive] = getConfinedDiffusive(dataCell{i});
        plot(index*ones(1,numel(confined)),[confined.alpha]*100,'rx','linewidth',2)
        plot((index+0.2)*ones(1,numel(diffusive)),[diffusive.alpha]*100,'bx','linewidth',2)
        
        % add the legend when only two are plotted
        if i==1
            legend({'Confined','Diffusive'},'Location','northwest','AutoUpdate','off')
        end
        index = index + 1;
    end
    
    % set the x ticks
    
    xticks(1:numel(dataCell))
    xticklabels(xTickLabels);
    xtickangle(60);
    
    % set the x axis
    
    xlim([0.8,numel(dataCell)+0.2]);
    ylim([0,100])
    
    % make pretty
    
    ylabel('Distance along long axis (%)')
    set(gca,'FontSize',16);
    grid on;

end

function barTrajectoryLocations(dataCell,dataXTicks)
    % top row pole bottom row midcell
    locationPercentages = zeros(2,numel(dataCell));
    
    for i=1:numel(dataCell)
        [pole,midcell] = getPoleMidcell(dataCell{i});
        
        percentPole = (numel(pole)/(numel(pole)+numel(midcell)))*100;
        percentMidcell = 100-percentPole;
        
        locationPercentages(1,i) = percentPole;
        locationPercentages(2,i) = percentMidcell;
    end
    
    bar(locationPercentages')
    
    newXTicks = cell(1,numel(dataXTicks));
    for i=1:numel(newXTicks)
        newXTicks{i} = [dataXTicks{i},num(dataCell{i})];
    end
    
    xticklabels(newXTicks);
    xtickangle(60);
    
    set(gca,'FontSize',16);
    grid on;
    
    ylim([0,70])
    
    legend('Pole','Midcell')
end

% with OVERLAPPING intervals
function Nsteps = calcNStepProbabilityDistrbn(struct,N)
    Nsteps = cell(1,numel(struct)); % we store as a cell as may have different length trajectories
    
    % for each trajectory
    for traj = 1:numel(struct)  
        % calculate all the Nsteps (OVERLAPPING)
        NstepTraj = zeros(1,numel(struct(traj).newX)-N);
        
        for i=1:numel(NstepTraj)
            NstepTraj(i) = (struct(traj).newX(i+N)-struct(traj).newX(i))^2+(struct(traj).newY(i+N)-struct(traj).newY(i))^2;
        end
        
        Nsteps{traj} = NstepTraj;
    end
    
end

function allSteps = calcNStepProbabilityDistrbnCombined(struct,N)
Nsteps = calcNStepProbabilityDistrbn(struct,N);

allSteps = zeros(1);
index = 1;
for i = 1:numel(Nsteps)
    nextSize = numel(Nsteps{i});
    allSteps(index:index+nextSize-1) = Nsteps{i};
    index = index + nextSize;
end

end

function spitOutQuantityData(struct,conditionName)

    % spit out the number of replicates
    disp(conditionName)
    num = getNumExperiments(struct);
    disp(['There were ',num2str(num),' replicates.'])
    
    % spit out the number of trajectories in total got from trackmate
    
    disp(['There were ',num2str(numel(struct)),' total tracks.'])
    
    % spit out the number of trajectories that 'count'. i.e. not part of
    % another, above background, and with a step down
    
    % provide deets along the way
    
    wholeTracks = getWholeTracks(struct);
    
    disp(['There were ',num2str(numel(wholeTracks)),' whole tracks.'])
    
    aboveBackground = getNonBackgroundTracks(wholeTracks);
    
    disp(['There were ',num2str(numel(aboveBackground)),' above background.'])
    
    newStruct = getStepDownFromLoad(struct);
    
    disp(['There were ',num2str(numel(newStruct)),' taken for analysis.'])
    
    [confined,diffusive] = getConfinedDiffusive(newStruct);
    
    disp(['There were ',num2str(numel(confined)),' confined.'])
    disp(['There were ',num2str(numel(diffusive)),' diffusive.'])

end

function spitOutQuantityDataToFile(struct,conditionName,fileName)

    fileID = fopen(fileName,'w');

    % spit out the number of replicates
    fprintf(fileID, [conditionName,'\n -----\n']);
    num = getNumExperiments(struct);
    fprintf(fileID, ['There were ',num2str(num),' replicates.\n']);
    
    % spit out the number of trajectories in total got from trackmate
    fprintf(fileID, ['There were ',num2str(numel(struct)),' total tracks.\n']);
    
    % spit out the number of trajectories that 'count'. i.e. not part of
    % another, above background, and with a step down
    
    % provide deets along the way
    
    wholeTracks = getWholeTracks(struct);
    fprintf(fileID, ['There were ',num2str(numel(wholeTracks)),' whole tracks.\n']);
    
    aboveBackground = getNonBackgroundTracks(wholeTracks);
    fprintf(fileID, ['There were ',num2str(numel(aboveBackground)),' above background.\n']);
    
    newStruct = getStepDownFromLoad(struct);
    fprintf(fileID, ['There were ',num2str(numel(newStruct)),' taken for analysis.\n']);

    
    [confined,diffusive] = getConfinedDiffusive(newStruct);
    fprintf(fileID, ['There were ',num2str(numel(confined)),' confined.\n']);
    fprintf(fileID, ['There were ',num2str(numel(diffusive)),' diffusive.\n']);
    
    % close file
    fclose(fileID);
end

function plotTrajectoryInfo(trajData,timeScale,spaceScale)
    figure;
    subplot(1,3,1) % the trajectory x-y
    hold on;
    plot(trajData.shortX,trajData.shortY,'x-','linewidth',1)
    plot(trajData.shortX,trajData.shortY,'x','linewidth',2)
    title(trajData.cellName)
    set(gca,'FontSize',16);
    xlabel('x (px)');ylabel('y (px)')

    subplot(1,3,2) % the intensity and filtered intensity
    hold on;
    plot(trajData.shortIntensity)
    plot(trajData.filteredIntensity,'k-')
    title(['group: ',num2str(trajData.group)])

    subplot(1,3,3) % MSD curve with linear part fit
    x = 0:(numel(trajData.MSD)-1);
    %x = 0:61;
    plot(x*timeScale,trajData.MSD*spaceScale,'linewidth',2)
    hold on;
    timeToNotLinear = calcTimeToNotLinear(trajData.MSD);
    xlabel('Time (s)');ylabel('MSD (um^2')

    shortX = x(1:timeToNotLinear)*timeScale;
    polyvar = polyfit(shortX,trajData.MSD(1:timeToNotLinear)*spaceScale,1);

    plot(shortX,polyval(polyvar,shortX),'r-','linewidth',2);
    title(timeToNotLinear)
    set(gca,'FontSize',16);
    grid on;
    xlabel('Time (s)');ylabel('MSD (um^2)')
end

% 
% for i=1:numel(mgStatData)
%     if strcmp(mgStatData(i).cellName,'171214-33ms-125gain-image3-cell2')
%         if min(find(mgStatData(i).intensity > 0)) == 444
%             disp('found mg stat')
%             plotTrajectoryInfo(mgStatData(i),timeScale33,spaceScale2)
%             xycoords = [mgStatData(i).shortX'*0.097',mgStatData(i).shortY'*0.097];
%             dlmwrite('confined.txt',xycoords,'delimiter','\t')
%         end
%     end
% end
% disp('--- EDTA ---')
% for i=1:numel(mgStatEDTAData)
%     if strcmp(mgStatEDTAData(i).cellName,'180501-MG1655-stat-EDTA-image11-cell7')
%         if min(find(mgStatEDTAData(i).intensity > 0)) == 441
%             disp('found mg stat edta')
%             plotTrajectoryInfo(mgStatEDTAData(i),timeScale33,spaceScale2)
%             xycoords = [mgStatEDTAData(i).shortX'*0.097,mgStatEDTAData(i).shortY'*0.097];
%             dlmwrite('diffusive.txt',xycoords,'delimiter','\t')
%         end
%     end
% end


% to plot replicates

% time = char(datetime('now','Format','y-MM-dd'));
% plotReplicates(mgStat15Data,['test/',time,'-MG1655-stat-15'],timeScale33,spaceScale2);
% plotReplicates(mgLog15Data,['test/',time,'-MG1655-exp-15'],timeScale33,spaceScale2);
% plotReplicates(mgStatEDTA15Data,['test/',time,'-MG1655-stat-EDTA-15'],timeScale33,spaceScale2);
% plotReplicates(mgStatEGTA15Data,['test/',time,'-MG1655-stat-EGTA-15'],timeScale33,spaceScale2);
% plotReplicates(mgStatUrea15Data,['test/',time,'-MG1655-stat-urea-15'],timeScale33,spaceScale2);
% plotReplicates(mgLogUrea15Data,['test/',time,'-MG1655-exp-urea-15'],timeScale33,spaceScale2);
% plotReplicates(rfacStat15Data,['test/',time,'-rfac-stat-15'],timeScale33,spaceScale2);
% plotReplicates(rfacLog15Data,['test/',time,'-rfac-exp-15'],timeScale33,spaceScale2);
% plotReplicates(rfacStatEGTA15Data,['test/',time,'-rfac-stat-EGTA-15'],timeScale33,spaceScale2);
% plotReplicates(rfacStatEDTA15Data,['test/',time,'-rfac-stat-EDTA-15'],timeScale33,spaceScale2);
% plotReplicates(impStat15Data,['test/',time,'-imp-stat-15'],timeScale33,spaceScale2);
% 
% plotReplicates(mgStatData,['test/',time,'-MG1655-stat-33'],timeScale33,spaceScale2);
% plotReplicates(mgStatNoJumpsRemovedData,['test/',time,'-MG1655-stat-33-noJumpsRemoved'],timeScale33,spaceScale2);
% plotReplicates(mgStatGaussianData,['test/',time,'-MG1655-stat-33-gaussian'],timeScale33,spaceScale2);
% plotReplicates(mgStatMin30FrameData,['test/',time,'-MG1655-stat-33-min30Frame'],timeScale33,spaceScale2);
% plotReplicates(mgStatMin30FrameGaussianData,['test/',time,'-MG1655-stat-33-min30Frame-gaussian'],timeScale33,spaceScale2);
% plotReplicates(mgLogData,['test/',time,'-MG1655-exp-33'],timeScale33,spaceScale2);
% plotReplicates(mgLogNoJumpsRemovedData,['test/',time,'-MG1655-exp-33-noJumpsRemoved'],timeScale33,spaceScale2);
% plotReplicates(mgLogMin30FrameData,['test/',time,'-MG1655-exp-33-min30Frame'],timeScale33,spaceScale2);
% plotReplicates(mgLogGaussianData,['test/',time,'-MG1655-exp-33-gaussian'],timeScale33,spaceScale2);
% plotReplicates(mgStatEDTAData,['test/',time,'-MG1655-stat-EDTA-33'],timeScale33,spaceScale2);
% plotReplicates(mgStatEGTAData,['test/',time,'-MG1655-stat-EGTA-33'],timeScale33,spaceScale2);
% plotReplicates(mgStatUreaData,['test/',time,'-MG1655-stat-urea-33'],timeScale33,spaceScale2);
% plotReplicates(mgLogUreaData,['test/',time,'-MG1655-exp-urea-33'],timeScale33,spaceScale2);
% plotReplicates(mgLogEDTAData,['test/',time,'-MG1655-exp-EDTA-33'],timeScale33,spaceScale2);
% plotReplicates(rfacStatData,['test/',time,'-rfac-stat-33'],timeScale33,spaceScale2);
% plotReplicates(rfacStatNoJumpsRemovedData,['test/',time,'-rfac-stat-33-noJumpsRemoved'],timeScale33,spaceScale2);
% plotReplicates(rfacLogData,['test/',time,'-rfac-exp-33'],timeScale33,spaceScale2);
% plotReplicates(rfacLogData,['test/',time,'-rfac-exp-33-noJumpsRemoved'],timeScale33,spaceScale2);
% plotReplicates(rfacStatEGTAData,['test/',time,'-rfac-stat-EGTA-33'],timeScale33,spaceScale2);
% plotReplicates(rfacStatEDTAData,['test/',time,'-rfac-stat-EDTA-33'],timeScale33,spaceScale2);
% plotReplicates(impStatData,['test/',time,'-imp-stat-33'],timeScale33,spaceScale2);

% we shall log all of the D values now in a table that can be pretty
% plotted in python

% DArray = {[mgStat.Dlinear],[mgLog.Dlinear],[mgStatUrea.Dlinear],...
%           [mgLogUrea.Dlinear],[mgStatEDTA.Dlinear],[mgStatEGTA.Dlinear],...
%           [rfacStat.Dlinear],[rfacLog.Dlinear],[rfacStatEDTA.Dlinear],...
%           [rfacStatEGTA.Dlinear],[impStat.Dlinear]};
% asymptoteArray = {[mgStat.asymptote],[mgLog.asymptote],[mgStatUrea.asymptote],...
%           [mgLogUrea.asymptote],[mgStatEDTA.asymptote],[mgStatEGTA.asymptote],...
%           [rfacStat.asymptote],[rfacLog.asymptote],[rfacStatEDTA.asymptote],...
%           [rfacStatEGTA.asymptote],[impStat.asymptote]};
% alphaArray = {[mgStat.alpha],[mgLog.alpha],[mgStatUrea.alpha],...
%           [mgLogUrea.alpha],[mgStatEDTA.alpha],[mgStatEGTA.alpha],...
%           [rfacStat.alpha],[rfacLog.alpha],[rfacStatEDTA.alpha],...
%           [rfacStatEGTA.alpha],[impStat.alpha]};
% names = {'mg stat','mg log','mg stat urea','mg log urea','mg stat EDTA',...
%          'mg stat EGTA','rfac stat','rfac log','rfac stat EDTA',...
%          'rfac stat EGTA','imp stat'};
% 
% fid = fopen([bigFolder,'/DTable.txt'], 'wt');
% for k = 1:numel(DArray)
%     this_rowD = DArray{k};
%     this_rowAsymptote = asymptoteArray{k};
%     this_rowAlpha = alphaArray{k};
%     for j=1:numel(this_rowD)-1
%         fprintf(fid,'%s, ',names{k});
%         fprintf(fid, '%f, ', this_rowD(j));
%         fprintf(fid, '%f, ', this_rowAsymptote(j));
%         fprintf(fid, '%f\n', this_rowAlpha(j));
%     end
% end
% fclose(fid);
% 
% DArray = {[mgStatConf.Dlinear],[mgLogConf.Dlinear],[mgStatUreaConf.Dlinear],...
%           [mgLogUreaConf.Dlinear],[mgStatEDTAConf.Dlinear],[mgStatEGTAConf.Dlinear],...
%           [rfacStatConf.Dlinear],[rfacLogConf.Dlinear],[rfacStatEDTAConf.Dlinear],...
%           [rfacStatEGTAConf.Dlinear],[impStatConf.Dlinear]};
% asymptoteArray = {[mgStatConf.asymptote],[mgLogConf.asymptote],[mgStatUreaConf.asymptote],...
%           [mgLogUreaConf.asymptote],[mgStatEDTAConf.asymptote],[mgStatEGTAConf.asymptote],...
%           [rfacStatConf.asymptote],[rfacLogConf.asymptote],[rfacStatEDTAConf.asymptote],...
%           [rfacStatEGTAConf.asymptote],[impStatConf.asymptote]};
% alphaArray = {[mgStatConf.alpha],[mgLogConf.alpha],[mgStatUreaConf.alpha],...
%           [mgLogUreaConf.alpha],[mgStatEDTAConf.alpha],[mgStatEGTAConf.alpha],...
%           [rfacStatConf.alpha],[rfacLogConf.alpha],[rfacStatEDTAConf.alpha],...
%           [rfacStatEGTAConf.alpha],[impStatConf.alpha]};
% names = {'mg stat','mg log','mg stat urea','mg log urea','mg stat EDTA',...
%          'mg stat EGTA','rfac stat','rfac log','rfac stat EDTA',...
%          'rfac stat EGTA','imp stat'};
% 
% fid = fopen([bigFolder,'/DTable-confOnly.txt'], 'wt');
% for k = 1:numel(DArray)
%     this_rowD = DArray{k};
%     this_rowAsymptote = asymptoteArray{k};
%     this_rowAlpha = alphaArray{k};
%     for j=1:numel(this_rowD)-1
%         fprintf(fid,'%s, ',names{k});
%         fprintf(fid, '%f, ', this_rowD(j));
%         fprintf(fid, '%f, ', this_rowAsymptote(j));
%         fprintf(fid, '%f\n', this_rowAlpha(j));
%     end
% end
% fclose(fid);
% 
% DArray = {[mgStatDiff.Dlinear],[mgLogDiff.Dlinear],[mgStatUreaDiff.Dlinear],...
%           [mgLogUreaDiff.Dlinear],[mgStatEDTADiff.Dlinear],[mgStatEGTADiff.Dlinear],...
%           [rfacStatDiff.Dlinear],[rfacLogDiff.Dlinear],[rfacStatEDTADiff.Dlinear],...
%           [rfacStatEGTADiff.Dlinear],[impStatDiff.Dlinear]};
% asymptoteArray = {[mgStatDiff.asymptote],[mgLogDiff.asymptote],[mgStatUreaDiff.asymptote],...
%           [mgLogUreaDiff.asymptote],[mgStatEDTADiff.asymptote],[mgStatEGTADiff.asymptote],...
%           [rfacStatDiff.asymptote],[rfacLogDiff.asymptote],[rfacStatEDTADiff.asymptote],...
%           [rfacStatEGTADiff.asymptote],[impStatDiff.asymptote]};
% alphaArray = {[mgStatDiff.alpha],[mgLogDiff.alpha],[mgStatUreaDiff.alpha],...
%           [mgLogUreaDiff.alpha],[mgStatEDTADiff.alpha],[mgStatEGTADiff.alpha],...
%           [rfacStatDiff.alpha],[rfacLogDiff.alpha],[rfacStatEDTADiff.alpha],...
%           [rfacStatEGTADiff.alpha],[impStatDiff.alpha]};
% names = {'mg stat','mg log','mg stat urea','mg log urea','mg stat EDTA',...
%          'mg stat EGTA','rfac stat','rfac log','rfac stat EDTA',...
%          'rfac stat EGTA','imp stat'};
% 
% fid = fopen([bigFolder,'/DTable-diffOnly.txt'], 'wt');
% for k = 1:numel(DArray)
%     this_rowD = DArray{k};
%     this_rowAsymptote = asymptoteArray{k};
%     this_rowAlpha = alphaArray{k};
%     for j=1:numel(this_rowD)-1
%         fprintf(fid,'%s, ',names{k});
%         fprintf(fid, '%f, ', this_rowD(j));
%         fprintf(fid, '%f, ', this_rowAsymptote(j));
%         fprintf(fid, '%f\n', this_rowAlpha(j));
%     end
% end
% fclose(fid);
