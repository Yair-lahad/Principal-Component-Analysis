clear all;
clc;
%% Exercise 5- Principal component analysis (PCA) of Epileptic Seizures

%% Setting variables
files=dir('..\DATA_DIR\**\*.mat'); %get the files ending with ".mat"
data=dataHandle(files); % using a function to handle and filter our data
nElectrodes=19;
nFeatures=18;
fs = 250;               % sample rate in Hz
recTime=length(data(1).recordings)/(fs*60); % time in minutes
jump=0.1;
f= 1:jump:40;           % frequencies
nSubjects=length(data);
window=40*fs;           % in seconds
overlap=20*fs;          % in seconds
pw_window=4*fs;
pw_overlap=2*fs;
nReducedDim=3;          % number of dimensions to use in pca
%setting frequencies in Hz
freqOrder=getFreqOrder(f);  % function returns cell with frequency bands
nFreq=length(freqOrder);

%% EEG Feature Extraction
for subj=1: nSubjects
    iFeature=1;             % location to add current feature
    for electrode=1: nElectrodes
        % reshape vector of each electorde from EEG data, into windowed matrice, let go of redundent information saved in z vector
        [dataWindows,z]=buffer(data(subj).recordings(electrode,:), window,overlap,'nodelay');
        currPw=pwelch(dataWindows,pw_window,pw_overlap,f,fs);
        nWindows= size(currPw,2);
        if electrode==1
            features=zeros(nElectrodes*nFeatures,nWindows); % total features per electrode
        end
        total_power=sum(currPw);
        pnorm= currPw./total_power;
        % function to calculate features, returns matrice per electrode and index to add next feature
        [features,iFeature]=getElectrodeFeatures(currPw,total_power,pnorm,iFeature,nFreq,nWindows,features,freqOrder,f);
    end
    features=zscore(features,0,2); %zscore per feature
    % PCA
    encodedVecs=getPCA(features,nWindows,nReducedDim);
    % Plotting
    plotPCA(data(subj).subjectNum,data(subj).seizureNum,recTime,nWindows,encodedVecs)
end
