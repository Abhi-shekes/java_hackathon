<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("name"); // Get username from session
    String roomId = request.getParameter("roomId");          // Get roomId from URL
%>
<html>
<head>
    <title>Hackathon Chat</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #eae6df;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #ffffff;
            width: 400px;
            height: 600px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .chat-header {
            padding: 15px;
            background-color: #075e54;
            color: white;
            text-align: center;
            font-weight: bold;
        }

        .chat-box {
            flex: 1;
            padding: 10px;
            background-color: #ece5dd;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .msg {
            max-width: 70%;
            padding: 10px 15px;
            border-radius: 20px;
            margin: 5px 0;
            word-wrap: break-word;
        }

        .msg-left {
            background-color: #ffffff;
            align-self: flex-start;
        }

        .msg-right {
            background-color: #dcf8c6;
            align-self: flex-end;
        }

        .chat-input {
            display: flex;
            padding: 10px;
            background-color: #f0f0f0;
            gap: 10px;
        }

        input[type="text"] {
            flex: 1;
            padding: 10px;
            border-radius: 20px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            padding: 10px 20px;
            border-radius: 20px;
            background-color: #25d366;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        button:disabled {
            background-color: #9de8c4;
            cursor: not-allowed;
        }
    </style>

    <script>
        var socket;

        function connect() {
            var roomId = "<%= roomId %>";
            if (!roomId) {
                alert("Room ID is required.");
                return;
            }

            socket = new WebSocket("ws://" + window.location.host + "<%= request.getContextPath() %>/chat/" + roomId + "?username=<%= username %>");

            socket.onmessage = function (event) {
                var chatBox = document.getElementById("chatBox");
                var msgText = event.data;

                var messageDiv = document.createElement("div");
                messageDiv.classList.add("msg");

                if (msgText.startsWith("🟢") || msgText.startsWith("🔴")) {
                    messageDiv.style.textAlign = "center";
                    messageDiv.style.backgroundColor = "transparent";
                    messageDiv.style.color = "#666";
                    messageDiv.style.fontStyle = "italic";
                    messageDiv.textContent = msgText;
                } else {
                    var isOwnMessage = msgText.startsWith("<%= username %>:");
                    messageDiv.classList.add(isOwnMessage ? "msg-right" : "msg-left");
                    messageDiv.textContent = msgText;
                }

                chatBox.appendChild(messageDiv);
                chatBox.scrollTop = chatBox.scrollHeight;
            };
        }

        function sendMessage() {
            var msgInput = document.getElementById("msg");
            var message = "<%= username %>: " + msgInput.value.trim();
            socket.send(message);
            msgInput.value = "";
            toggleSendButton();
        }

        function toggleSendButton() {
            var msgInput = document.getElementById("msg");
            var sendBtn = document.getElementById("sendBtn");
            sendBtn.disabled = msgInput.value.trim() === "";
        }
    </script>
</head>

<body onload="<% if (username != null && !username.isEmpty() && roomId != null && !roomId.isEmpty()) { %>connect();<% } %>">
<div class="container">

    <% if (username == null || username.isEmpty()) { %>
        <div class="chat-header">Session Expired</div>
        <div class="chat-box" style="justify-content: center; align-items: center; color: red;">
            <p style="text-align: center;">Username not found in session.<br>Please <a href="login.jsp">login again</a>.</p>
        </div>

    <% } else if (roomId == null || roomId.isEmpty()) { %>
        <div class="chat-header">Join a Room</div>
        <div class="chat-box" style="justify-content: center; align-items: center;">
            <form method="get" style="display: flex; flex-direction: column; gap: 10px; width: 80%;">
                <input type="text" name="roomId" placeholder="Enter room ID" required />
                <button type="submit">Join Chat</button>
            </form>
        </div>

    <% } else { %>
        <div class="chat-header">Hello, <%= username %> 👋 | Room: <%= roomId %></div>
        <div class="chat-box" id="chatBox"></div>
        <div class="chat-input">
            <input type="text" id="msg" placeholder="Type your message..." oninput="toggleSendButton()" />
            <button id="sendBtn" onclick="sendMessage()" disabled>Send</button>
        </div>
    <% } %>
</div>
</body>
</html>
