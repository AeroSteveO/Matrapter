/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MatlabTestBot;

import matlabcontrol.MatlabProxy;

/**
 *
 * @author Stephen
 */
public class MatlabDisconnectListener implements MatlabProxy.DisconnectionListener{
    @Override
    public void proxyDisconnected(MatlabProxy proxy){
        Global.bot.sendIRC().message(Global.botOwner, "PROXY DISCONNECTED");
    }
    
}
