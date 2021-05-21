function plotPCA(subjectNum,seizureNum,expTime,nWindows,encodedVec)
% function recives PCA encoded vectors of the eigen vectors fit for the highest eigen values
% function plots 2D and 3D subplots of data

%% Setting Variables
labelsSize=12;
scatterSize=8;
titleSize=12;
paper_width = 16.5; %cm
figure_ratio  = 0.48;
timeVec=(-expTime:expTime/(nWindows-1):0);
figure('Units', 'centimeters', 'Position', [1 1 paper_width figure_ratio*paper_width]);
str = ['Patient ' num2str(subjectNum) ', ' 'Seizure ' num2str(seizureNum)];
sgtitle(str);
hold on;

%% Plotting
%3D Projection subplot
subplot 121;
scatter3(encodedVec(1,:),encodedVec(2,:),encodedVec(3,:),scatterSize,timeVec,'filled');
title('3D Projection','FontSize',titleSize);
xlabel('PC-1','FontSize',labelsSize);
ylabel('PC-2','FontSize',labelsSize);
zlabel('PC-3','FontSize',labelsSize);
%2D Projection subplot
subplot 122;
scatter(encodedVec(1,:),encodedVec(2,:),scatterSize,timeVec,'filled');
title('2D Projection','FontSize',titleSize);
xlabel('PC-1','FontSize',labelsSize);
ylabel('PC-2','FontSize',labelsSize);
% Color map
cb = colorbar; colormap default;
cb.Label.String = "Time to seizure [min]";
cb.Label.FontSize = 13;
hold off;
end