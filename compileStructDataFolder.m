% this has been edited to just use compileStructDataSimple.m

function compileStructDataFolder()

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

% rearranged to be in the same order as TIRF-checklist
mgStat33_171214Loc = [mgStatFolder,'171214-MG1655-stat-33ms-tracks/analysed.mat'];
mgStat33_180111Loc = [mgStatFolder,'180111-MG1655-stat-33ms-tracks/analysed.mat'];
mgStat33_180306Loc = [mgStatFolder,'180306-MG1655-stat-33ms-tracks/analysed.mat'];
mgStat33_180501Loc = [mgStatFolder,'180501-MG1655-stat-33ms-tracks/analysed.mat'];

mgStat33Folders = {mgStat33_171214Loc,mgStat33_180111Loc,mgStat33_180306Loc,mgStat33_180501Loc};

% these are from a test on using thresholds
% mgStat33_171214Loc = [mgStatFolder,'171214-MG1655-stat-33ms-cells-gain100/analysedApr2019.mat'];
% mgStat33_180111Loc = [mgStatFolder,'180111-MG1655-stat-33ms-cells-gain150/analysedApr2019.mat'];
% mgStat33_180501Loc = [mgStatFolder,'180501-MG1655-stat-33ms-cells-gain200/analysedApr2019.mat'];
% 
% 
% mgStat33Folders = {mgStat33_171214Loc,mgStat33_180111Loc,mgStat33_180501Loc};

mgStat33_171214_gaussianLoc = [mgStatFolder,'171214-MG1655-stat-33ms-tracks-gaussian/analysed.mat'];
mgStat33_180111_gaussianLoc = [mgStatFolder,'180111-MG1655-stat-33ms-tracks-gaussian/analysed.mat'];
mgStat33_180306_gaussianLoc = [mgStatFolder,'180306-MG1655-stat-33ms-tracks-gaussian/analysed.mat'];
mgStat33_180501_gaussianLoc = [mgStatFolder,'180501-MG1655-stat-33ms-tracks-gaussian/analysed.mat'];

mgStat33_gaussianFolders = {mgStat33_171214_gaussianLoc,mgStat33_180111_gaussianLoc,mgStat33_180306_gaussianLoc,mgStat33_180501_gaussianLoc};

mgStat33Min30Frame_171214Loc = [mgStatFolder,'171214-MG1655-stat-33ms-tracks-30frameMin/analysed.mat'];
mgStat33Min30Frame_180111Loc = [mgStatFolder,'180111-MG1655-stat-33ms-tracks-30frameMin/analysed.mat'];
mgStat33Min30Frame_180306Loc = [mgStatFolder,'180306-MG1655-stat-33ms-tracks-30frameMin/analysed.mat'];
mgStat33Min30Frame_180501Loc = [mgStatFolder,'180501-MG1655-stat-33ms-tracks-30frameMin/analysed.mat'];

mgStat33Min30FrameFolders = {mgStat33Min30Frame_171214Loc,mgStat33Min30Frame_180111Loc,mgStat33Min30Frame_180306Loc,mgStat33Min30Frame_180501Loc};

mgStat33Min30FrameGaussian_171214Loc = [mgStatFolder,'171214-MG1655-stat-33ms-tracks-gaussian-30frameMin/analysed.mat'];
mgStat33Min30FrameGaussian_180111Loc = [mgStatFolder,'180111-MG1655-stat-33ms-tracks-gaussian-30frameMin/analysed.mat'];
mgStat33Min30FrameGaussian_180306Loc = [mgStatFolder,'180306-MG1655-stat-33ms-tracks-gaussian-30frameMin/analysed.mat'];
mgStat33Min30FrameGaussian_180501Loc = [mgStatFolder,'180501-MG1655-stat-33ms-tracks-gaussian-30frameMin/analysed.mat'];

mgStat33Min30FrameGaussianFolders = {mgStat33Min30FrameGaussian_171214Loc,mgStat33Min30FrameGaussian_180111Loc,mgStat33Min30FrameGaussian_180306Loc,mgStat33Min30FrameGaussian_180501Loc};

