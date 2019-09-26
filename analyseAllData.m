% analyse all data is a helper function which runs analysisTest.m on all
% the listed files in this function

function analyseAllData()

% set up folder names

bigFolder = '/Users/rml524/Google Drive/Spring 2018/tracking';

mgStatFolder = [bigFolder,'/MG1655 stat/'];
mgLogFolder = [bigFolder,'/MG1655 log/'];
mgStatEDTAFolder = [bigFolder,'/MG1655 stat EDTA/'];
mgStatEGTAFolder = [bigFolder,'/MG1655 stat EGTA/'];
mgStatUreaFolder = [bigFolder,'/MG1655 stat urea/'];
mgLogEDTAFolder = [bigFolder,'/MG1655 log EDTA/'];
mgLogUreaFolder = [bigFolder,'/MG1655 log urea/'];
rfacStatFolder = [bigFolder,'/rfac stat/'];
rfacStatAF568Folder = [bigFolder,'/rfac stat AF568/'];
rfacLogFolder = [bigFolder,'/rfac log/'];
rfacStatEDTAFolder = [bigFolder,'/rfac stat EDTA/'];
rfacStatEGTAFolder = [bigFolder,'/rfac stat EGTA/'];
impStatFolder = [bigFolder,'/imp stat/'];

bigColIaFolder = '/Users/rml524/Google Drive/Spring 2018/tracking/colIa';

mgStat33Folder171214 = [mgStatFolder,'171214-MG1655-stat-33ms-tracks'];
mgStat33Folder180111 = [mgStatFolder,'180111-MG1655-stat-33ms-tracks'];
mgStat33Folder180306 = [mgStatFolder,'180306-MG1655-stat-33ms-tracks'];
mgStat33Folder180501 = [mgStatFolder,'180501-MG1655-stat-33ms-tracks'];

mgStat33GaussianFolder171214 = [mgStatFolder,'171214-MG1655-stat-33ms-tracks-gaussian'];
mgStat33GaussianFolder180111 = [mgStatFolder,'180111-MG1655-stat-33ms-tracks-gaussian'];
mgStat33GaussianFolder180306 = [mgStatFolder,'180306-MG1655-stat-33ms-tracks-gaussian'];
mgStat33GaussianFolder180501 = [mgStatFolder,'180501-MG1655-stat-33ms-tracks-gaussian'];

mgStat33Min30FrameFolder171214 = [mgStatFolder,'171214-MG1655-stat-33ms-tracks-30frameMin'];
mgStat33Min30FrameFolder180111 = [mgStatFolder,'180111-MG1655-stat-33ms-tracks-30frameMin'];
mgStat33Min30FrameFolder180306 = [mgStatFolder,'180306-MG1655-stat-33ms-tracks-30frameMin'];
mgStat33Min30FrameFolder180501 = [mgStatFolder,'180501-MG1655-stat-33ms-tracks-30frameMin'];

mgStat15Folder171214 = [mgStatFolder,'171214-MG1655-stat-15ms-tracks'];
mgStat15Folder180111 = [mgStatFolder,'180111-MG1655-stat-15ms-tracks'];
mgStat15Folder180306 = [mgStatFolder,'180306-MG1655-stat-15ms-tracks'];
mgStat15Folder180501 = [mgStatFolder,'180501-MG1655-stat-15ms-tracks'];

mgLog33Folder180111 = [mgLogFolder,'180111-MG1655-log-33ms-tracks'];
mgLog33Folder180306 = [mgLogFolder,'180306-MG1655-log-33ms-tracks'];
mgLog33Folder180322 = [mgLogFolder,'180322-MG1655-log-33ms-tracks'];
mgLog33Folder180501 = [mgLogFolder,'180501-MG1655-exp-33ms-tracks'];

mgLog33Min30FrameFolder180111 = [mgLogFolder,'180111-MG1655-log-33ms-tracks-30frameMin'];
mgLog33Min30FrameFolder180306 = [mgLogFolder,'180306-MG1655-log-33ms-tracks-30frameMin'];
mgLog33Min30FrameFolder180322 = [mgLogFolder,'180322-MG1655-log-33ms-tracks-30frameMin'];
mgLog33Min30FrameFolder180501 = [mgLogFolder,'180501-MG1655-exp-33ms-tracks-30frameMin'];

