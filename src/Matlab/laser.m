function [a] = laser(it)
% LASER    Provides quick ways to make anything more awesome.
%   LASER, by itself, adds lasers to 'it'.
%   LASER(it) adds lasers to the provided object.
%   Please embellish or modify this function to suit your own tastes.
if strcmp(it,' ')||strcmp(it,'')||isempty(it)
    it='it';
end
switch randi(4)
    case 1
        parts=setup1;
        a = [parts{1} ' ' it ' ' parts{2}  ' lasers'];
    case 2
        parts=setup2;
        a = [parts{1} ' lasers ' parts{2} ' ' it];
    case 3
        parts=setup2;
        a = [parts{1} ' lasers ' parts{2} ' ' it];
    case 4
        a = ['laser cut ' it ' into a ' shape];
end
a = upper(a);

function a=setup1
part1={'make','create','build','genetically alter','burn'};
part2={'with','with','out of','using','through the use of'};
n=randi(length(part1));
a={part1{n},part2{n}};

function a=setup2
part1={'add','strap','put'};
part2={'to','on','into'};
n=randi(length(part1)+2);
if n<=length(part1)
    a=part1{n};
elseif n==length(part1)+1
    a=tape;
else
    a=glue;
end
a={a part2{randi(length(part2))} };

function a=glue
glues={'epoxy','wood glue','gorilla glue','cyanoacrelate','super glue','JB Weld',...
    'elmers glue','tree sap','bird poop'};
a=glues{randi(length(glues))};

function a=tape
tapes={'duct tape','masking tape','blue tape','gorilla tape','scotch tape','double sided tape'};
a=tapes{randi(length(tapes))};

function a=shape
shapes={'square','circle','triangle','hexagon','heptagon','octagon','pyramid',...
    'dodecahedron','booby','penis','pentagon'};
a=shapes{randi(length(shapes))};