function [ b,send_type ] = help( ~ )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=getAllFileNames();
b='Available functions include: ';
for i=1:size(a)-1
    if strendswith(a{i},'.m')
        if ~isbad(a{i})
            b=[b a{i} ', '];
            
        end
    end
    
    
end

if strendswith(a{size(a,1)},'.m')
    if ~isbad(a{i})
        b=[b a{i}];
        
    end
end
b=[b ' | Many of these take a single char input '];
send_type = 'NOTICE';
end

function bad = isbad(s)

bad=(strcmp(s,'bad_word.m')||strcmp(s,'test.m'));


end

function b = strendswith(s, pat)
%STRENDSWITH Determines whether a string ends with a specified pattern
%
%   b = strstartswith(s, pat);
%       returns whether the string s ends with a sub-string pat.
%

%   History
%   -------
%       - Created by Dahua Lin, on Oct 9, 2008
%

%% main

sl = length(s);
pl = length(pat);

b = (sl >= pl && strcmp(s(sl-pl+1:sl), pat)) || isempty(pat);
end

function fileList = getAllFileNames()

dirData = dir(); %# Get the data for the current directory
dirIndex = [dirData.isdir]; %# Find the index for directories
fileList = {dirData(~dirIndex).name}'; %'# Get a list of the files
%   if ~isempty(fileList)
%     fileList = cellfun(@(x) fullfile(dirName,x),... %# Prepend path to files
%                        fileList,'UniformOutput',false);
%   end
%   subDirs = {dirData(dirIndex).name}; %# Get a list of the subdirectories
%   validIndex = ~ismember(subDirs,{'.','..'}); %# Find index of subdirectories
%                                                %# that are not '.' or '..'
%   for iDir = find(validIndex) %# Loop over valid subdirectories
%     nextDir = fullfile(dirName,subDirs{iDir}); %# Get the subdirectory path
%     fileList = [fileList; getAllFileNames(nextDir)]; %# Recursively call getAllFiles
%   end

end