mgLog33GaussianFolder180111 = [mgLogFolder,'180111-MG1655-log-33ms-tracks-gaussian'];
mgLog33GaussianFolder180306 = [mgLogFolder,'180306-MG1655-log-33ms-tracks-gaussian'];
mgLog33GaussianFolder180322 = [mgLogFolder,'180322-MG1655-log-33ms-tracks-gaussian'];
mgLog33GaussianFolder180501 = [mgLogFolder,'180501-MG1655-exp-33ms-tracks-gaussian'];

mgLog15Folder180111 = [mgLogFolder,'180111-MG1655-log-15ms-tracks'];
mgLog15Folder180306 = [mgLogFolder,'180306-MG1655-log-15ms-tracks'];
mgLog15Folder180322 = [mgLogFolder,'180322-MG1655-log-15ms-tracks'];
mgLog15Folder180501 = [mgLogFolder,'180501-MG1655-exp-15ms-tracks'];

mgStat33EDTAFolder180501 = [mgStatEDTAFolder,'180501-MG1655-stat-EDTA-33ms-tracks'];
mgStat33EDTAFolder180510 = [mgStatEDTAFolder,'180510-MG1655-stat-EDTA-33ms-tracks'];
mgStat33EDTAFolder180525 = [mgStatEDTAFolder,'180525-MG1655-stat-EDTA-33ms-tracks'];

mgStat15EDTAFolder180501 = [mgStatEDTAFolder,'180501-MG1655-stat-EDTA-15ms-tracks'];
mgStat15EDTAFolder180510 = [mgStatEDTAFolder,'180510-MG1655-stat-EDTA-15ms-tracks'];
mgStat15EDTAFolder180525 = [mgStatEDTAFolder,'180525-MG1655-stat-EDTA-15ms-tracks'];

mgStat33EGTAFolder180824 = [mgStatEGTAFolder,'180824-MG1655-DIBO-100mMEGTA-33ms-tracks'];
mgStat33EGTAFolder180905 = [mgStatEGTAFolder,'180905-MG1655-DIBO-100mMEGTA-33ms-tracks'];
mgStat33EGTAFolder180907 = [mgStatEGTAFolder,'180907-MG1655-DIBO-100mMEGTA-33ms-tracks'];

mgStat15EGTAFolder180824 = [mgStatEGTAFolder,'180824-MG1655-DIBO-100mMEGTA-15ms-tracks'];
mgStat15EGTAFolder180905 = [mgStatEGTAFolder,'180905-MG1655-DIBO-100mMEGTA-15ms-tracks'];
mgStat15EGTAFolder180907 = [mgStatEGTAFolder,'180907-MG1655-DIBO-100mMEGTA-15ms-tracks'];

mgStat33UreaFolder180510 = [mgStatUreaFolder,'180510-MG1655-stat-urea-33ms-tracks'];
mgStat33UreaFolder180525 = [mgStatUreaFolder,'180525-MG1655-stat-urea-33ms-tracks'];
mgStat33UreaFolder190306 = [mgStatUreaFolder,'190306-MG1655-stat-urea-33ms-tracks'];

mgStat15UreaFolder180510 = [mgStatUreaFolder,'180510-MG1655-stat-urea-15ms-tracks'];
mgStat15UreaFolder180525 = [mgStatUreaFolder,'180525-MG1655-stat-urea-15ms-tracks'];
mgStat15UreaFolder190306 = [mgStatUreaFolder,'190306-MG1655-stat-urea-15ms-tracks'];

mgLog33EDTAFolder180510 = [mgLogEDTAFolder,'180510-MG1655-log-EDTA-33ms-tracks'];
mgLog33EDTAFolder180525 = [mgLogEDTAFolder,'180525-MG1655-exp-EDTA-33ms-tracks'];
mgLog33EDTAFolder190306 = [mgLogEDTAFolder,'190306-MG1655-exp-100mMEDTA-tracks'];

mgLog33UreaFolder180510 = [mgLogUreaFolder,'180510-MG1655-exp-urea-33ms-tracks'];
mgLog33UreaFolder180525 = [mgLogUreaFolder,'180525-MG1655-exp-urea-33ms-tracks'];
mgLog33UreaFolder190306 = [mgLogUreaFolder,'190306-MG1655-exp-300mMurea-33ms-tracks'];