mgStat15_171214Loc = [mgStatFolder,'171214-MG1655-stat-15ms-tracks/analysed.mat'];
mgStat15_180111Loc = [mgStatFolder,'180111-MG1655-stat-15ms-tracks/analysed.mat'];
mgStat15_180306Loc = [mgStatFolder,'180306-MG1655-stat-15ms-tracks/analysed.mat'];
mgStat15_180501Loc = [mgStatFolder,'180501-MG1655-stat-15ms-tracks/analysed.mat'];

mgStat15Folders = {mgStat15_171214Loc,mgStat15_180111Loc,mgStat15_180306Loc,mgStat15_180501Loc};

mgLog33_180111Loc = [mgLogFolder,'180111-MG1655-log-33ms-tracks/analysed.mat'];
mgLog33_180306Loc = [mgLogFolder,'180306-MG1655-log-33ms-tracks/analysed.mat'];
mgLog33_180322Loc = [mgLogFolder,'180322-MG1655-log-33ms-tracks/analysed.mat'];
mgLog33_180501Loc = [mgLogFolder,'180501-MG1655-exp-33ms-tracks/analysed.mat'];

mgLog33Folders = {mgLog33_180111Loc,mgLog33_180306Loc,mgLog33_180322Loc,mgLog33_180501Loc};

mgLog33Min30Frame_180111Loc = [mgLogFolder,'180111-MG1655-log-33ms-tracks-30frameMin/analysed.mat'];
mgLog33Min30Frame_180306Loc = [mgLogFolder,'180306-MG1655-log-33ms-tracks-30frameMin/analysed.mat'];
mgLog33Min30Frame_180322Loc = [mgLogFolder,'180322-MG1655-log-33ms-tracks-30frameMin/analysed.mat'];
mgLog33Min30Frame_180501Loc = [mgLogFolder,'180501-MG1655-exp-33ms-tracks-30frameMin/analysed.mat'];

mgLog33Min30FrameFolders = {mgLog33Min30Frame_180111Loc,mgLog33Min30Frame_180306Loc,mgLog33Min30Frame_180322Loc,mgLog33Min30Frame_180501Loc};

mgLog33Gaussian_180111Loc = [mgLogFolder,'180111-MG1655-log-33ms-tracks-gaussian/analysed.mat'];
mgLog33Gaussian_180306Loc = [mgLogFolder,'180306-MG1655-log-33ms-tracks-gaussian/analysed.mat'];
mgLog33Gaussian_180322Loc = [mgLogFolder,'180322-MG1655-log-33ms-tracks-gaussian/analysed.mat'];
mgLog33Gaussian_180501Loc = [mgLogFolder,'180501-MG1655-exp-33ms-tracks-gaussian/analysed.mat'];

mgLog33GaussianFolders = {mgLog33Gaussian_180111Loc,mgLog33Gaussian_180306Loc,mgLog33Gaussian_180322Loc,mgLog33Gaussian_180501Loc};

mgLog15_180111Loc = [mgLogFolder,'180111-MG1655-log-15ms-tracks/analysed.mat'];
mgLog15_180306Loc = [mgLogFolder,'180306-MG1655-log-15ms-tracks/analysed.mat'];
mgLog15_180322Loc = [mgLogFolder,'180322-MG1655-log-15ms-tracks/analysed.mat'];
mgLog15_180501Loc = [mgLogFolder,'180501-MG1655-exp-15ms-tracks/analysed.mat'];

mgLog15Folders = {mgLog15_180111Loc,mgLog15_180306Loc,mgLog15_180322Loc,mgLog15_180501Loc};

mgStatEDTA33_180501Loc = [mgStatEDTAFolder,'180501-MG1655-stat-EDTA-33ms-tracks/analysed.mat'];
mgStatEDTA33_180510Loc = [mgStatEDTAFolder,'180510-MG1655-stat-EDTA-33ms-tracks/analysed.mat'];
mgStatEDTA33_180525Loc = [mgStatEDTAFolder,'180525-MG1655-stat-EDTA-33ms-tracks/analysed.mat'];

mgStatEDTA33Folders = {mgStatEDTA33_180501Loc,mgStatEDTA33_180510Loc,mgStatEDTA33_180525Loc};

mgStatEDTA15_180501Loc = [mgStatEDTAFolder,'180501-MG1655-stat-EDTA-15ms-tracks/analysed.mat'];
mgStatEDTA15_180510Loc = [mgStatEDTAFolder,'180510-MG1655-stat-EDTA-15ms-tracks/analysed.mat'];
mgStatEDTA15_180525Loc = [mgStatEDTAFolder,'180525-MG1655-stat-EDTA-15ms-tracks/analysed.mat'];

