function [features,iFeature]= getRelativeLogFeatures(iFeature,nFreq,features,currPw,freqOrder)
% function updates relative log power for each frequency band and add it to Features matrix

for i=1:nFreq
    %relative log power for current frequency band
    currBand=currPw(freqOrder{i},:);
    curr_log_band=sum(log(exp(1).*currBand./min(currBand)));
    total_log_pw=sum(log(exp(1).*currPw./min(currPw)));
    features(iFeature,:)=curr_log_band./total_log_pw;
    iFeature=iFeature+1;
end
end