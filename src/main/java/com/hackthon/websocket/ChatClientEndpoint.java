package com.hackthon.websocket;
import javax.websocket.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;

@ClientEndpoint
public class ChatClientEndpoint {

    private Session userSession;
    private MessageHandler messageHandler;
    private final CountDownLatch latch = new CountDownLatch(1);

    public ChatClientEndpoint(String uri) {
        try {
            WebSocketContainer container = ContainerProvider.getWebSocketContainer();
            container.connectToServer(this, new URI(uri));
            latch.await(); // Wait for the connection to establish
        } catch (DeploymentException | URISyntaxException | IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    @OnOpen
    public void onOpen(Session userSession) {
        this.userSession = userSession;
        latch.countDown(); // Release the latch
    }

    @OnMessage
    public void onMessage(String message) {
        if (messageHandler != null) {
            messageHandler.handleMessage(message);
        }
    }

    @OnClose
    public void onClose(Session userSession, CloseReason reason) {
        this.userSession = null;
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Handle error
        throwable.printStackTrace();
    }

    public void addMessageHandler(MessageHandler msgHandler) {
        this.messageHandler = msgHandler;
    }

    public void sendMessage(String message) {
        this.userSession.getAsyncRemote().sendText(message);
    }

    public static interface MessageHandler {
        void handleMessage(String message);
    }
}