mgStatEDTA15Folders = {mgStatEDTA15_180501Loc,mgStatEDTA15_180510Loc,mgStatEDTA15_180525Loc};

mgStat33EGTAFolder180824Loc = [mgStatEGTAFolder,'180824-MG1655-DIBO-100mMEGTA-33ms-tracks/analysed.mat'];
mgStat33EGTAFolder180905Loc = [mgStatEGTAFolder,'180905-MG1655-DIBO-100mMEGTA-33ms-tracks/analysed.mat'];
mgStat33EGTAFolder180907Loc = [mgStatEGTAFolder,'180907-MG1655-DIBO-100mMEGTA-33ms-tracks/analysed.mat'];

mgStatEGTA33Folders = {mgStat33EGTAFolder180824Loc,mgStat33EGTAFolder180905Loc,mgStat33EGTAFolder180907Loc};

mgStat15EGTAFolder180824Loc = [mgStatEGTAFolder,'180824-MG1655-DIBO-100mMEGTA-15ms-tracks/analysed.mat'];
mgStat15EGTAFolder180905Loc = [mgStatEGTAFolder,'180905-MG1655-DIBO-100mMEGTA-15ms-tracks/analysed.mat'];
mgStat15EGTAFolder180907Loc = [mgStatEGTAFolder,'180907-MG1655-DIBO-100mMEGTA-15ms-tracks/analysed.mat'];

mgStatEGTA15Folders = {mgStat15EGTAFolder180824Loc,mgStat15EGTAFolder180905Loc,mgStat15EGTAFolder180907Loc};

mgStatUrea33_180510Loc = [mgStatUreaFolder,'180510-MG1655-stat-urea-33ms-tracks/analysed.mat'];
mgStatUrea33_180525Loc = [mgStatUreaFolder,'180525-MG1655-stat-urea-33ms-tracks/analysed.mat'];
mgStatUrea33_190306Loc = [mgStatUreaFolder,'190306-MG1655-stat-urea-33ms-tracks/analysed.mat'];

mgStatUrea33Folders = {mgStatUrea33_180510Loc,mgStatUrea33_180525Loc,mgStatUrea33_190306Loc};

mgStatUrea15_180510Loc = [mgStatUreaFolder,'180510-MG1655-stat-urea-15ms-tracks/analysed.mat'];
mgStatUrea15_180525Loc = [mgStatUreaFolder,'180525-MG1655-stat-urea-15ms-tracks/analysed.mat'];
mgStatUrea15_190306Loc = [mgStatUreaFolder,'190306-MG1655-stat-urea-15ms-tracks/analysed.mat'];

mgStatUrea15Folders = {mgStatUrea15_180510Loc,mgStatUrea15_180525Loc,mgStatUrea15_190306Loc};

mgLogEDTA33_180510Loc = [mgLogEDTAFolder,'180510-MG1655-log-EDTA-33ms-tracks/analysed.mat'];
mgLogEDTA33_180525Loc = [mgLogEDTAFolder,'180525-MG1655-exp-EDTA-33ms-tracks/analysed.mat'];
mgLogEDTA33_190306Loc = [mgLogEDTAFolder,'190306-MG1655-exp-100mMEDTA-tracks/analysed.mat'];

mgLogEDTA33Folders = {mgLogEDTA33_180510Loc,mgLogEDTA33_180525Loc,mgLogEDTA33_190306Loc};

mgLogUrea33_180510Loc = [mgLogUreaFolder,'180510-MG1655-exp-urea-33ms-tracks/analysed.mat'];
mgLogUrea33_180525Loc = [mgLogUreaFolder,'180525-MG1655-exp-urea-33ms-tracks/analysed.mat'];
mgLogUrea33_190306Loc = [mgLogUreaFolder,'190306-MG1655-exp-300mMurea-33ms-tracks/analysed.mat'];

mgLogUrea33Folders = {mgLogUrea33_180510Loc,mgLogUrea33_180525Loc,mgLogUrea33_190306Loc};

