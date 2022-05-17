%% FULL PIPELINE FOR PRE-RPDC
%% PREPROCESSING PIPELINE UPDATE FROM HONORS THESIS
% This file was created on December 22nd, 2021 and is compatible with
% Patrick Bloniasz's "Backup Plus" hard drive. 
%
% ------------------------------------------------
close all 
clear all
%% Set up for EEGLAB Preprocessing

%get access to data
%--------------------------------------------------------------------------%
% set-up computer: if you are on campus, use 'Bowdoin'
% if you are not, use 'MacPro'

%curpc = 'Bowdoin'; %load's an older version of eeglab on line 26, proceed
%with caution
curpc = 'Windows';
%curpc = 'offCampus'; %for patrick only right now
if strcmp(curpc,'Bowdoin') %compares if 'curpc' and 'Bowdoin' are the same
    curexperiment.dirroot = '\mnt\research\nyhus_lab\Data\Connectivity\Sessions\AllFiles'; %
elseif strcmp(curpc,'Windows')
    curexperiment.dirroot = '/Volumes/hpc-research/enyhus/pblonias/Rawfiles';
elseif strcmp(curpc,'offCampus')
    curexperiment.dirroot = '\Users\patrickbloniasz\Desktop\data_files';
        if ~isfolder(curexperiment.dirroot)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with .RAW data files.', myFolder);
        uiwait(warndlg(errorMessage));
        curexperiment.dirroot = uigetdir(); % Ask for a new one.
        if myFolder == 0
                %user clicked cancel
                return;
        end
        end
end
% set-up path
if strcmp(curpc,'Bowdoin')
    myMatlab = '\mnt\research\nyhus_lab\eeglab2020_0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
        cd(myMatlab)
    %older version of eeglab, be sure to update (i.e., proceed with caution)
elseif strcmp(curpc,'Windows')
    myMatlab = '/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
elseif strcmp(curpc,'offCampus')
    myMatlab = '[]';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
end

%start EEGLAB%
eeglab


% bad channels rejected by hand EXPERIMNET 1
curexperiment.bad_chans{1} = {'22';'27';'107'}; %101_1
curexperiment.bad_chans{2} = {'13';'31';'32';'56';'80';'105';'106';'111';'128'}; %101_2
curexperiment.bad_chans{3} = {'8';'22';'11';'83'}; %103_1 
curexperiment.bad_chans{4} = {'73';'83';'88'}; %103_2
curexperiment.bad_chans{5} = {'56'}; %104_1 %double check but probs good bro
curexperiment.bad_chans{6} = {'32';'33';'35';'39';'97';'98';'100';'115';'122'}; %104_2
curexperiment.bad_chans{7} = {'98';'100'}; %105_1 
curexperiment.bad_chans{8} = {'1';'14';'31';'32';'70';'126';'127'}; %105_2
curexperiment.bad_chans{9} = {'15';'22'}; %107_1
curexperiment.bad_chans{10} = {}; %107_2
curexperiment.bad_chans{11} = {'9';'107'}; %108_1
curexperiment.bad_chans{12} = {'25';'45';'50'}; %108_2 %25 because of heart beats 
curexperiment.bad_chans{13} = {'116'}; %109_1
curexperiment.bad_chans{14} = {'18';'44';'55';'60';'62';'72';'75';'113'}; %109_2
curexperiment.bad_chans{15} = {'21';'98';'99';'100';'109';}; %110_1
curexperiment.bad_chans{16} = {'2';'9';'14';'18';'21';'87';'103'}; %110_2
curexperiment.bad_chans{17} = {'25';'32'}; %111_1
curexperiment.bad_chans{18} = {'12'}; %111_2
curexperiment.bad_chans{19} = {'98'}; %112_1
curexperiment.bad_chans{20} = {'14';'48'}; %112_2
curexperiment.bad_chans{21} = {'8';'98';'100'}; %113_1
curexperiment.bad_chans{22} = {'25';'93';'97';'98';'100'}; %113_2
curexperiment.bad_chans{23} = {'39';'45';'68'}; %114_1
curexperiment.bad_chans{24} = {}; %114_2
curexperiment.bad_chans{25} = {'45';'103';'107';'109';'122'}; %116_1
curexperiment.bad_chans{26} = {'17';'45';'94';'107';'127'}; %116_2 
curexperiment.bad_chans{27} = {'18';'68';'75';'99';'107';'125'}; %117_1
curexperiment.bad_chans{28} = {'34'}; %117_2
curexperiment.bad_chans{29} = {'8'}; %118_1
curexperiment.bad_chans{30} = {'8';'9';'55';'128'}; %118_2
curexperiment.bad_chans{31} = {'9';'32';'56'}; %119_1
curexperiment.bad_chans{32} = {'1'}; %119_2
curexperiment.bad_chans{33} = {'107';'128'}; %120_1
curexperiment.bad_chans{34} = {'8';'14';'107';'108'}; %120_2 
curexperiment.bad_chans{35} = {'88';'99';'100';'107'}; %121_1
curexperiment.bad_chans{36} = {'3';'32';'56';'73'}; %121_2
curexperiment.bad_chans{37} = {'8';'107'}; %122_1
curexperiment.bad_chans{38} = {'3';'32';'40';'80';'90';'97';'106'}; %122_2
curexperiment.bad_chans{39} = {'5';'12';'20';'28'}; %123_1
curexperiment.bad_chans{40} = {'12';'13';'62'}; %123_2
curexperiment.bad_chans{41} = {'102';'108';'109'}; %124_1
curexperiment.bad_chans{42} = {'62';'76';'107'}; %124_2
curexperiment.bad_chans{43} = {'3';'17';'62'}; %125_1
curexperiment.bad_chans{44} = {'55';'62';'72'}; %125_2
curexperiment.bad_chans{45} = {'18';'56';'63';'64';'68'}; %126_1
curexperiment.bad_chans{46} = {'56'}; %126_2
curexperiment.bad_chans{47} = {'2';'25';'31';'123'}; %127_1
curexperiment.bad_chans{48} = {'2';'31';'42';'47';'123'}; %127_2 
curexperiment.bad_chans{49} = {'25';'126'}; %128_1 
curexperiment.bad_chans{50} = {'127'}; %128_2
curexperiment.bad_chans{51} = {'54';'61';'75';'90';'128'}; %129_1
curexperiment.bad_chans{52} = {'14';'49'}; %129_2
curexperiment.bad_chans{53} = {'12'}; %131_1
curexperiment.bad_chans{54} = {'100'}; %131_2
curexperiment.bad_chans{55} = {'5';'7'}; %132_1
curexperiment.bad_chans{56} = {}; %132_2 
curexperiment.bad_chans{57} = {'100'}; %134_1
curexperiment.bad_chans{58} = {'17'}; %134_2
curexperiment.bad_chans{59} = {}; %138_1
curexperiment.bad_chans{60} = {}; %138_2
curexperiment.bad_chans{61} = {'107'}; %147_1
curexperiment.bad_chans{62} = {}; %147_2

