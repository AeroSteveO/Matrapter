function [ resp,type ] = badcmd( ~ )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
type='NOTICE';
[~,resp]=bad_word('list');
end

