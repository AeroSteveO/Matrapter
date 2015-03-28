function [ output,send_type ] = matlab( msg )
%MATLAB Runs matlab functions and sends output back to the calling function
%           along with the type of message the calling function should use
%   Detailed explanation goes here

disp('Start New Command');
disp(msg);
split_msg = char(msg);

send_type = [];


%disp(split_msg);
try
    if ~isempty(split_msg) && all(ismember(split_msg(1:end),'0123456789-+ /*^()[];.'))
        try
            result=eval(split_msg(1:end));
            if isa(result,'double');
                if length(result)>1
                    output=mat2str(result);
                    send_type='PRIVMSG';
                else
                    output=num2str(result);
                    send_type='PRIVMSG';
                end
            elseif ischar(result);
                output=result;
                send_type='PRIVMSG';
            end
        catch
            output='SYNTAX ERROR: MATH OPERATOR';
            send_type='NOTICE';
        end
    elseif ~isempty(split_msg) && all(ismember(split_msg(1:end),'0123456789! '))
        output='Use factorial(), or go die in a fire';
        send_type='NOTICE';
    elseif ~isempty(split_msg) && all(ismember(split_msg(1:3),'abcdefghijklmnopqurstuvwxyz []()1234567890+-*/;.'))
        [bad,resp]=bad_word(split_msg);
        error=0;
        if ~bad
            try
                %                 if (nargout(split_msg(1:end)==2))
                %
                %                     [result,send_type]=eval(split_msg(1:end));
                %
                %                 else
                
                command=split_msg(1:find(split_msg=='(',1,'first')-1);
                %        args=split_msg(find(split_msg=='(',1,'first')+1:end-1);
                
                if isempty(command)
                    command=split_msg;
                    %            args=[];
                end
                
                if exist(command,'file')==2 %&& cmd_log(command,sent_nick,'passkeyfromthedepthsofhell')
                    if nargout(command)==2 && nargin(command)==1
                        [result,send_type]=eval(split_msg(1:end));
                        result=regexprep(result,'\r\n|\n|\r','');
                    else
                        result=eval(split_msg(1:end));
                    end
                    
                else
                    
                    result=eval(split_msg(1:end));
                    
                end
                %                 end
            catch
                error=1;
                result=0;
            end
            
            if isa(result,'double')% && ~bad
                if error==0;
                    if length(result)>1
                        output=mat2str(result);
                        if isempty(send_type)
                            send_type='PRIVMSG';
                        end
                    else
                        output=num2str(result);
                        if isempty(send_type)
                            send_type='PRIVMSG';
                        end
                    end
                else
                    output='SYNTAX ERROR: CMD DOUBLE OUTPUT';
                    send_type='NOTICE';
                end
            elseif ischar(result)% && ~bad
                if error==0;
                    output=result;
                    if isempty(send_type)
                        send_type='PRIVMSG';
                    end
                else
                    output='SYNTAX ERROR: CMD CHAR OUTPUT';
                    send_type='NOTICE';
                end
            end
        else
%             result=[];
            output=resp;
            if isempty(send_type)
                send_type='PRIVMSG';
            end
        end
    else
        output='SYNTAX ERROR: CMD OPERATOR';
        send_type='NOTICE';
    end
    
    
catch
    output='ERROR: SOMETHING BROKE OR THE FUNCIONALITY HASN''T BEEN INTEGRATED YET';
    send_type='NOTICE';
end
if isempty(split_msg)
    output='MATRABBB';
    send_type='PRIVMSG';
end