<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
    <style>
        #chat-box {
            width: 100%;
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            margin-bottom: 10px;
        }
        #message {
            width: 80%;
        }
        #send {
            width: 18%;
        }
    </style>
</head>
<body>
    <h2>WebSocket Chat</h2>
    <div id="chat-box"></div>
    <input type="text" id="message" placeholder="Type your message here...">
    <button id="send">Send</button>

    <script>
        const username = prompt("Enter your username:");
        const chatBox = document.getElementById('chat-box');
        const messageInput = document.getElementById('message');
        const sendButton = document.getElementById('send');

        // Ensure the WebSocket URL matches your server's configuration
        http://
        const socket = new WebSocket(`ws://localhost:8081/hackathon/chat/${username}`);

        socket.onopen = function(event) {
            chatBox.innerHTML += '<div><em>Connected to the chat server.</em></div>';
        };

        socket.onmessage = function(event) {
            const message = event.data;
            chatBox.innerHTML += `<div>${message}</div>`;
            chatBox.scrollTop = chatBox.scrollHeight;
        };

        socket.onclose = function(event) {
            chatBox.innerHTML += '<div><em>Disconnected from the chat server.</em></div>';
        };

        socket.onerror = function(error) {
            console.error('WebSocket error:', error);
        };

        sendButton.onclick = function() {
            sendMessage();
        };

        messageInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                sendMessage();
            }
        });

        function sendMessage() {
            const message = messageInput.value.trim();
            if (message !== '') {
                socket.send(message);
                messageInput.value = '';
            }
        }
    </script>
</body>
</html>
