/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package MatlabTestBot;

import org.pircbotx.PircBotX;

/**
 *
 * @author Steve-O
 * botOwner      - User with all powers over the bot, and ability to shut the bot down
 * mainNick      - The intended nickname for the bot, not necessarily the current nickname
 * nickPass      - The nickServ password for the bot
 * commandPrefix - The character that signals the bot that a command is being sent
 * reconnect     - Boolean to activate the aggressive server reconnect loop
 * bot           - Current PircBotX bot object
 *
 */
public class Global {
    public static String botOwner = "Steve-O"; //Updated in the Main .java file from Setings.XML
    public static String mainNick = "Matrapter"; //Updated in the Main .java file from Setings.XML
    public static String nickPass = "***REMOVED***"; //Updated in the Main .java file from Setings.XML
    public static boolean reconnect = true;
    public static PircBotX bot;
    public static String commandPrefix = "!";       // Not implemented yet in other functions
}