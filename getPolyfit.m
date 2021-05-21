function [features,iFeature]=getPolyfit(nWindows,currPw,f,iFeature,features)
%function returns slopes and intercepts vectors for windows of current Pwelch matrix

slopes=zeros(1,nWindows);       %slopes for all windows
intercepts=zeros(1,nWindows);   %intercepts for all windows
for window=1:nWindows
    p=polyfit(log(currPw(:,window)),log(f)',1); % matlab function for finding coeffecients
    slopes(window)=p(1);
    intercepts(window)=p(2);
end
%adding to features matrix
features(iFeature,:)=slopes;
iFeature=iFeature+1;
features(iFeature,:)=intercepts;
iFeature=iFeature+1;
end