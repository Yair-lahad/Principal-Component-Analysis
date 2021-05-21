function data=dataHandle(files)
%this function receives a structure of mat files
%returns struct only with subjects with proper number and seizure number

data=struct('recordings',{},'subjectNum',{},'seizureNum',{});
subjInd=1;
for file=1:length(files)
    name = files(file).name; % current subject from Subjects folders
    %filter only files who have subject number, and seizure number
    expression = ['p(?<subN>\d+)_s(?<seizN>\d+)'];
    tokenNames= regexp(name,expression,'names');
    if ~isempty(tokenNames)
        data(subjInd).subjectNum=str2double(tokenNames.subN);
        data(subjInd).seizureNum=str2double(tokenNames.seizN);
        data(subjInd).recordings=load([files(file).folder '\' name]).data;
        subjInd=subjInd+1;
    end
end
