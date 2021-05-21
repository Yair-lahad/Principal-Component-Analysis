function [features,iFeature]= getRelativeFeatures(iFeature,nFreq,features,currPw,freqOrder,total_power)
% function updates the relative power for each frequency band and add it to Features matrix

for i=1:nFreq
    %relative Power for current frequency band (delta,theta, etc)
    currBand=currPw(freqOrder{i},:);
    curr_bandPow=sum(currBand);
    features(iFeature,:)=curr_bandPow./total_power;
    iFeature=iFeature+1;
end
end