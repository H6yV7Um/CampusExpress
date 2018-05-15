package com.xkj.ce.web.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

@Component("pushMsgHandler")
public class PushMsgHandler implements WebSocketHandler {
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("================afterConnectionEstablished=================");
		TextMessage msg = new TextMessage("你好协和医院，请问有什么可以帮助您的吗?");
//		session.sendMessage(msg);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		System.out.println("================handleMessage=================");
		System.out.println("这是前台发来的:"+message.getPayload());
		
		TextMessage msg = new TextMessage("管理员收到,正在用力审核");
		session.sendMessage(msg);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("================handleTransportError=================");
		TextMessage msg = new TextMessage((CharSequence) exception);
		session.sendMessage(msg);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		System.out.println("================afterConnectionClosed=================");

	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}
	

}