mgLog15UreaFolder180510 = [mgLogUreaFolder,'180510-MG1655-exp-urea-15ms-tracks'];
mgLog15UreaFolder180525 = [mgLogUreaFolder,'180525-MG1655-exp-urea-15ms-tracks'];
mgLog15UreaFolder190306 = [mgLogUreaFolder,'190306-MG1655-exp-300mMurea-15ms-tracks'];

rfacStat33Folder171221 = [rfacStatFolder,'171221-rfac-stat-33ms-medianFiltered-tracks'];
rfacStat33Folder180111 = [rfacStatFolder,'180111-rfac-stat-33ms-medianFiltered-tracks'];
rfacStat33Folder180123 = [rfacStatFolder,'180123-rfac-stat-33ms-medianFiltered-tracks'];
rfacStat33Folder180305 = [rfacStatFolder,'180305-rfac-stat-33ms-medianFiltered-tracks'];

rfacStat15Folder171221 = [rfacStatFolder,'171221-rfac-stat-15ms-medianFiltered-tracks'];
rfacStat15Folder180111 = [rfacStatFolder,'180111-rfac-stat-15ms-medianFiltered-tracks'];
rfacStat15Folder180123 = [rfacStatFolder,'180123-rfac-stat-15ms-medianFiltered-tracks'];
rfacStat15Folder180305 = [rfacStatFolder,'180305-rfac-stat-15ms-medianFiltered-tracks'];

rfacStat33AF568Folder190426 = [rfacStatAF568Folder,'190426-rfac-stat-AF568-33ms-tracks'];

rfacStat15AF568Folder190426 = [rfacStatAF568Folder,'190426-rfac-stat-AF568-15ms-tracks'];

rfacLog33Folder171221 = [rfacLogFolder,'171221-rfac-log-33ms-tracks'];
rfacLog33Folder180111 = [rfacLogFolder,'180111-rfac-log-33ms-tracks'];
rfacLog33Folder180123 = [rfacLogFolder,'180123-rfac-log-33ms-tracks'];
rfacLog33Folder190308 = [rfacLogFolder,'190308-rfac-exp-33ms-tracks'];

rfacLog15Folder171221 = [rfacLogFolder,'171221-rfac-log-15ms-tracks'];
rfacLog15Folder180123 = [rfacLogFolder,'180123-rfac-log-15ms-tracks'];
rfacLog15Folder190308 = [rfacLogFolder,'190308-rfac-exp-15ms-tracks'];

rfacStat33EDTAFolder180810 = [rfacStatEDTAFolder,'180810-rfac-10mMEDTA-33ms-tracks'];
rfacStat33EDTAFolder180815_1 = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-33ms-1-tracks'];
rfacStat33EDTAFolder180815_2 = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-33ms-2-tracks'];

rfacStat15EDTAFolder180810 = [rfacStatEDTAFolder,'180810-rfac-10mMEDTA-15ms-tracks'];
rfacStat15EDTAFolder180815_1 = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-15ms-1-tracks'];
rfacStat15EDTAFolder180815_2 = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-15ms-2-tracks'];

rfacStat33EGTAFolder180905 = [rfacStatEGTAFolder,'180905-rfac-DIBO-33ms-10mMEGTA-tracks'];
rfacStat33EGTAFolder180907 = [rfacStatEGTAFolder,'180907-rfac-DIBO-10mMEGTA-33ms-tracks'];
rfacStat33EGTAFolder180911 = [rfacStatEGTAFolder,'180911-rfac-tracking-DIBO-10mMEGTA-33ms-tracks'];

rfacStat15EGTAFolder180905 = [rfacStatEGTAFolder,'180905-rfac-DIBO-15ms-10mMEGTA-tracks'];
rfacStat15EGTAFolder180907 = [rfacStatEGTAFolder,'180907-rfac-DIBO-10mMEGTA-15ms-tracks'];
rfacStat15EGTAFolder180911 = [rfacStatEGTAFolder,'180911-rfac-tracking-DIBO-10mMEGTA-15ms-tracks'];

impStat33Folder180809 = [impStatFolder,'180809-imp-33ms-tracks'];
impStat33Folder180817 = [impStatFolder,'180817-imp-33ms-tracks'];
impStat33Folder180821 = [impStatFolder,'180821-imp-DIBO-33ms-tracks'];

impStat15Folder180809 = [impStatFolder,'180809-imp-15ms-tracks'];
impStat15Folder180817 = [impStatFolder,'180817-imp-15ms-tracks'];
impStat15Folder180821 = [impStatFolder,'180821-imp-DIBO-15ms-tracks'];

