# Matrapter
Matrapter is a bot that has been developed by Steve-O originating as a proof of concept irc bot built 100% in MATLAB. Since then, it has been given a Java/PircBotX IRC frontend with matlab running functions through the !matlab command on the backend. All the original bot’s functionality remains, with the added benefit of stability.

## Matlab Commands
**[Public]**
* !Matlab [input function, math expression, etc]
  * Input functions need to be valid MATLAB functions that return char, double, or matrices **Example:**
    * \<~Steve-O> !matlab sin(exp(factorial(5)))
    * \<Matrapter> 0.61855
    * \<~Steve-O> !matlab sin(.23 * pi) / atan(12 * exp(1)^.5)
    * \<Matrapter> 0.43499
  * The input can also be valid math as though Matrapter were a glorified calculator **Example:** 
    * \<~Steve-O> !matlab ((23*34)/3^4)^(1/3)
    * \<Matrapter> 2.1293
    * \<Steve-O> !matlab [1 34 5 6] * [34 ; 3 ; 78 ; 09]
    * \<Matrapter> 580
  * There is also a help function that lists out custom functions built for matrapter, this can be called like any other matlab function within the bot; “!matlab help()”.
  * Things that aren't allowed: 
    * Variable setting and using
    * Outputs to the MATLAB terminal
    * Unix commands from within MATLAB
    * Lots and lots of functions, commands and toolboxes

  * When a blocked function is called, Matrapter will return a random denial message. This can also be run like any other function; “!matlab deny()”
    * Example: \<~Steve-O> !matlab ls
    * \<Matrapter> Please don’t make me do that
    
**[Bot Owner Only Commands]**
* !Start
  * Starts a MATLAB if no session is currently connected
* !Stop
  * Kills the currently connected session of MATLAB
* !Restart
  * Restarts the currently connected MATLAB session

## Latent Functions
*(Stuff that runs automagically)*
  * Auto-joins channels when invited via chanserv

## Administrative Functions
**[Bot Owner Only Commands]**
* Matrapter, shutdown
  * Turns off Matrapter
* Matrapter, join [#channel]
* Matrapter, please join [#channel]
  * Commands Matrapter to join the given channel
* Matrapter, leave [#channel]
* Matrapter, please leave [#channel]
  * Commands Matrapter to leave the given channel, if no channel is given, it’ll leave the one the command is sent from
* Matrapter, fix yourself
  * Ghosts main nick, changes to main nick, identifies to nickserv
* Matrapter, sysInfo
  * Responds with the current number of threads being used, as well as free ram and used ram
  
**[Channel Owners and Bot Owner Only Commands]**
* Matrapter, leave
* Matrapter, please leave
  * Commands Matrapter to leave the channel the command is sent from
