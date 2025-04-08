package com.hackthon.websocket;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chat/{roomId}")
public class ChatEndpoint {

    private static final Map<String, Set<Session>> roomSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId) throws IOException {
        roomSessions.computeIfAbsent(roomId, k -> new CopyOnWriteArraySet<>()).add(session);
        String username = getUsernameFromSession(session);
        broadcastToRoom(roomId, "🟢 " + username + " joined");
    }

    @OnClose
    public void onClose(Session session, @PathParam("roomId") String roomId) throws IOException {
        Set<Session> room = roomSessions.get(roomId);
        if (room != null) {
            room.remove(session);
            if (room.isEmpty()) {
                roomSessions.remove(roomId);
            } else {
                String username = getUsernameFromSession(session);
                broadcastToRoom(roomId, "🔴 " + username + " left");
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") String roomId) throws IOException {
        broadcastToRoom(roomId, message);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }

    private String getUsernameFromSession(Session session) {
        try {
            Map<String, List<String>> params = session.getRequestParameterMap();
            if (params.containsKey("username")) {
                return params.get("username").get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Unknown User";
    }

    private void broadcastToRoom(String roomId, String message) throws IOException {
        Set<Session> room = roomSessions.get(roomId);
        if (room != null) {
            for (Session s : room) {
                if (s.isOpen()) {
                    s.getBasicRemote().sendText(message);
                }
            }
        }
    }
}
