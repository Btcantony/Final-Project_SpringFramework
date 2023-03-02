package main.java.com.web.chat;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import main.java.com.web.dto.upbit.Upbit;
import main.java.com.web.dto.upbit.UpbitMemory;
import main.java.com.web.dto.upbit.UpbitUi;
import main.java.com.web.dto.upbit.UpbitUser;

@Component
public class WebSockChatHandler extends TextWebSocketHandler {
	//private Logger logger = Logger.getLogger(WebSockChatHandler.class);
	
//	private Logger logger = Log
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		//logger.info("connected session id + " + session.getId());
		sessionList.add(session);		
		for(WebSocketSession s : sessionList) {
			//s.sendMessage(new TextMessage("connected..."));
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {		
		Upbit upbit = new Upbit();
		try {
			UpbitUi upbitUi = new Gson().fromJson(message.getPayload(), UpbitUi.class);						
			for(WebSocketSession s : sessionList) {
				if(session.getId().equals(s.getId())) { // 자신에게만
					for (UpbitUser upbitUser : UpbitMemory.UpbitUsers) {
						if(upbitUser.getAccess_key().equals(upbitUi.getAccess_key())) {
							upbit.setUpbitUser(upbitUser);
							upbit.setUpbitMarkets(UpbitMemory.UpbitMarkets);
							upbit.setUpbitTickers(UpbitMemory.UpbitTickers);							
						}
					}
					upbit.success();
					s.sendMessage(new TextMessage(new Gson().toJson(upbit)));	
				}			
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {		
		//logger.info("disconnected session id + " + session.getId());		
		sessionList.remove(session);
		for(WebSocketSession s : sessionList) {
			//s.sendMessage(new TextMessage("disconnected..."));
		}			
	}
}
