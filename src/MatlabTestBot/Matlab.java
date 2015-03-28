/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package MatlabTestBot;

import Utils.OSUtils;
import matlabcontrol.*;
import org.pircbotx.Colors;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.MessageEvent;

/**
 *
 * @author Stephen
 */
public class Matlab extends ListenerAdapter{
    MatlabProxyFactory factory = setupProxyFactory();
    MatlabProxy proxy = setupMatlabProxy();
    
    @Override
    public void onMessage(MessageEvent event) throws Exception {
        String message = Colors.removeFormattingAndColors(event.getMessage().trim());
        
        if (message.startsWith(Global.commandPrefix)&&message.length()>1){
//                        String command = message.split(Global.commandPrefix)[1];
            String[] cmdSplit = message.split(Global.commandPrefix)[1].split(" ");
            
            if (cmdSplit[0].equalsIgnoreCase("matlab")){
                
                if (proxy.isConnected()){
                    
                    String command = new String();
                    if (message.split(" ").length>1)
                        command = message.split(" ",2)[1];
                    
                    command = command.replaceAll("'","''").toLowerCase();
                    command = "matlab('"+command+"')";
                    
//            System.out.println(command);
//                String mathString;
                    Object[] unParsedReturn;
                    String responseType;
                    String response;
                    
                    try{
                        unParsedReturn = (Object[]) proxy.returningEval(command, 2);
                        
//                    System.out.println(unParsedReturn.length);
//                for (int i=0;i<unParsedReturn.length;i++){
//                    System.out.println(unParsedReturn[i]);
//
//                }
                        
                        response = (String) unParsedReturn[0];
                        responseType = (String) unParsedReturn[1];
                    }
                    catch(Exception ex){
                        System.out.println("Command Failed");
                        System.out.println(command);
                        ex.printStackTrace();
                        return;
                    }
                    
                    
                    if (responseType.equalsIgnoreCase("PRIVMSG")){
                        if (response.length()>=375){
                            response = response.substring(0,Math.min(response.length(),375)).trim()+"...";
                        }
                        event.getBot().sendIRC().message(event.getChannel().getName(),response);
                    }
                    
                    else if (responseType.equalsIgnoreCase("NOTICE")){
                        event.getBot().sendIRC().notice(event.getUser().getNick(),response);
                    }
                    
                    else if (responseType.equalsIgnoreCase("ACTION")){
                        if (response.length()>=375){
                            response = response.substring(0,Math.min(response.length(),375)).trim()+"...";
                        }
                        event.getBot().sendIRC().action(event.getChannel().getName(),response);
                    }
                }
                else{
                    event.getBot().sendIRC().notice(event.getUser().getNick(), "MATLAB is not currently connected, contact "+Global.botOwner+" to have it restarted");
                }
            }
            
            else if (cmdSplit[0].equalsIgnoreCase("start")&&(event.getUser().getNick().equalsIgnoreCase(Global.botOwner)||event.getUser().getNick().equalsIgnoreCase("theDoctor"))&&event.getUser().isVerified()){
                if (!proxy.isConnected()){
                    setupMatlabProxy();
                    event.getBot().sendIRC().message(event.getChannel().getName(),"MATLAB started");
                }
                else{
                    event.getBot().sendIRC().message(event.getChannel().getName(),"MATLAB is already running");
                }
                
            }
            
            else if (cmdSplit[0].equalsIgnoreCase("stop")&&(event.getUser().getNick().equalsIgnoreCase(Global.botOwner)||event.getUser().getNick().equalsIgnoreCase("theDoctor"))&&event.getUser().isVerified()){
                if (!proxy.isConnected()){
                    event.getBot().sendIRC().message(event.getChannel().getName(),"MATLAB is already stopped");
                }
                else{
                    killMatlabProxy();
                }
            }
            
            
            else if (cmdSplit[0].equalsIgnoreCase("restart")&&(event.getUser().getNick().equalsIgnoreCase(Global.botOwner)||event.getUser().getNick().equalsIgnoreCase("theDoctor"))&&event.getUser().isVerified()){
                killMatlabProxy();
                proxy = setupMatlabProxy();
                event.respond("MATLAB restarted");
            }
        }
        else if (message.equalsIgnoreCase(Global.mainNick+", shutdown")&&event.getUser().getNick().equalsIgnoreCase(Global.botOwner)&&event.getUser().isVerified()){
            killMatlabProxy();
            Global.reconnect = false;
            event.getBot().sendIRC().message(event.getChannel().getName(), "Undefined function or variable 'run'.");
            event.getBot().sendIRC().quitServer("Consumed all Matrices");
            System.exit(0);
        }
        
    }
    private MatlabProxyFactory setupProxyFactory(){
        
//        MatlabProxyFactory newFactory;
        
        if (!OSUtils.isWindows()){
            MatlabProxyFactoryOptions options = new MatlabProxyFactoryOptions.Builder()
                    .setHidden(true)
//                    .setProxyTimeout(60000L)
                    .setMatlabLocation("/usr/local/MATLAB/R2011a/bin/matlab")
                    .setUsePreviouslyControlledSession(true)
                    .build();
            MatlabProxyFactory newFactory = new MatlabProxyFactory(options);
            return (newFactory);
        }
        else{
            MatlabProxyFactory newFactory = new MatlabProxyFactory();
            return newFactory;
        }
    }
    
    
    private MatlabProxy setupMatlabProxy() {
        try{
            
            MatlabProxy newProxy = factory.getProxy();
            newProxy.addDisconnectionListener(new MatlabDisconnectListener());
            newProxy.eval("cd src/Matlab");
            
            return newProxy;
        }catch (Exception ex){
            System.out.println("UNABLE TO GET PROXY");
            ex.printStackTrace();
            return null;
        }
    }
    
    private void killMatlabProxy() throws MatlabInvocationException{
        proxy.exit();
    }
}