% % bad channels rejected by hand EXPERIMENT 2
% curexperiment.bad_chans{1} = {'21';'106';'127'}; %101_1
% curexperiment.bad_chans{2} = {'69'}; %101_2
% curexperiment.bad_chans{3} = {'25';'89';'126';'127'}; %102_1 
% curexperiment.bad_chans{4} = {'80'}; %102_2
% curexperiment.bad_chans{5} = {'55'}; %103_1 
% curexperiment.bad_chans{6} = {'83'}; %103_2
% curexperiment.bad_chans{7} = {'55'}; %104_1 
% curexperiment.bad_chans{8} = {'106'}; %104_2 
% curexperiment.bad_chans{9} = {'3';'49';'50';'106';'109'}; %106_1
% curexperiment.bad_chans{10} = {'55'}; %106_2
% curexperiment.bad_chans{11} = {'106'}; %107_1
% curexperiment.bad_chans{12} = {'35'}; %107_2 
% curexperiment.bad_chans{13} = {'107';'126';'127'}; %108_1
% curexperiment.bad_chans{14} = {}; %108_2
% curexperiment.bad_chans{15} = {'55';'80';'106'}; %110_1
% curexperiment.bad_chans{16} = {'3';'7';'9';'22';'23';'24';'124'}; %110_2
% curexperiment.bad_chans{17} = {'7';'78';}; %111_1
% curexperiment.bad_chans{18} = {'55';'80'}; %111_2
% curexperiment.bad_chans{19} = {'7';'55'}; %112_1
% curexperiment.bad_chans{20} = {}; %112_2
% curexperiment.bad_chans{21} = {}; %113_1
% curexperiment.bad_chans{22} = {'31'}; %113_2
% curexperiment.bad_chans{23} = {}; %114_1
% curexperiment.bad_chans{24} = {}; %114_2
% curexperiment.bad_chans{25} = {'20'}; %115_1
% curexperiment.bad_chans{26} = {'62'}; %115_2 
% curexperiment.bad_chans{27} = {'55'}; %116_1
% curexperiment.bad_chans{28} = {}; %116_2
% curexperiment.bad_chans{29} = {'55';'126';'127';'128'}; %117_1
% curexperiment.bad_chans{30} = {}; %117_2
% curexperiment.bad_chans{31} = {'17';'20';}; %118_1
% curexperiment.bad_chans{32} = {}; %118_2
% curexperiment.bad_chans{33} = {'20';'21';'88';'89'}; %119_1
% curexperiment.bad_chans{34} = {}; %119_2 
% curexperiment.bad_chans{35} = {'7';'62';'72';'77';'78';'79'}; %120_1
% curexperiment.bad_chans{36} = {'7';'29';'31';}; %120_2
% curexperiment.bad_chans{37} = {'1';'10';'14';'25';'68';'85';'100';'119';'126'}; %121_1
% curexperiment.bad_chans{38} = {'7';'54';'62'}; %121_2
% curexperiment.bad_chans{39} = {'62'}; %122_1
% curexperiment.bad_chans{40} = {'116';'126'}; %122_2
% curexperiment.bad_chans{41} = {}; %123_1
% curexperiment.bad_chans{42} = {'55'}; %123_2
% curexperiment.bad_chans{43} = {'27';'55';'62';'80'}; %124_1
% curexperiment.bad_chans{44} = {'7';'31';'55';'62';'78';'80'}; %124_2
% curexperiment.bad_chans{45} = {}; %125_1
% curexperiment.bad_chans{46} = {}; %125_2
% curexperiment.bad_chans{47} = {'67';'102'}; %126_1
% curexperiment.bad_chans{48} = {'2';'62'}; %126_2 
% curexperiment.bad_chans{49} = {'17';'55'}; %127_1 
% curexperiment.bad_chans{50} = {'20';'23';'45'}; %127_2
% curexperiment.bad_chans{51} = {'55';'62';'126'}; %128_1
% curexperiment.bad_chans{52} = {'7';'35';'62';'126';'127'}; %128_2
% curexperiment.bad_chans{53} = {'55';'78';'79'}; %129_1
% curexperiment.bad_chans{54} = {'17';'20';'55';'86';'92'}; %129_2
% curexperiment.bad_chans{55} = {'8';'14';'21';'25';'78';'79';'106';'117'}; %130_1 DOUBLE CHECK
% curexperiment.bad_chans{56} = {'8';'14';'31';'35';'80'}; %130_2 
% curexperiment.bad_chans{57} = {'61';'62';'80'}; %131_1
% curexperiment.bad_chans{58} = {'59';'60';'61';'65';'106'}; %131_2
% curexperiment.bad_chans{59} = {'80'}; %137_1
% curexperiment.bad_chans{60} = {}; %137_2
% curexperiment.bad_chans{61} = {'62';'127'}; %164_1
% curexperiment.bad_chans{62} = {'20';'55';'126'}; %164_2
% curexperiment.bad_chans{63} = {'21';'106';'127'}; %173_1
% curexperiment.bad_chans{64} = {'69'}; %173_2
%CR__
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(curexperiment.dirroot, '*.raw'); % Change to whatever file you need, using .raw here.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    %% Set-up for retrieving files
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    EEG = pop_fileio(fullFileName, 'dataformat','auto'); %STEP 1
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','m_file_run','gui','off'); 
    EEG.etc.eeglabvers = '2021.0'; % this tracks which version of EEGLAB is being used, you may ignore it
    EEG = eeg_checkset( EEG );
    EEG=pop_chanedit(EEG, 'load',{'/Volumes/hpc-research/enyhus/pblonias/GSN_HydroCel_129_short.sfp','filetype','autodetect'});
    %% High-pass
    EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1)
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    %% Downsample
    EEG = pop_resample(EEG, 100, 0.8, 0.4);EEG = eeg_checkset( EEG ); %Via (Lou et al., 2019); groupSIFT says 0.8, 0.4
    %% Reject channels
    EEG = pop_select( EEG, 'nochannel',curexperiment.bad_chans{k});
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    %% Rereference to average
    EEG = pop_reref( EEG, []);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');
    %[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'saveold',fullFileName,'gui','off'); 
    %[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG,
    %1,'savenew',fullFileName,'gui','off'); %USE THIS LINE AND COMMENT THE
    %REST WHEN YOU NEED TO REJECT ARTIFACTS BY HAND
    %AFTER YOU REJECT ARTIFACTS BY HAND RUN EEGLAB_ARTIFACTS_IMPEXP.m
   %% Reject artifacts by hand here
