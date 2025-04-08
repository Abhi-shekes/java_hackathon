package com.hackthon.websocket;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint(value = "/chat/{username}")
public class ChatServerEndpoint {

    private static final Set<ChatServerEndpoint> chatEndpoints = new CopyOnWriteArraySet<>();
    private Session session;
    private String username;

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) throws IOException {
        this.session = session;
        this.username = username;
        chatEndpoints.add(this);
        broadcast("User " + username + " has joined the chat.");
    }

    @OnMessage
    public void onMessage(String message) throws IOException {
        broadcast(username + ": " + message);
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        chatEndpoints.remove(this);
        broadcast("User " + username + " has left the chat.");
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Handle error
        throwable.printStackTrace();
    }

    private static void broadcast(String message) throws IOException {
        for (ChatServerEndpoint endpoint : chatEndpoints) {
            synchronized (endpoint) {
                endpoint.session.getBasicRemote().sendText(message);
            }
        }
    }
}
