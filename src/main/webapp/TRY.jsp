<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("name"); // Get username from session
    String currentRoomId = request.getParameter("roomId");   // Get current roomId from URL
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

        .app-container {
            display: flex;
            width: 900px;
            height: 700px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Left sidebar styles */
        .sidebar {
            width: 35%;
            background-color: #f0f2f5;
            border-right: 1px solid #e9edef;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .sidebar-header {
            padding: 15px;
            background-color: #f0f2f5;
            border-bottom: 1px solid #e9edef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sidebar-title {
            font-weight: bold;
            color: #3b4a54;
        }

        .new-room-btn {
            background: none;
            border: none;
            color: #00a884;
            font-size: 24px;
            cursor: pointer;
        }

        .room-list {
            flex: 1;
            overflow-y: auto;
        }

        .room-item {
            padding: 12px 15px;
            border-bottom: 1px solid #e9edef;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .room-item:hover {
            background-color: #f5f6f6;
        }

        .room-item.active {
            background-color: #e9edef;
        }

        .room-name {
            font-weight: 500;
            color: #111b21;
        }

        .room-status {
            font-size: 12px;
            color: #667781;
        }

        /* Right chat area styles */
        .chat-area {
            width: 65%;
            display: flex;
            flex-direction: column;
        }

        .chat-header {
            padding: 15px;
            background-color: #f0f2f5;
            border-bottom: 1px solid #e9edef;
            text-align: center;
            font-weight: bold;
            color: #3b4a54;
        }

        .chat-box {
            flex: 1;
            padding: 10px;
            background-color: #e5ddd5;
            background-image: url('https://web.whatsapp.com/img/bg-chat-tile-light_a4be512e7195b6b733d9110b408f075d.png');
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .msg {
            max-width: 70%;
            padding: 8px 12px;
            border-radius: 7.5px;
            margin: 5px 0;
            word-wrap: break-word;
            font-size: 14px;
            position: relative;
        }

        .msg-left {
            background-color: #ffffff;
            align-self: flex-start;
            border-top-left-radius: 0;
        }

        .msg-right {
            background-color: #d9fdd3;
            align-self: flex-end;
            border-top-right-radius: 0;
        }

        .chat-input {
            display: flex;
            padding: 10px;
            background-color: #f0f2f5;
            gap: 10px;
            align-items: center;
        }

        input[type="text"] {
            flex: 1;
            padding: 10px 15px;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            background-color: #ffffff;
        }

        .send-btn {
            padding: 10px;
            border-radius: 50%;
            background-color: #00a884;
            color: white;
            border: none;
            cursor: pointer;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .send-btn:disabled {
            background-color: #aebac1;
            cursor: not-allowed;
        }

        .system-msg {
            text-align: center;
            color: #667781;
            font-size: 12px;
            margin: 10px 0;
            font-style: italic;
        }

        /* New room modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }

        .modal-title {
            margin-top: 0;
            color: #3b4a54;
        }

        .modal-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #e9edef;
            border-radius: 5px;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .modal-btn {
            padding: 8px 15px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .modal-btn-primary {
            background-color: #00a884;
            color: white;
        }

        .modal-btn-secondary {
            background-color: #f0f2f5;
            color: #3b4a54;
        }
        .room-status.Active {
            color: #00a884;
            font-weight: bold;
        }
        .room-status.Active {
            color: #00a884;
            font-weight: bold;
        }
        .room-status.Available {
            color: #667781;
        }
        .room-status.Error {
            color: #ff0000;
        }
        .room-name {
            font-weight: 500;
            color: #000000; /* Changed from #111b21 to #000000 for pure black */
        }
    </style>
</head>



<body>
<% if (username == null || username.isEmpty()) { %>
    <div class="app-container">
        <div style="width: 100%; text-align: center; padding: 40px;">
            <h2>Session Expired</h2>
            <p style="color: red;">Username not found in session.</p>
            <p>Please <a href="login.jsp">login again</a>.</p>
        </div>
    </div>
<% } else { %>
         <div class="app-container">
             <!-- Left sidebar with all rooms -->
             <div class="sidebar">
                 <div class="sidebar-header">
                     <div class="sidebar-title">Chat Rooms</div>
                     <button class="new-room-btn" id="newRoomBtn">+</button>
                 </div>
                 <div class="room-list" id="roomList">
                     <!-- Rooms will be loaded dynamically via JavaScript -->
                 </div>
             </div>

        <!-- Right chat area -->
        <div class="chat-area">
            <% if (currentRoomId == null || currentRoomId.isEmpty()) { %>
                <div class="chat-header">Select a chat room</div>
                <div class="chat-box" style="justify-content: center; align-items: center; color: #667781;">
                    <p>Please select a chat room from the sidebar or create a new one</p>
                </div>
            <% } else { %>
                <div class="chat-header" id="chatHeader">Room: <%= currentRoomId %></div>
                <div class="chat-box" id="chatBox"></div>
                <div class="chat-input">
                    <input type="text" id="msg" placeholder="Type your message..." oninput="toggleSendButton()" />
                    <button class="send-btn" id="sendBtn" onclick="sendMessage()" disabled>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="22" y1="2" x2="11" y2="13"></line>
                            <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                        </svg>
                    </button>
                </div>
            <% } %>
        </div>
    </div>

    <!-- New Room Modal -->
    <div class="modal" id="newRoomModal">
        <div class="modal-content">
            <h3 class="modal-title">Create New Room</h3>
            <input type="text" class="modal-input" id="newRoomId" placeholder="Enter room ID" />
            <div class="modal-actions">
                <button class="modal-btn modal-btn-secondary" id="cancelBtn">Cancel</button>
                <button class="modal-btn modal-btn-primary" id="createBtn">Create</button>
            </div>
        </div>
    </div>

    <script>
        var sockets = {};
        var currentRoom = "<%= currentRoomId %>";
        var username = "<%= username %>";

        // Initialize the app
        document.addEventListener('DOMContentLoaded', function() {
            // Load rooms from localStorage
            loadRooms();

            // Highlight current room if one is selected
            if (currentRoom && currentRoom !== "") {
                highlightCurrentRoom(currentRoom);
                connectToRoom(currentRoom);
            }

            // Setup event listeners
            setupEventListeners();
        });

       function loadRooms() {
           const roomList = document.getElementById('roomList');
           console.log("Room list element:", roomList); // Verify we get the element

           const rooms = getRoomsFromStorage();
           console.log("Rooms from storage:", rooms); // Verify rooms are loaded

           // Clear existing rooms safely
           while (roomList.firstChild) {
               roomList.removeChild(roomList.firstChild);
           }

           // Add each room to sidebar
           rooms.forEach(room => {
               console.log("Adding room:", room); // Verify each room is processed
               addRoomToSidebar(room);
           });

           console.log("Final room list children:", roomList.children); // Verify rooms were added
       }
       function getRoomsFromStorage() {
           try {
               const roomsJson = localStorage.getItem('chatRooms');
               if (!roomsJson || roomsJson === 'null') {
                   // Initialize with default rooms if none exist
                   const defaultRooms = ['Self'];
                   localStorage.setItem('chatRooms', JSON.stringify(defaultRooms));
                   return defaultRooms;
               }
               return JSON.parse(roomsJson);
           } catch (e) {
               console.error("Error loading rooms from storage:", e);
               return ['Self']; // Fallback to default rooms
           }
       }


        function saveRoomsToStorage(rooms) {
            localStorage.setItem('chatRooms', JSON.stringify(rooms));
        }

         function addRoomToSidebar(roomId) {
             const roomList = document.getElementById('roomList');
             if (!roomList) {
                 console.error("Room list element not found!");
                 return;
             }

             // Check if room already exists
             if (document.querySelector(`.room-item[data-room="${roomId}"]`)) {
                 console.log(`Room ${roomId} already exists in sidebar`);
                 return;
             }

             console.log(`Creating element for room ${roomId}`);
             const roomItem = document.createElement('div');
             roomItem.className = 'room-item';
             roomItem.setAttribute('data-room', roomId);

             // Create room name element
             const roomName = document.createElement('div');
             roomName.className = 'room-name';
             roomName.textContent = roomId;
             roomName.style.color = '#000000'; // Ensure black color

             // Create status element
             const roomStatus = document.createElement('div');
             roomStatus.className = 'room-status';
             roomStatus.id = `status-${roomId}`;

             // Append elements
             roomItem.appendChild(roomName);
             roomItem.appendChild(roomStatus);
             roomList.appendChild(roomItem);

             // Set initial status

             // Add click handler
             roomItem.addEventListener('click', function() {
                 console.log(`Clicked room ${roomId}`);
                 joinRoom(roomId);
             });

             console.log(`Added room ${roomId} to sidebar`);
         }

        function setupEventListeners() {
            document.getElementById('newRoomBtn').addEventListener('click', openModal);
            document.getElementById('cancelBtn').addEventListener('click', closeModal);
            document.getElementById('createBtn').addEventListener('click', createNewRoom);

            document.getElementById('msg').addEventListener('keypress', function(e) {
                if (e.key === 'Enter' && !document.getElementById('sendBtn').disabled) {
                    sendMessage();
                }
            });

            document.getElementById('newRoomId').addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    createNewRoom();
                }
            });
        }

        function joinRoom(roomId) {
            window.location.href = window.location.pathname + '?roomId=' + roomId;
        }

        function connectToRoom(roomId) {
            if (sockets[roomId]) return;

            const socket = new WebSocket("ws://" + window.location.host + "<%= request.getContextPath() %>/chat/" + roomId + "?username=" + encodeURIComponent(username));

            sockets[roomId] = socket;

            socket.onopen = function() {
                addSystemMessage(`🟢 Connected to room ${roomId}`);
            };

            socket.onclose = function() {
                addSystemMessage(`🔴 Disconnected from room ${roomId}`);
                delete sockets[roomId];
            };

            socket.onmessage = function(event) {
                displayMessage(event.data);
            };

            socket.onerror = function(error) {
                console.error("WebSocket error:", error);
                updateRoomStatus(roomId, "Error");
            };
        }

        function updateRoomStatus(roomId, status) {
                const statusElement = document.getElementById(`status-${roomId}`);
                if (statusElement) {
                    statusElement.textContent = status;
                    // Remove all status classes
                    statusElement.classList.remove('Active', 'Available', 'Error');
                    // Add the current status class
                    statusElement.classList.add(status);
                }
            }

        function highlightCurrentRoom(roomId) {
            document.querySelectorAll('.room-item').forEach(item => {
                item.classList.remove('active');
            });

            const currentRoomItem = document.querySelector(`.room-item[data-room="${roomId}"]`);
            if (currentRoomItem) {
                currentRoomItem.classList.add('active');
            }
        }

        function displayMessage(msgText) {
            const chatBox = document.getElementById("chatBox");

            if (msgText.startsWith("🟢") || msgText.startsWith("🔴")) {
                const systemMsg = document.createElement('div');
                systemMsg.className = 'system-msg';
                systemMsg.textContent = msgText;
                chatBox.appendChild(systemMsg);
            } else {
                const messageDiv = document.createElement('div');
                messageDiv.classList.add('msg');

                const isOwnMessage = msgText.startsWith(username + ":");
                messageDiv.classList.add(isOwnMessage ? 'msg-right' : 'msg-left');
                messageDiv.textContent = msgText;

                chatBox.appendChild(messageDiv);
            }

            chatBox.scrollTop = chatBox.scrollHeight;
        }

        function sendMessage() {
            if (!currentRoom || !sockets[currentRoom]) return;

            const msgInput = document.getElementById("msg");
            const message = username + ": " + msgInput.value.trim();

            if (message.length <= username.length + 2) return;

            sockets[currentRoom].send(message);
            msgInput.value = "";
            toggleSendButton();
        }

        function toggleSendButton() {
            const msgInput = document.getElementById("msg");
            const sendBtn = document.getElementById("sendBtn");
            sendBtn.disabled = msgInput.value.trim() === "";
        }

        function openModal() {
            document.getElementById('newRoomModal').style.display = 'flex';
            document.getElementById('newRoomId').focus();
        }

        function closeModal() {
            document.getElementById('newRoomModal').style.display = 'none';
            document.getElementById('newRoomId').value = '';
        }

        function createNewRoom() {
            const newRoomId = document.getElementById('newRoomId').value.trim();
            if (!newRoomId) {
                alert('Please enter a room ID');
                return;
            }

            // Check if room already exists
            const rooms = getRoomsFromStorage();
            if (rooms.includes(newRoomId)) {
                alert('Room already exists');
                return;
            }

            // Add new room to storage
            rooms.push(newRoomId);
            saveRoomsToStorage(rooms);

            // Add to sidebar
            addRoomToSidebar(newRoomId);

            // Close modal and clear input
            closeModal();

            // Optionally join the new room automatically
            joinRoom(newRoomId);
        }

        function addSystemMessage(text) {
            const chatBox = document.getElementById("chatBox");
            if (!chatBox) return;

            const systemMsg = document.createElement('div');
            systemMsg.className = 'system-msg';
            systemMsg.textContent = text;
            chatBox.appendChild(systemMsg);
            chatBox.scrollTop = chatBox.scrollHeight;
        }
    </script>
<% } %>
</body>
</html>







