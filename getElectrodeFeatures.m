function [features,iFeature]= getElectrodeFeatures(currPw,total_power,pnorm,iFeature,nFreq,nWindows,features,freqOrder,f)
% function for calculation of features.
% recives Pwelch matrix,total power,pnorm,startIndex(iFeature)...
...number of frequencies and windows,order of frequencies with Hz bandpass...
...features matrix for output and frequencies vector
% returns matrix with added 2*nFreq + 6 features for each window

topDecile=0.9;
% function which calculates relatives power and relatives log power
[features,iFeature]=getRelativeFeatures(iFeature,nFreq,features,currPw,freqOrder,total_power);
% function which calculates relatives log power
[features,iFeature]=getRelativeLogFeatures(iFeature,nFreq,features,currPw,freqOrder);
% root total power
features(iFeature,:)=sqrt(total_power);
iFeature=iFeature+1;
% function which calculates slope and intercept
[features,iFeature]=getPolyfit(nWindows,currPw,f,iFeature,features);
% spectral moment
features(iFeature,:)= f*pnorm;
iFeature=iFeature+1;
%spectral edge
criticalFreqsMat = diff(cumsum(pnorm)>topDecile); 
[~,criticalFreqIndexs] = max(criticalFreqsMat);
features(iFeature,:) = f(criticalFreqIndexs);
iFeature=iFeature+1;
%spectral entropy
features(iFeature,:)= sum(-(pnorm.*log2(pnorm)));
iFeature=iFeature+1;
end