% COLICIN FOLDERS

mgColIa33Folder = [bigColIaFolder,'/MG1655/33ms/'];
mgColIaUrea33Folder = [bigColIaFolder,'/MG1655 300mM urea/33ms/'];

mgColIa33Folder171115 = [mgColIa33Folder,'/171115-33ms-tracks'];
mgColIa33Folder180312A = [mgColIa33Folder,'/180312-A-33ms-tracks'];

mgColIaUrea33Folder190313_1 = [mgColIaUrea33Folder,'/190313-MG1655-tracking-colIa-AF488-300mMurea-1-medianFiltered-tracks'];
mgColIaUrea33Folder190313_2 = [mgColIaUrea33Folder,'/190313-MG1655-tracking-colIa-AF488-300mMurea-2-medianFiltered-tracks'];
mgColIaUrea33Folder190315 = [mgColIaUrea33Folder,'/190315-MG1655-tracking-colIa-AF488-300mMurea-medianFiltered-33ms-tracks'];

doneFolderNames = {rfacStat33Folder171221,rfacStat33Folder180123,...
                rfacStat33Folder180111,rfacStat33Folder180305,...
                rfacStat15Folder171221,rfacStat15Folder180111,...
                rfacStat15Folder180123,rfacStat15Folder180305,...
                rfacLog33Folder171221,rfacLog33Folder180111,...
                rfacLog33Folder180123,rfacLog15Folder171221,...
                rfacLog15Folder180123,mgStat33Folder171214,...
                mgStat33Folder180111,mgStat33Folder180306,...
                mgStat15Folder171214,mgStat15Folder180111,...
                mgStat15Folder180306,mgStat33Folder180501,...
                mgStat15Folder180501,mgLog33Folder180111,...
                mgLog33Folder180306,mgLog33Folder180322,...
                mgLog33Folder180501,mgLog15Folder180111,...
                mgLog15Folder180306,mgLog15Folder180322,...
                mgLog15Folder180501,mgStat33EDTAFolder180501,...
                mgStat33EDTAFolder180510,mgStat33EDTAFolder180525,...
                mgStat15EDTAFolder180501,mgStat15EDTAFolder180510,...
                mgStat15EDTAFolder180525,mgLog33EDTAFolder180510,...
                mgLog33EDTAFolder180525,mgStat33UreaFolder180510,...
                mgStat33UreaFolder180525,mgStat15UreaFolder180510,...
                mgStat15UreaFolder180525,mgLog33UreaFolder180510,...
                mgLog33UreaFolder180525,mgLog15UreaFolder180510,...
                mgLog15UreaFolder180525,rfacStat33EDTAFolder180810,...
                rfacStat15EDTAFolder180810,impStat33Folder180809,...
                impStat15Folder180809,rfacStat33EDTAFolder180815_1,...
                rfacStat33EDTAFolder180815_2,rfacStat15EDTAFolder180815_1,...
                rfacStat15EDTAFolder180815_2,rfacStat33EGTAFolder180905,...
                rfacStat33EGTAFolder180907,rfacStat33EGTAFolder180911,...
                rfacStat15EGTAFolder180905,rfacStat15EGTAFolder180907,...
                rfacStat15EGTAFolder180911,mgStat33EGTAFolder180824,...
                mgStat33EGTAFolder180905,mgStat33EGTAFolder180907,...
                mgStat15EGTAFolder180824,mgStat15EGTAFolder180905,...
                mgStat15EGTAFolder180907,impStat33Folder180817,...
                impStat33Folder180821,impStat15Folder180817,...
                impStat15Folder180821,rfacStat15AF568Folder190426,...
                mgStat33UreaFolder190306,mgStat15UreaFolder190306,...
                mgLog33EDTAFolder190306,mgLog33UreaFolder190306,...
                mgLog15UreaFolder190306,rfacLog33Folder190308,...
                rfacLog15Folder190308,rfacStat33AF568Folder190426,...
                mgLog33GaussianFolder180306,mgColIa33Folder171115,...
                mgColIa33Folder180312A,...
                mgColIaUrea33Folder190313_1,mgColIaUrea33Folder190313_2,...
                mgColIaUrea33Folder190315};

 
folderNames = {};

for i=1:numel(folderNames)
    analysisTest(folderNames{i});
end
