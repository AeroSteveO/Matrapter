/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package MatlabTestBot;

import Objects.Runner;
import org.pircbotx.Configuration;
import org.pircbotx.PircBotX;
import org.pircbotx.Configuration.*;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.ConnectEvent;
import org.pircbotx.hooks.events.InviteEvent;
import org.pircbotx.hooks.events.KickEvent;
import org.pircbotx.hooks.events.MessageEvent;
import org.pircbotx.hooks.managers.BackgroundListenerManager;

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
        BackgroundListenerManager BackgroundListener = new BackgroundListenerManager();
        
        Configuration.Builder configuration = new Configuration.Builder()
                .setName(Global.mainNick)                    //Set the nick of the bot. CHANGE IN YOUR CODE
                .setLogin("MATLAB")                        // login part of hostmask, eg name:login@host
                .setFinger("Undefined function or variable 'finger'.")
                .setNickservPassword(Global.nickPass)
                .setAutoNickChange(true)               // Automatically change nick when the current one is in use
                .setCapEnabled(true)                   // Enable CAP features
                .addAutoJoinChannel("#rapterverse")
                .addAutoJoinChannel("#dtella")
                .setAutoReconnect(true)
                .setMaxLineLength(425)                 // This is for the IRC networks I use, it can be increased/decreased as needed
                .setListenerManager(BackgroundListener)// Allow for logger background listener
                .addListener(new MatrapterMain())
//                .addListener(new Logger())
                .addListener(new BotControl())
                .addListener(new Matlab())
                .setServerHostname("irc.dhirc.com"); //Join the official #pircbotx channel
        BackgroundListener.addListener(new Logger(),true); //Add logger background listener
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