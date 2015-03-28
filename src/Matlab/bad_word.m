function [bool,a] = bad_word(msg)
% bad_word    Provides succinct answers to almost any question.
%   bool = 1 if there is a bad word in the msg
%   bool = 0 if there is not a bad word in the msg
%   a = [] if there is no bad words
%   a = a random response if there are bad words
a=[];
bool=0;
load('bad_list.mat')
n=1;
while n<=length(bad_list)&&bool==0
    is_it_bad=strfind(msg,bad_list{n});
    if ~isempty(is_it_bad)
        bool=1;
        a=deny([]);
        a(1) = upper(a(1));
    end
    n=n+1;
end
if strcmp(msg,'list')
   a=bad_list{1};
   for n=2:length(bad_list)
       a=[a ', ' bad_list{n}];
   end
end