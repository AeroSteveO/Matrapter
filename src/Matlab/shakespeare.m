function [a] = shakespeare(it)
% Shakespeare    Provides shakespearean era insults.
%   shakespeare, by itself, insults 'thou'.
%   shakespeare(it) insults the provided object.
%   Source:
%   http://www.tastefullyoffensive.com/2011/10/shakespeare-insult-kit.html
if strcmp(it,' ')||strcmp(it,'')||isempty(it)
    a = ['Thou ' front ' ' mid ' ' insult_end];
    a(1) = upper(a(1));
else
    a = [it ', Thou ' front ' ' mid ' ' insult_end];
    a(1) = upper(a(1));
end

%------------------

function a = front
switch randi(50)
    case 1
        a='artless';
    case 2
        a='bawdy';
    case 3
        a='beslubbering';
    case 4
        a='bootless';
    case 5
        a='churlish';
    case 6
        a='cockered';
    case 7
        a='dankish';
    case 8
        a='dissembling';
    case 9
        a='droning';
    case 10
        a='errant';
    case 11
        a='fawning';
    case 12
        a='fobbing';
    case 13
        a='froward';
    case 14
        a='frothy';
    case 15
        a='gleeking';
    case 16
        a='goatish';
    case 17
        a='gorbellied';
    case 18
        a='impertinent';
    case 19
        a='infectious';
    case 20
        a='jarring';
    case 21
        a='loggerheaded';
    case 22
        a='lumpish';
    case 23
        a='mammering';
    case 24
        a='mangled';
    case 25
        a='mewling';
    case 26
        a='paunchy';
    case 27
        a='pribbling';
    case 28
        a='puking';
    case 29
        a='puny';
    case 30
        a='qualling';
    case 31
        a='rank';
    case 32
        a='reeky';
    case 33
        a='roguish';
    case 34
        a='ruttish';
    case 35
        a='saucy';
    case 36
        a='spleeny';
    case 37
        a='spongy';
    case 38
        a='surly';
    case 39
        a='tottering';
    case 40
        a='unmuzzled';
    case 41
        a='vain';
    case 42
        a='venomed';
    case 43
        a='villainous';
    case 44
        a='warped';
    case 45
        a='wayward';
    case 46
        a='weedy';
    case 47
        a='yeasty';
    case 48
        a='clouted';
    case 49
        a='cockered';
    case 50
        a='currish';
end
function a = insult_end
switch randi(50)
    case 1
        a='apple-john';
    case 2
        a='boar-pig';
    case 3
        a='bugbear';
    case 4
        a='bum-bailey';
    case 5
        a='clack-dish';
    case 6
        a='canker-dish';
    case 7
        a='clotpole';
    case 8
        a='coxcomb';
    case 9
        a='cod-piece';
    case 10
        a='death-token';
    case 11
        a='dewberry';
    case 12
        a='flap-dragon';
    case 13
        a='flax-wench';
    case 14
        a='flirt-gill';
    case 15
        a='foot-licker';
    case 16
        a='fustilarian';
    case 17
        a='giglet';
    case 18
        a='gudgeon';
    case 19
        a='haggard';
    case 20
        a='harpy';
    case 21
        a='hedge-pig';
    case 22
        a='horn-beast';
    case 23
        a='hugger-mugger';
    case 24
        a='joithead';
    case 25
        a='lewdster';
    case 26
        a='lout';
    case 27
        a='maggot-pie';
    case 28
        a='malt-worm';
    case 29
        a='mammet';
    case 30
        a='measle';
    case 31
        a='minnow';
    case 32
        a='miscreant';
    case 33
        a='moldwarp';
    case 34
        a='mumble-news';
    case 35
        a='nut-hook';
    case 36
        a='pigeon-egg';
    case 37
        a='pignut';
    case 38
        a='puttock';
    case 39
        a='pumpion';
    case 40
        a='ratsbane';
    case 41
        a='scut';
    case 42
        a='skainsmate';
    case 43
        a='strumpet';
    case 44
        a='varlot';
    case 45
        a='vassal';
    case 46
        a='whey-face';
    case 47
        a='wagtail';
    case 48
        a='baggage';
    case 49;
        a='barnacle';
    case 50
        a='bladdar';
end
function a = mid
switch randi(50)
    case 1
        a='base-court';
    case 2
        a='bat-fowling';
    case 3
        a='beef-witted';
    case 4
        a='beetle-headed';
    case 5
        a='boil-brained';
    case 6
        a='clapper-clawed';
    case 7
        a='clay-brained';
    case 8
        a='common-kissing';
    case 9
        a='crook-pated';
    case 10
        a='dismal-dreaming';
    case 11
        a='dizzy-eyed';
    case 12
        a='doghearted';
    case 13
        a='dread-bolted';
    case 14
        a='earth-vexing';
    case 15
        a='elf-skinned';
    case 16
        a='fat-kidneyed';
    case 17
        a='fen-sucked';
    case 18
        a='flap-mouthed';
    case 19
        a='fly-bitten';
    case 20
        a='folly-fallen';
    case 21
        a='fool-born';
    case 22
        a='full-gorged';
    case 23
        a='guts-griping';
    case 24
        a='half-faced';
    case 25
        a='hasty-witted';
    case 26
        a='hedge-born';
    case 27
        a='hell-hated';
    case 28
        a='idle-headed';
    case 29
        a='ill-breeding';
    case 30
        a='ill-nurtured';
    case 31
        a='knotty-pated';
    case 32
        a='milk-livered';
    case 33
        a='motley-minded';
    case 34
        a='onion-eyed';
    case 35
        a='plume-plucked';
    case 36
        a='pottle-deep';
    case 37
        a='pox-marked';
    case 38
        a='reeling-ripe';
    case 39
        a='rough-hewn';
    case 40
        a='rude-growing';
    case 41
        a='rump-fed';
    case 42
        a='shard-borne';
    case 43
        a='sheep-biting';
    case 44
        a='spur-galled';
    case 45
        a='swag-bellied';
    case 46
        a='tardy-gaited';
    case 47
        a='tickle-brained';
    case 48
        a='toad-spotted';
    case 49;
        a='unchin-snouted';
    case 50
        a='weather-bitten';
end