%     baseFileName1 = theFiles(k).name;
%     fullFileName1 = fullfile(theFiles(k).folder, baseFileName1);
     newStr = erase( baseFileName , '.raw' );
     newStr = erase( newStr , 'KAHN2 ' );
     newStr = strcat( newStr, '.set');
%     artifact_file_name = strcat( '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\Boundary_data_rejections', '\', newStr, '_Artifacts.mat');
%     fprintf(1, 'Now reading artifacts from %s\n',artifact_file_name);
%     load(['/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\Boundary_data_rejections' filesep newStr '_Artifacts.mat'])
%     % use that to reject them in the original dataset
%     EEG = eeg_eegrej(EEG, artifacts);
    EEG = pop_clean_rawdata(EEG, 'FlatlineCriterion','off','ChannelCriterion','off','LineNoiseCriterion','off','Highpass','off','BurstCriterion',80,'WindowCriterion','off','BurstRejection','on','Distance','Euclidian','channels',[]);
    EEG = eeg_checkset( EEG );
    %%%%% %%%%
    %% Epoch
    %newStr = erase( baseFileName , '.raw' )
    %newStr = erase( newStr , 'KAHN2 ' )
    %newStr1 = strcat('\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\Results_Preprocessed\filtered_data_nov_2021_CR\CR_', newStr, '.set')
    %newStr2 = strcat('\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\Results_Preprocessed\filtered_data_nov_2021_hit\Hit_', newStr, '.set')
    EEG = eeg_checkset( EEG );
    crFileName = '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\'
    EEG = pop_epoch( EEG, {  'CR__'  }, [-0.5         1.51], 'newname', 'm_file_run epochs', 'epochinfo', 'yes');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',[crFileName,'CR_',newStr],'gui','off'); 
    A=EEG.epoch;
    number_of_epochs=length ( A(1,:) );
    k_for_name=string(k);
    csvwrite(strcat('CR_',k_for_name,'_number_of_epochs.csv'),number_of_epochs);
    temp_1=strcat('CR_',k_for_name,'_number_of_epochs_is.csv');
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\epochs\')
    try
        movefile(strcat('*csv'), temp_2);
    catch 
        movefile(strcat('*csv'), temp_2);
    end
end
%% make results directory
%% there is a weird issues here where saving the data set using the pop_
%% function says that I don't have permissions. As such, this is a
%% reasonable work around. 
% 
% currDate = strrep(datestr(datetime), ':', '_');
% mkdir('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\', currDate)
% temp = strcat('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\', currDate);
% cd '/Volumes/hpc-research/enyhus/pblonias/Rawfiles'
% movefile('*.set', temp)
% movefile('*.fdt', temp)%only occurs on mac

%% Hit_

close all 
clear all
%% Set up for EEGLAB Preprocessing

%get access to data
%--------------------------------------------------------------------------%
% set-up computer: if you are on campus, use 'Bowdoin'
% if you are not, use 'MacPro'

%curpc = 'Bowdoin'; %load's an older version of eeglab on line 26, proceed
%with caution
curpc = 'Backup';
%curpc = 'offCampus'; %for patrick only right now
if strcmp(curpc,'Bowdoin') %compares if 'curpc' and 'Bowdoin' are the same
    curexperiment.dirroot = '\mnt\research\nyhus_lab\Data\Connectivity\Sessions\AllFiles'; %
elseif strcmp(curpc,'Backup')
    curexperiment.dirroot = '/Volumes/hpc-research/enyhus/pblonias/Rawfiles';
elseif strcmp(curpc,'offCampus')
    curexperiment.dirroot = '\Users\patrickbloniasz\Desktop\data_files';
        if ~isfolder(curexperiment.dirroot)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with .RAW data files.', myFolder);
        uiwait(warndlg(errorMessage));
        curexperiment.dirroot = uigetdir(); % Ask for a new one.
        if myFolder == 0
                %user clicked cancel
                return;
        end
        end
end
% set-up path
if strcmp(curpc,'Bowdoin')
    myMatlab = '\mnt\research\nyhus_lab\eeglab2020_0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
        cd(myMatlab)
    %older version of eeglab, be sure to update (i.e., proceed with caution)
elseif strcmp(curpc,'Backup')
    myMatlab = '/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
elseif strcmp(curpc,'offCampus')
    myMatlab = '[]';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
end

%start EEGLAB%
eeglab

% bad channels rejected by hand EXPERIMNET 1
curexperiment.bad_chans{1} = {'22';'27';'107'}; %101_1
curexperiment.bad_chans{2} = {'13';'31';'32';'56';'80';'105';'106';'111';'128'}; %101_2
curexperiment.bad_chans{3} = {'8';'22';'11';'83'}; %103_1 
curexperiment.bad_chans{4} = {'73';'83';'88'}; %103_2
curexperiment.bad_chans{5} = {'56'}; %104_1 %double check but probs good bro
curexperiment.bad_chans{6} = {'32';'33';'35';'39';'97';'98';'100';'115';'122'}; %104_2
curexperiment.bad_chans{7} = {'98';'100'}; %105_1 
curexperiment.bad_chans{8} = {'1';'14';'31';'32';'70';'126';'127'}; %105_2
curexperiment.bad_chans{9} = {'15';'22'}; %107_1
curexperiment.bad_chans{10} = {}; %107_2
curexperiment.bad_chans{11} = {'9';'107'}; %108_1
curexperiment.bad_chans{12} = {'25';'45';'50'}; %108_2 %25 because of heart beats 
curexperiment.bad_chans{13} = {'116'}; %109_1
curexperiment.bad_chans{14} = {'18';'44';'55';'60';'62';'72';'75';'113'}; %109_2
curexperiment.bad_chans{15} = {'21';'98';'99';'100';'109';}; %110_1
curexperiment.bad_chans{16} = {'2';'9';'14';'18';'21';'87';'103'}; %110_2
curexperiment.bad_chans{17} = {'25';'32'}; %111_1
curexperiment.bad_chans{18} = {'12'}; %111_2
curexperiment.bad_chans{19} = {'98'}; %112_1
curexperiment.bad_chans{20} = {'14';'48'}; %112_2
curexperiment.bad_chans{21} = {'8';'98';'100'}; %113_1
curexperiment.bad_chans{22} = {'25';'93';'97';'98';'100'}; %113_2
curexperiment.bad_chans{23} = {'39';'45';'68'}; %114_1
curexperiment.bad_chans{24} = {}; %114_2
curexperiment.bad_chans{25} = {'45';'103';'107';'109';'122'}; %116_1
curexperiment.bad_chans{26} = {'17';'45';'94';'107';'127'}; %116_2 
curexperiment.bad_chans{27} = {'18';'68';'75';'99';'107';'125'}; %117_1
curexperiment.bad_chans{28} = {'34'}; %117_2
curexperiment.bad_chans{29} = {'8'}; %118_1
curexperiment.bad_chans{30} = {'8';'9';'55';'128'}; %118_2
curexperiment.bad_chans{31} = {'9';'32';'56'}; %119_1
curexperiment.bad_chans{32} = {'1'}; %119_2
curexperiment.bad_chans{33} = {'107';'128'}; %120_1
curexperiment.bad_chans{34} = {'8';'14';'107';'108'}; %120_2 
curexperiment.bad_chans{35} = {'88';'99';'100';'107'}; %121_1
curexperiment.bad_chans{36} = {'3';'32';'56';'73'}; %121_2
curexperiment.bad_chans{37} = {'8';'107'}; %122_1
curexperiment.bad_chans{38} = {'3';'32';'40';'80';'90';'97';'106'}; %122_2
curexperiment.bad_chans{39} = {'5';'12';'20';'28'}; %123_1
curexperiment.bad_chans{40} = {'12';'13';'62'}; %123_2
curexperiment.bad_chans{41} = {'102';'108';'109'}; %124_1
curexperiment.bad_chans{42} = {'62';'76';'107'}; %124_2
curexperiment.bad_chans{43} = {'3';'17';'62'}; %125_1
curexperiment.bad_chans{44} = {'55';'62';'72'}; %125_2
curexperiment.bad_chans{45} = {'18';'56';'63';'64';'68'}; %126_1
curexperiment.bad_chans{46} = {'56'}; %126_2
curexperiment.bad_chans{47} = {'2';'25';'31';'123'}; %127_1
curexperiment.bad_chans{48} = {'2';'31';'42';'47';'123'}; %127_2 
curexperiment.bad_chans{49} = {'25';'126'}; %128_1 
curexperiment.bad_chans{50} = {'127'}; %128_2
curexperiment.bad_chans{51} = {'54';'61';'75';'90';'128'}; %129_1
curexperiment.bad_chans{52} = {'14';'49'}; %129_2
curexperiment.bad_chans{53} = {'12'}; %131_1
curexperiment.bad_chans{54} = {'100'}; %131_2
curexperiment.bad_chans{55} = {'5';'7'}; %132_1
curexperiment.bad_chans{56} = {}; %132_2 
curexperiment.bad_chans{57} = {'100'}; %134_1
curexperiment.bad_chans{58} = {'17'}; %134_2
curexperiment.bad_chans{59} = {}; %138_1
curexperiment.bad_chans{60} = {}; %138_2
curexperiment.bad_chans{61} = {'107'}; %147_1
curexperiment.bad_chans{62} = {}; %147_2

% % bad channels rejected by hand EXPERIMENT 2
% curexperiment.bad_chans{1} = {'21';'106';'127'}; %101_1
% curexperiment.bad_chans{2} = {'69'}; %101_2
% curexperiment.bad_chans{3} = {'25';'89';'126';'127'}; %102_1 
% curexperiment.bad_chans{4} = {'80'}; %102_2
% curexperiment.bad_chans{5} = {'55'}; %103_1 
% curexperiment.bad_chans{6} = {'83'}; %103_2
% curexperiment.bad_chans{7} = {'55'}; %104_1 
% curexperiment.bad_chans{8} = {'106'}; %104_2 
% curexperiment.bad_chans{9} = {'3';'49';'50';'106';'109'}; %106_1
% curexperiment.bad_chans{10} = {'55'}; %106_2
% curexperiment.bad_chans{11} = {'106'}; %107_1
% curexperiment.bad_chans{12} = {'35'}; %107_2 
% curexperiment.bad_chans{13} = {'107';'126';'127'}; %108_1
% curexperiment.bad_chans{14} = {}; %108_2
% curexperiment.bad_chans{15} = {'55';'80';'106'}; %110_1
% curexperiment.bad_chans{16} = {'3';'7';'9';'22';'23';'24';'124'}; %110_2
% curexperiment.bad_chans{17} = {'7';'78';}; %111_1
% curexperiment.bad_chans{18} = {'55';'80'}; %111_2
% curexperiment.bad_chans{19} = {'7';'55'}; %112_1
% curexperiment.bad_chans{20} = {}; %112_2
% curexperiment.bad_chans{21} = {}; %113_1
% curexperiment.bad_chans{22} = {'31'}; %113_2
% curexperiment.bad_chans{23} = {}; %114_1
% curexperiment.bad_chans{24} = {}; %114_2
% curexperiment.bad_chans{25} = {'20'}; %115_1
% curexperiment.bad_chans{26} = {'62'}; %115_2 
% curexperiment.bad_chans{27} = {'55'}; %116_1
% curexperiment.bad_chans{28} = {}; %116_2
% curexperiment.bad_chans{29} = {'55';'126';'127';'128'}; %117_1
% curexperiment.bad_chans{30} = {}; %117_2
% curexperiment.bad_chans{31} = {'17';'20';}; %118_1
% curexperiment.bad_chans{32} = {}; %118_2
% curexperiment.bad_chans{33} = {'20';'21';'88';'89'}; %119_1
% curexperiment.bad_chans{34} = {}; %119_2 
% curexperiment.bad_chans{35} = {'7';'62';'72';'77';'78';'79'}; %120_1
% curexperiment.bad_chans{36} = {'7';'29';'31';}; %120_2
% curexperiment.bad_chans{37} = {'1';'10';'14';'25';'68';'85';'100';'119';'126'}; %121_1
% curexperiment.bad_chans{38} = {'7';'54';'62'}; %121_2
% curexperiment.bad_chans{39} = {'62'}; %122_1
% curexperiment.bad_chans{40} = {'116';'126'}; %122_2
% curexperiment.bad_chans{41} = {}; %123_1
% curexperiment.bad_chans{42} = {'55'}; %123_2
% curexperiment.bad_chans{43} = {'27';'55';'62';'80'}; %124_1
% curexperiment.bad_chans{44} = {'7';'31';'55';'62';'78';'80'}; %124_2
% curexperiment.bad_chans{45} = {}; %125_1
% curexperiment.bad_chans{46} = {}; %125_2
% curexperiment.bad_chans{47} = {'67';'102'}; %126_1
% curexperiment.bad_chans{48} = {'2';'62'}; %126_2 
% curexperiment.bad_chans{49} = {'17';'55'}; %127_1 
% curexperiment.bad_chans{50} = {'20';'23';'45'}; %127_2
% curexperiment.bad_chans{51} = {'55';'62';'126'}; %128_1
% curexperiment.bad_chans{52} = {'7';'35';'62';'126';'127'}; %128_2
% curexperiment.bad_chans{53} = {'55';'78';'79'}; %129_1
% curexperiment.bad_chans{54} = {'17';'20';'55';'86';'92'}; %129_2
% curexperiment.bad_chans{55} = {'8';'14';'21';'25';'78';'79';'106';'117'}; %130_1 DOUBLE CHECK
% curexperiment.bad_chans{56} = {'8';'14';'31';'35';'80'}; %130_2 
% curexperiment.bad_chans{57} = {'61';'62';'80'}; %131_1
% curexperiment.bad_chans{58} = {'59';'60';'61';'65';'106'}; %131_2
% curexperiment.bad_chans{59} = {'80'}; %137_1
% curexperiment.bad_chans{60} = {}; %137_2
% curexperiment.bad_chans{61} = {'62';'127'}; %164_1
% curexperiment.bad_chans{62} = {'20';'55';'126'}; %164_2
% curexperiment.bad_chans{63} = {'21';'106';'127'}; %173_1
% curexperiment.bad_chans{64} = {'69'}; %173_2


% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(curexperiment.dirroot, '*.raw'); % Change to whatever file you need, using .raw here.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    %% Set-up for retrieving files
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    EEG = pop_fileio(fullFileName, 'dataformat','auto'); %STEP 1
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','m_file_run','gui','off'); 
    EEG.etc.eeglabvers = '2021.0'; % this tracks which version of EEGLAB is being used, you may ignore it
    EEG = eeg_checkset( EEG );
    EEG=pop_chanedit(EEG, 'load',{'/Volumes/hpc-research/enyhus/pblonias/GSN_HydroCel_129_short.sfp','filetype','autodetect'});
    %% High-pass
    EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1)
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    %% Downsample
    EEG = pop_resample(EEG, 100, 0.8, 0.4);EEG = eeg_checkset( EEG ); %Via (Lou et al., 2019); groupSIFT says 0.8, 0.4
    %% Reject channels
    EEG = pop_select( EEG, 'nochannel',curexperiment.bad_chans{k});
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    %% Rereference to average
    EEG = pop_reref( EEG, []);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');
    %[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'saveold',fullFileName,'gui','off'); 
    %% Reject artifacts by hand here
%     baseFileName1 = theFiles(k).name;
%     fullFileName1 = fullfile(theFiles(k).folder, baseFileName1);
newStr = erase( baseFileName , '.raw' );
newStr = erase( newStr , 'KAHN2 ' );
newStr = strcat( newStr, '.set');
%     artifact_file_name = strcat( '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\Boundary_data_rejections', '\', newStr, '_Artifacts.mat');
%     fprintf(1, 'Now reading artifacts from %s\n',artifact_file_name);
%     load(['/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\Boundary_data_rejections' filesep newStr '_Artifacts.mat'])
%     % use that to reject them in the original dataset
%     EEG = eeg_eegrej(EEG, artifacts);
    EEG = pop_clean_rawdata(EEG, 'FlatlineCriterion','off','ChannelCriterion','off','LineNoiseCriterion','off','Highpass','off','BurstCriterion',80,'WindowCriterion','off','BurstRejection','on','Distance','Euclidian','channels',[]);
    EEG = eeg_checkset( EEG );
    %%%%% %%%%
    %% Epoch
%     EEG = eeg_checkset( EEG );
%     EEG = pop_epoch( EEG, {  'CR__'  }, [-0.5         1.5], 'newname', 'm_file_run epochs', 'epochinfo', 'yes');
%     [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',fullFileName,'gui','off'); 
%     %EEG = eeg_checkset( EEG );
    %[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0); 
    EEG = eeg_checkset( EEG );
    EEG = pop_epoch( EEG, {  'Hit_'  }, [-0.5         1.51], 'newname', 'm_file_run epochs', 'epochinfo', 'yes');
    hitFileName = '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\'
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',[hitFileName,'Hit_',newStr],'gui','off');     EEG = eeg_checkset( EEG );
    A=EEG.epoch;
    number_of_epochs=length ( A(1,:) );
    k_for_name=string(k);
    csvwrite(strcat('Hit',k_for_name,'_number_of_epochs.csv'),number_of_epochs);
    temp_1=strcat('Hit_',k_for_name,'_number_of_epochs.csv');
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\epochs\')
    movefile(strcat('*csv'), temp_2);
end

%% make results directory
%%% there is a weird issues here where saving the data set using the pop_
%%% function says that I don't have permissions. As such, this is a
%%% reasonable work around. 

% currDate = strrep(datestr(datetime), ':', '_');
% mkdir('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\', currDate)
% temp = strcat('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\', currDate);
% cd '/Volumes/hpc-research/enyhus/pblonias/Rawfiles'
% movefile('*.set', temp)
% movefile('*.fdt', temp)%only occurs on mac


% %% Feb 11th Post-epoch
% %
% % ------------------------------------------------
close all 
clear all
%% Set up for post epoch

%get access to data
%--------------------------------------------------------------------------%
% set-up computer: if you are on campus, use 'Bowdoin'
% if you are not, use 'MacPro'

%curpc = 'Bowdoin'; %load's an older version of eeglab on line 26, proceed
%with caution
curpc = 'Backup';
%curpc = 'offCampus'; %for patrick only right now
if strcmp(curpc,'Bowdoin') %compares if 'curpc' and 'Bowdoin' are the same
    curexperiment.dirroot = '\mnt\research\nyhus_lab\Data\Connectivity\Sessions\AllFiles'; %
elseif strcmp(curpc,'Backup')
    curexperiment.dirroot = '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\';
elseif strcmp(curpc,'offCampus')
    curexperiment.dirroot = '\Users\patrickbloniasz\Desktop\data_files';
        if ~isfolder(curexperiment.dirroot)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with .RAW data files.', myFolder);
        uiwait(warndlg(errorMessage));
        curexperiment.dirroot = uigetdir(); % Ask for a new one.
        if myFolder == 0
                %user clicked cancel
                return;
        end
        end
end
% set-up path
if strcmp(curpc,'Bowdoin')
    myMatlab = '\mnt\research\nyhus_lab\eeglab2020_0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
        cd(myMatlab)
    %older version of eeglab, be sure to update (i.e., proceed with caution)
elseif strcmp(curpc,'Backup')
    myMatlab = '/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
elseif strcmp(curpc,'offCampus')
    myMatlab = '[]';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
end

%start EEGLAB%
eeglab


% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(curexperiment.dirroot, '*.set'); % Change to whatever file you need, using .raw here.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    %% Set-up for retrieving files
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    parent_directory = erase( fullFileName , baseFileName ) 
    EEG = pop_loadset('filename', baseFileName,'filepath',parent_directory);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','m_file_run','gui','off'); 
    EEG.etc.eeglabvers = '2021.0'; % this tracks which version of EEGLAB is being used, you may ignore it
    %% Runica with sub-guassian
    Ncomp = sum(eig(cov(double(EEG.data([1:EEG.nbchan],:)'))) > 1E-7);
    EEG = pop_runica(EEG, 'icatype', 'runica','concatcond', 'on','extended',1,'interupt','on','pca', Ncomp, 'stop', 1e-7);
    EEG = pop_iclabel(EEG, 'default');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    %% Dipfit defaul model
    EEG = pop_dipfit_settings( EEG, 'hdmfile','/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0\plugins\dipfit\standard_BEM\standard_vol.mat','coordformat','MNI','mrifile','\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\eeglab2021.0\plugins\dipfit\standard_BEM\standard_mri.mat','chanfile','\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\eeglab2021.0\plugins\dipfit\standard_BEM\elec\standard_1005.elc','coord_transform',[0.05476 -17.3653 -8.1318 0.075502 0.0031836 -1.5696 11.7138 12.7933 12.213] ,'chansel',[] );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = pop_multifit(EEG, [] ,'threshold',100,'plotopt',{'normlen','on'});%default
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    %% Flag components
    EEG = pop_icflag(EEG, [0 0.7;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]); % Via (Koshiyama et al., 2020)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    try
    EEG = pop_subcomp( EEG,[], 0);
    end
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');
    %% Reject based on residual variance
    rvList = [EEG.dipfit.model.rv];
    goodRvIdx = find(rvList <= 0.15)'; %via (Lou et al., 2019; Koshiyama et al., 2020)
    badRvIDx = find(rvList > 0.15)';
    try
        if length(badRvIDx) >= 1
            EEG = pop_subcomp(EEG, goodRvIdx, 0, 1);
        end
    end
    %% select components inside the brain
    try
    load(EEG.dipfit.hdmfile); % This returns 'vol'.
    dipoleXyz = zeros(length(EEG.dipfit.model),3);
    for icIdx = 1:length(EEG.dipfit.model)
        dipoleXyz(icIdx,:) = EEG.dipfit.model(icIdx).posxyz(1,:);
    end
    depth = ft_sourcedepth(dipoleXyz, vol);
    depthThreshold = 1;
    insideBrainIdx = find(depth<=depthThreshold);
    EEG = pop_subcomp(EEG, insideBrainIdx, 0, 1);
    end
%     % plot the dipoles on an MRI
%     directoryformatlab = '/Volumes/hpc-research/enyhus/pblonias/';
%     figure;pop_dipplot(EEG, [1:size(EEG.icaweights,1)] ,'mri',[directoryformatlab 'eeglab2021.0\plugins\dipfit\standard_BEM\standard_mri.mat'],'summary','on','num','on','normlen','on');
%     % plot the ICA components with dipoles and save
%     figure;pop_topoplot(EEG, 0, [1:size(EEG.icaweights,1)] ,strcat(baseFileName{k}(1:end-4),'_PreProc pruned with ICA'),[],1,'electrodes','off');
%% Save Spectral Data 

    field_loc=string({EEG.chanlocs.labels})';
    z_1=find(field_loc=='1');
    z_2=find(field_loc=='2');
    z_3=find(field_loc=='26');
    z_4=find(field_loc=='32');
    
    s=[z_1, z_2, z_3, z_4]
    for i = s
        % for your epoched data, channel 2
        [spectra,freqs] = spectopo(EEG.data(i,:,:), 0, EEG.srate);

        % delta=1-4, theta=4-8, alpha=8-13, beta=13-30, gamma=30-80
        deltaIdx = find(freqs>1 & freqs<4);
        thetaIdx = find(freqs>4 & freqs<8);
        alphaIdx = find(freqs>8 & freqs<13);
        betaIdx  = find(freqs>13 & freqs<30);
        gammaIdx = find(freqs>30 & freqs<80);

        % compute absolute power
        deltaPower = mean(10.^(spectra(deltaIdx)\10));
        thetaPower = mean(10.^(spectra(thetaIdx)\10));
        alphaPower = mean(10.^(spectra(alphaIdx)\10));
        betaPower  = mean(10.^(spectra(betaIdx)\10));
        gammaPower = mean(10.^(spectra(gammaIdx)\10));

        Absolute_Power_Labels={'deltaPower','thetaPower','alphaPower','betaPower','gammaPower'};
        power=[deltaPower,thetaPower,alphaPower,betaPower,gammaPower];
        power_table=array2table(power,'VariableNames',Absolute_Power_Labels)
        k_for_name=string(k);
        i_for_name=string(i);
        writetable(power_table,strcat('CR_',k_for_name,'participant_power_bands',i_for_name,'channel.csv'))
    end
    
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\Power_Spectrum\')
    movefile(strcat('*csv'), temp_2);
    %% Number of ICs selected as brain
    IC_comps=size(EEG.icaweights,1);
    csvwrite(strcat("CR_IC_comps",k_for_name,"_participant.csv"),IC_comps)
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\CR\ICs\')
    movefile(strcat('*csv'), temp_2);
    %% Save file
    crICAFileName = '/Volumes/hpc-research/enyhus/pblonias/Results_Pre_Granger\CR\'
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',[crICAFileName,'CR_',baseFileName],'gui','off'); 
end

%% Hit 
% Set up for post epoch 

%get access to data
%--------------------------------------------------------------------------%
% set-up computer: if you are on campus, use 'Bowdoin'
% if you are not, use 'MacPro'

%curpc = 'Bowdoin'; %load's an older version of eeglab on line 26, proceed
%with caution
curpc = 'Backup';
%curpc = 'offCampus'; %for patrick only right now
if strcmp(curpc,'Bowdoin') %compares if 'curpc' and 'Bowdoin' are the same
    curexperiment.dirroot = '\mnt\research\nyhus_lab\Data\Connectivity\Sessions\AllFiles'; %
elseif strcmp(curpc,'Backup')
    curexperiment.dirroot = '/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\';
elseif strcmp(curpc,'offCampus')
    curexperiment.dirroot = '\Users\patrickbloniasz\Desktop\data_files';
        if ~isfolder(curexperiment.dirroot)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with .RAW data files.', myFolder);
        uiwait(warndlg(errorMessage));
        curexperiment.dirroot = uigetdir(); % Ask for a new one.
        if myFolder == 0
                %user clicked cancel
                return;
        end
        end
end
% set-up path
if strcmp(curpc,'Bowdoin')
    myMatlab = '\mnt\research\nyhus_lab\eeglab2020_0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
        cd(myMatlab)
    %older version of eeglab, be sure to update (i.e., proceed with caution)
elseif strcmp(curpc,'Backup')
    myMatlab = '/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
elseif strcmp(curpc,'offCampus')
    myMatlab = '[]';
        if ~isfolder(myMatlab)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder with MATLAB.', myMatlab);
        uiwait(warndlg(errorMessage));
        myMatlab = uigetdir(); % Ask for a new one.
        if myMatlab == 0
                %user clicked cancel
                return;
        end
        end
    cd(myMatlab)
end

%start EEGLAB%
eeglab

filePattern = fullfile(curexperiment.dirroot, '*.set'); % Change to whatever file you need, using .raw here.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    %% Set-up for retrieving files
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    parent_directory = erase( fullFileName , baseFileName ) 
    EEG = pop_loadset('filename', baseFileName,'filepath',parent_directory);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','m_file_run','gui','off'); 
    EEG.etc.eeglabvers = '2021.0'; % this tracks which version of EEGLAB is being used, you may ignore it
    %% Runica with sub-guassian
    Ncomp = sum(eig(cov(double(EEG.data([1:EEG.nbchan],:)'))) > 1E-7);
    EEG = pop_runica(EEG, 'icatype', 'runica','concatcond', 'on','extended',1,'interupt','on','pca', Ncomp, 'stop', 1e-7);
    EEG = pop_iclabel(EEG, 'default');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    %% Dipfit defaul model
    EEG = pop_dipfit_settings( EEG, 'hdmfile','/Volumes/hpc-research/enyhus/pblonias/eeglab2021.0\plugins\dipfit\standard_BEM\standard_vol.mat','coordformat','MNI','mrifile','\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\eeglab2021.0\plugins\dipfit\standard_BEM\standard_mri.mat','chanfile','\Volumes\RESEARCH\nyhus_lab\Data\Connectivity\Sessions\AllFiles\eeglab2021.0\plugins\dipfit\standard_BEM\elec\standard_1005.elc','coord_transform',[0.05476 -17.3653 -8.1318 0.075502 0.0031836 -1.5696 11.7138 12.7933 12.213] ,'chansel',[] );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = pop_multifit(EEG, [] ,'threshold',100,'plotopt',{'normlen','on'});%default
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    %% Flag components
    EEG = pop_icflag(EEG, [0 0.7;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]); % Via (Koshiyama et al., 2020)
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    try  
    EEG = pop_subcomp( EEG,[], 0);
    end
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');
    %% Reject based on residual variance
    rvList = [EEG.dipfit.model.rv];
    goodRvIdx = find(rvList <= 0.15)'; %via (Lou et al., 2019; Koshiyama et al., 2020)
    badRvIDx = find(rvList > 0.15)';
    try
        if length(badRvIDx) >= 1
            EEG = pop_subcomp(EEG, goodRvIdx, 0, 1);
        end
    end
    %% select components inside the brain
    try
    load(EEG.dipfit.hdmfile); % This returns 'vol'.
    dipoleXyz = zeros(length(EEG.dipfit.model),3);
    for icIdx = 1:length(EEG.dipfit.model)
        dipoleXyz(icIdx,:) = EEG.dipfit.model(icIdx).posxyz(1,:);
    end
    depth = ft_sourcedepth(dipoleXyz, vol);
    depthThreshold = 1;
    insideBrainIdx = find(depth<=depthThreshold);
    EEG = pop_subcomp(EEG, insideBrainIdx, 0, 1);
    end
    % plot the dipoles on an MRI
%     directoryformatlab = '/Volumes/hpc-research/enyhus/pblonias/';
%     figure;pop_dipplot(EEG, [1:size(EEG.icaweights,1)] ,'mri',[directoryformatlab 'eeglab2021.0\plugins\dipfit\standard_BEM\standard_mri.mat'],'summary','on','num','on','normlen','on');
%     % plot the ICA components with dipoles and save
%     figure;pop_topoplot(EEG, 0, [1:size(EEG.icaweights,1)] ,strcat(baseFileNames{k}(1:end-4),'_PreProc pruned with ICA'),[],1,'electrodes','off');
%% Save Spectral Data 
    field_loc=string({EEG.chanlocs.labels})';
    z_1=find(field_loc=='1');
    z_2=find(field_loc=='2');
    z_3=find(field_loc=='26');
    z_4=find(field_loc=='32');
    
    s=[z_1, z_2, z_3, z_4]
    for i = s
        % for your epoched data, channel 2
        [spectra,freqs] = spectopo(EEG.data(i,:,:), 0, EEG.srate);

        % delta=1-4, theta=4-8, alpha=8-13, beta=13-30, gamma=30-80
        deltaIdx = find(freqs>1 & freqs<4);
        thetaIdx = find(freqs>4 & freqs<8);
        alphaIdx = find(freqs>8 & freqs<13);
        betaIdx  = find(freqs>13 & freqs<30);
        gammaIdx = find(freqs>30 & freqs<80);

        % compute absolute power
        deltaPower = mean(10.^(spectra(deltaIdx)\10));
        thetaPower = mean(10.^(spectra(thetaIdx)\10));
        alphaPower = mean(10.^(spectra(alphaIdx)\10));
        betaPower  = mean(10.^(spectra(betaIdx)\10));
        gammaPower = mean(10.^(spectra(gammaIdx)\10));

        Absolute_Power_Labels={'deltaPower','thetaPower','alphaPower','betaPower','gammaPower'};
        power=[deltaPower,thetaPower,alphaPower,betaPower,gammaPower];
        power_table=array2table(power,'VariableNames',Absolute_Power_Labels)
        k_for_name=string(k);
        i_for_name=string(i);
        writetable(power_table,strcat('HIT_',k_for_name,'participant_power_bands',i_for_name,'channel.csv'))
    end
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\Power_Spectrum\')
    movefile(strcat('*csv'), temp_2);
    %% Number of ICs selected as brain
    IC_comps=size(EEG.icaweights,1);
    csvwrite(strcat("HIT_IC_comps",k_for_name,"_participant.csv"),IC_comps)
    temp_2=('/Volumes/hpc-research/enyhus/pblonias/Results_Preprocessed_and_epoched\HIT\ICs\')
    movefile(strcat('*csv'), temp_2);
    %% Save file
    hitICAFileName = '/Volumes/hpc-research/enyhus/pblonias/Results_Pre_Granger\HIT\'
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',[hitICAFileName,'Hit_',baseFileName],'gui','off'); 

end