mgLogUrea15_180510Loc = [mgLogUreaFolder,'180510-MG1655-exp-urea-15ms-tracks/analysed.mat'];
mgLogUrea15_180525Loc = [mgLogUreaFolder,'180525-MG1655-exp-urea-15ms-tracks/analysed.mat'];
mgLogUrea15_190306Loc = [mgLogUreaFolder,'190306-MG1655-exp-300mMurea-15ms-tracks/analysed.mat'];

mgLogUrea15Folders = {mgLogUrea15_180510Loc,mgLogUrea15_180525Loc,mgLogUrea15_190306Loc};

rfacStat33_171221Loc = [rfacStatFolder,'171221-rfac-stat-33ms-medianFiltered-tracks/analysedNoJumpsRemoved.mat'];
rfacStat33_180111Loc = [rfacStatFolder,'180111-rfac-stat-33ms-medianFiltered-tracks/analysedNoJumpsRemoved.mat'];
rfacStat33_180123Loc = [rfacStatFolder,'180123-rfac-stat-33ms-medianFiltered-tracks/analysedNoJumpsRemoved.mat'];
rfacStat33_180305Loc = [rfacStatFolder,'180305-rfac-stat-33ms-medianFiltered-tracks/analysedNoJumpsRemoved.mat'];

rfacStat33Folders = {rfacStat33_171221Loc,rfacStat33_180111Loc,rfacStat33_180123Loc,rfacStat33_180305Loc};

rfacStat15_171221Loc = [rfacStatFolder,'171221-rfac-stat-15ms-medianFiltered-tracks/analysed.mat'];
rfacStat15_180111Loc = [rfacStatFolder,'180111-rfac-stat-15ms-medianFiltered-tracks/analysed.mat'];
rfacStat15_180123Loc = [rfacStatFolder,'180123-rfac-stat-15ms-medianFiltered-tracks/analysed.mat'];
rfacStat15_180305Loc = [rfacStatFolder,'180305-rfac-stat-15ms-medianFiltered-tracks/analysed.mat'];

rfacStat15Folders = {rfacStat15_171221Loc,rfacStat15_180111Loc,rfacStat15_180123Loc,rfacStat15_180305Loc};

rfacStat33AF568_190426Loc = [rfacStatAF568Folder,'190426-rfac-stat-AF568-33ms-tracks/analysed.mat'];

rfacStat33AF568Folders = {rfacStat33AF568_190426Loc};

rfacStat15AF568_190426Loc = [rfacStatAF568Folder,'190426-rfac-stat-AF568-15ms-tracks/analysed.mat'];

rfacStat15AF568Folders = {rfacStat15AF568_190426Loc};

rfacLog33_171221Loc = [rfacLogFolder,'171221-rfac-log-33ms-tracks/analysedNoJumpsRemoved.mat'];
rfacLog33_180111Loc = [rfacLogFolder,'180111-rfac-log-33ms-tracks/analysedNoJumpsRemoved.mat'];
rfacLog33_180123Loc = [rfacLogFolder,'180123-rfac-log-33ms-tracks/analysedNoJumpsRemoved.mat'];
rfacLog33_190308Loc = [rfacLogFolder,'190308-rfac-exp-33ms-tracks/analysedNoJumpsRemoved.mat'];

rfacLog33Folders = {rfacLog33_171221Loc,rfacLog33_180111Loc,rfacLog33_180123Loc,rfacLog33_190308Loc};

rfacLog15_171221Loc = [rfacLogFolder,'171221-rfac-log-15ms-tracks/analysed.mat'];
rfacLog15_180123Loc = [rfacLogFolder,'180123-rfac-log-15ms-tracks/analysed.mat'];
rfacLog15_190308Loc = [rfacLogFolder,'190308-rfac-exp-15ms-tracks/analysed.mat'];

rfacLog15Folders = {rfacLog15_171221Loc,rfacLog15_180123Loc,rfacLog15_190308Loc};

rfacStatEDTA33_180810Loc = [rfacStatEDTAFolder,'180810-rfac-10mMEDTA-33ms-tracks/analysed.mat'];
rfacStatEDTA33_180815_1Loc = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-33ms-1-tracks/analysed.mat'];
rfacStatEDTA33_180815_2Loc = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-33ms-2-tracks/analysed.mat'];

rfacStat33EDTAFolders = {rfacStatEDTA33_180810Loc,rfacStatEDTA33_180815_1Loc,rfacStatEDTA33_180815_2Loc};

