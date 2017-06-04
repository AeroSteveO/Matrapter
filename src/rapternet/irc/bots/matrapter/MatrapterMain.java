/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package rapternet.irc.bots.matrapter;

import rapternet.irc.bots.matrapter.objects.Runner;
import rapternet.irc.bots.matrapter.objects.SimpleSettings;
import java.util.ArrayList;
import java.util.Arrays;
import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.Configuration.*;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.ConnectEvent;
import org.pircbotx.hooks.events.InviteEvent;
import org.pircbotx.hooks.events.KickEvent;
import org.pircbotx.hooks.events.MessageEvent;

/**
 *
 * @author Steve-O
 */
public class MatrapterMain extends ListenerAdapter {
    
    @Override
    public void onMessage(final MessageEvent event) throws Exception {
        // in case something should be done here
        
    }
    @Override
    // Rejoin on Kick
    public void onKick(KickEvent event) throws Exception {
        if (event.getRecipient().getNick().equals(event.getBot().getNick())) {
            event.getBot().sendIRC().joinChannel(event.getChannel().getName());
        }
    }
    @Override
    // Joins channels it has been invited to
    public void onInvite(InviteEvent event) {
        event.getBot().sendIRC().joinChannel(event.getChannel());
    }
    
    @Override
    // Set mode +B for Bots
    public void onConnect(ConnectEvent event) throws Exception {
        event.getBot().sendRaw().rawLine("mode " + event.getBot().getNick() + " +B");
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        //Setup this bot
        SimpleSettings serverSettings = new SimpleSettings("BotSettings.json");
        if (serverSettings.isEmpty()){
            serverSettings.create("server", "irc.yoursite.com");
            serverSettings.create("nick","Matrapter");
            serverSettings.create("login", "MATLAB");
            serverSettings.create("botowner", "yournick");
            serverSettings.create("commandprefix", "!");
            serverSettings.create("port", "6667");
            serverSettings.create("channels",new ArrayList<String>(Arrays.asList(new String[]{"#channel1","#channel2"})));
//            serverSettings.create("botadmins",new ArrayList<String>(Arrays.asList(new String[]{"admin1","admin2"})));
            serverSettings.create("password","password");
            serverSettings.save();
            System.out.println("A new settings file has been generated, please fill out the file and restart the bot");
            System.exit(0);
        }
        
        ArrayList<String> channels = serverSettings.getArray("channels");
        Global.mainNick = serverSettings.getString("nick");
        Global.nickPass = serverSettings.getString("password");
        Global.botOwner = serverSettings.getString("botowner");
        Global.commandPrefix = serverSettings.getString("commandprefix");
        
        Configuration.Builder configuration = new Configuration.Builder()
                .setName(Global.mainNick)                // Set the nick of the bot. CHANGE IN YOUR CODE
                .setLogin(serverSettings.getString("login"))               // login part of hostmask, eg name:login@host
                .setAutoNickChange(true)             // Automatically change nick when the current one is in use
                .setCapEnabled(true)                 // Enable CAP features
//                .addAutoJoinChannel("#trivia")
                .setNickservPassword(Global.nickPass)
                .setFinger("Undefined function or variable 'finger'.")
                .setNickservPassword(Global.nickPass)
                .setAutoNickChange(true)               // Automatically change nick when the current one is in use
                .setCapEnabled(true)                   // Enable CAP features
                .setAutoReconnect(true)
                .setMaxLineLength(425)                 // This is for the IRC networks I use, it can be increased/decreased as needed
                .addListener(new MatrapterMain())
//                .addListener(new Logger())
                .addListener(new BotControl())
                .addListener(new Matlab())
                .setServerPort(Integer.parseInt(serverSettings.getString("port")))
                .setServerHostname(serverSettings.getString("server")); //Join the official #pircbotx channel
//        Configuration config = configuration.buildConfiguration();
        
        for (int i=0;i<channels.size();i++){ //Add channels from XML and load into channels Object
            configuration.addAutoJoinChannel(channels.get(i));
        }
        Configuration config = configuration.buildConfiguration();


        //bot.connect throws various exceptions for failures
        try {
            Global.bot = new PircBotX(config);
            Runner parallel = new Runner(Global.bot);
            Thread t = new Thread(parallel);
            parallel.giveT(t);
            t.start();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Failed to start bot");
        }
    }
}