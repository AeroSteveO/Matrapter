function [a] = ignite(it)
% BURN    Provides quick ways to light any input on fire.
%   BURN, by itself, burns 'it'.
%   BURN(it) burns the provided object.
%   Please embellish or modify this function to suit your own tastes.
if strcmp(it,' ')||strcmp(it,'')||isempty(it)
    it='it';
end
a = [front it burn_end];
a = upper(a);

%------------------

function a = front
switch randi(19)
    case 1
        a='burn ';
    case 2
        a='bake ';
    case 3
        a='broil ';
    case 4
        a='roast ';
    case 5
        a='vaporize ';
    case 6
        a='sublimate ';
    case 7
        a='cremate ';
    case 8
        a='toast ';
    case 9
        a='melt ';
    case 10
        a='brand ';
    case 11
        a='incinerate ';
    case 12
        a='carbonize ';
	case 13
		a='Flay ';
	case 14
		a='attack ';
	case 15
		a='constipate ';
    case 16
		a='gasify ';
	case 17
		a='zap ';
	case 18
		a='atomize ';
	case 19
		a='bombard ';
		
end
function a = burn_end
switch randi(28)
    case 1
        a=' with nukes';
    case 2
        a=' with gasoline';
    case 3
        a=' with dicks';
    case 4
        a=' with diesel fuel';
    case 5
        a=' with babies';
    case 6
        a=' with the broken dreams of engineers';
    case 7
        a=' with plasma';
    case 8
        a=' with plasmids';
    case 9
        a=' with thermite';
    case 10
        a=' in a toaster';
    case 11
        a=' in an oven like mommas cookies'; 
    case 12
        a=' with fire';
    case 13
        a=' in a bonfire';
    case 14
        a=' in the nether';
    case 15
        a=' in a blaze of failure';
    case 16
        a=' with the unused art degrees of baristas';
    case 17
        a=' with napalm';
    case 18
        a=' with exploding barrels';
    case 19
        a=' using a chemical thrower';
    case 20
        a=' like you mean it';
    case 21
        a=' like a pyromaniac';
    case 22
        a=' in the center of a star';
    case 23
        a=' in the corona of a star';
    case 24
        a=' in the heart of a volcano';
    case 25
        a=' in the exhaust of the space shuttle';
    case 26
        a=' with lasers';
    case 27
        a=' with ejected plasma from the corona of the sun';
	case 28
		a=' with a carebearstare';
end