rfacStatEDTA15_180810Loc = [rfacStatEDTAFolder,'180810-rfac-10mMEDTA-15ms-tracks/analysed.mat'];
rfacStatEDTA15_180815_1Loc = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-15ms-1-tracks/analysed.mat'];
rfacStatEDTA15_180815_2Loc = [rfacStatEDTAFolder,'180815-rfac-10mMEDTA-15ms-2-tracks/analysed.mat'];

rfacStat15EDTAFolders = {rfacStatEDTA15_180810Loc,rfacStatEDTA15_180815_1Loc,rfacStatEDTA15_180815_2Loc};

rfacStat33EGTAFolder180905 = [rfacStatEGTAFolder,'180905-rfac-DIBO-33ms-10mMEGTA-tracks/analysed.mat'];
rfacStat33EGTAFolder180907 = [rfacStatEGTAFolder,'180907-rfac-DIBO-10mMEGTA-33ms-tracks/analysed.mat'];
rfacStat33EGTAFolder180911 = [rfacStatEGTAFolder,'180911-rfac-tracking-DIBO-10mMEGTA-33ms-tracks/analysed.mat'];

rfacStat33EGTAFolders = {rfacStat33EGTAFolder180905,rfacStat33EGTAFolder180907,rfacStat33EGTAFolder180911};

rfacStat15EGTAFolder180905 = [rfacStatEGTAFolder,'180905-rfac-DIBO-15ms-10mMEGTA-tracks/analysed.mat'];
rfacStat15EGTAFolder180907 = [rfacStatEGTAFolder,'180907-rfac-DIBO-10mMEGTA-15ms-tracks/analysed.mat'];
rfacStat15EGTAFolder180911 = [rfacStatEGTAFolder,'180911-rfac-tracking-DIBO-10mMEGTA-15ms-tracks/analysed.mat'];

rfacStat15EGTAFolders = {rfacStat15EGTAFolder180905,rfacStat15EGTAFolder180907,rfacStat15EGTAFolder180911};

impStat33_180809Loc = [impStatFolder,'180809-imp-33ms-tracks/analysed.mat'];
impStat33_180817Loc = [impStatFolder,'180817-imp-33ms-tracks/analysed.mat'];
impStat33_180821Loc = [impStatFolder,'180821-imp-DIBO-33ms-tracks/analysed.mat'];

impStat33Folders = {impStat33_180809Loc,impStat33_180817Loc,impStat33_180821Loc};

impStat15_180809Loc = [impStatFolder,'180809-imp-15ms-tracks/analysed.mat'];
impStat15_180817Loc = [impStatFolder,'180817-imp-15ms-tracks/analysed.mat'];
impStat15_180821Loc = [impStatFolder,'180821-imp-DIBO-15ms-tracks/analysed.mat'];

impStat15Folders = {impStat15_180809Loc,impStat15_180817Loc,impStat15_180821Loc};

% COLICIN STUFF

bigColIaFolder = '/Users/rml524/Google Drive/Spring 2018/tracking/colIa';

mgColIa33Folder = [bigColIaFolder,'/MG1655/33ms/'];
mgColIaUrea33Folder = [bigColIaFolder,'/MG1655 300mM urea/33ms/'];

mgColIa33_171115Loc = [mgColIa33Folder,'/171115-33ms-tracks/analysed.mat'];
mgColIa33_180312ALoc = [mgColIa33Folder,'/180312-A-33ms-tracks/analysed.mat'];

mgColIa33Folders = {mgColIa33_171115Loc,mgColIa33_180312ALoc};

mgColIaUrea33_190313_1 = [mgColIaUrea33Folder,'/190313-MG1655-tracking-colIa-AF488-300mMurea-1-medianFiltered-tracks/analysed.mat'];
mgColIaUrea33_190313_2 = [mgColIaUrea33Folder,'/190313-MG1655-tracking-colIa-AF488-300mMurea-2-medianFiltered-tracks/analysed.mat'];
mgColIaUrea33_190315 = [mgColIaUrea33Folder,'/190315-MG1655-tracking-colIa-AF488-300mMurea-medianFiltered-33ms-tracks/analysed.mat'];

mgColIaUrea33Folders = {mgColIaUrea33_190313_1,mgColIaUrea33_190313_2,mgColIaUrea33_190315};

% compile the datas
compileStructDataSimple(mgStat33Folders,[mgStatFolder,'/mgStat33SimpleNoJumpsRemoved.mat'])
compileStructDataSimple(mgStat15Folders,[mgStatFolder,'/mgStat15Simple.mat'])

compileStructDataSimple(mgStat33_gaussianFolders,[mgStatFolder,'/mgStat_gaussian33Simple.mat'])

compileStructDataSimple(mgStat33Min30FrameFolders,[mgStatFolder,'/mgStat33Min30FrameSimple.mat'])
compileStructDataSimple(mgStat33Min30FrameGaussianFolders,[mgStatFolder,'/mgStat33Min30FrameGaussianSimple.mat'])

compileStructDataSimple(mgLog33Folders,[mgLogFolder,'/mgLog33Simple.mat'])
compileStructDataSimple(mgLog15Folders,[mgLogFolder,'/mgLog15Simple.mat'])
compileStructDataSimple(mgLog33Min30FrameFolders,[mgLogFolder,'/mgLog33Min30FrameSimple.mat'])

compileStructDataSimple(mgLog33GaussianFolders,[mgLogFolder,'/mgLog33GaussianSimple.mat'])

compileStructDataSimple(mgStatEDTA33Folders,[mgStatEDTAFolder,'/mgStatEDTA33Simple.mat'])
compileStructDataSimple(mgStatEDTA15Folders,[mgStatEDTAFolder,'/mgStatEDTA15Simple.mat'])

compileStructDataSimple(mgStatEGTA33Folders,[mgStatEGTAFolder,'/mgStatEGTA33Simple.mat'])
compileStructDataSimple(mgStatEGTA15Folders,[mgStatEGTAFolder,'/mgStatEGTA15Simple.mat'])

compileStructDataSimple(mgStatUrea33Folders,[mgStatUreaFolder,'/mgStatUrea33Simple.mat'])
compileStructDataSimple(mgStatUrea15Folders,[mgStatUreaFolder,'/mgStatUrea15Simple.mat'])

compileStructDataSimple(mgLogEDTA33Folders,[mgLogEDTAFolder,'/mgLogEDTA33Simple.mat'])

compileStructDataSimple(mgLogUrea33Folders,[mgLogUreaFolder,'/mgLogUrea33Simple.mat'])
compileStructDataSimple(mgLogUrea15Folders,[mgLogUreaFolder,'/mgLogUrea15Simple.mat'])

compileStructDataSimple(rfacStat33Folders,[rfacStatFolder,'/rfacStat33SimpleNoJumpsRemoved.mat'])
compileStructDataSimple(rfacStat15Folders,[rfacStatFolder,'/rfacStat15Simple.mat'])

compileStructDataSimple(rfacStat33AF568Folders,[rfacStatAF568Folder,'/rfacStat33AF568Simple.mat'])
compileStructDataSimple(rfacStat15AF568Folders,[rfacStatAF568Folder,'/rfacStat15AF568Simple.mat'])

compileStructDataSimple(rfacLog33Folders,[rfacLogFolder,'/rfacLog33SimpleNoJumpsRemoved.mat'])
compileStructDataSimple(rfacLog15Folders,[rfacLogFolder,'/rfacLog15Simple.mat'])

compileStructDataSimple(rfacStat33EDTAFolders,[rfacStatEDTAFolder,'/rfacStatEDTA33Simple.mat'])
compileStructDataSimple(rfacStat15EDTAFolders,[rfacStatEDTAFolder,'/rfacStatEDTA15Simple.mat'])

compileStructDataSimple(rfacStat33EGTAFolders,[rfacStatEGTAFolder,'/rfacStatEGTA33Simple.mat'])
compileStructDataSimple(rfacStat15EGTAFolders,[rfacStatEGTAFolder,'/rfacStatEGTA15Simple.mat'])

compileStructDataSimple(impStat33Folders,[impStatFolder,'/impStat33Simple.mat'])
compileStructDataSimple(impStat15Folders,[impStatFolder,'/impStat15Simple.mat'])

compileStructDataSimple(mgColIa33Folders,[mgColIa33Folder,'/mgColIa33Simple.mat'])

compileStructDataSimple(mgColIaUrea33Folders,[mgColIaUrea33Folder,'/mgColIaUrea33Simple.mat'])
