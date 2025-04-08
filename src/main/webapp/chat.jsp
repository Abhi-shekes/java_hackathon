<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat - Marketing Team - ChatWave</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .message-container {
            max-height: calc(100vh - 200px);
            overflow-y: auto;
        }
    </style>
</head>
<body class="bg-gray-50 h-screen flex flex-col">
    <!-- Header -->
    <header class="bg-white shadow-sm">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <div class="flex-shrink-0 flex items-center">
                        <h1 class="text-2xl font-bold text-purple-600">ChatWave</h1>
                    </div>
                </div>
                <div class="flex items-center">
                    <button type="button" class="p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        <span class="sr-only">View notifications</span>
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                        </svg>
                    </button>
                    <div class="ml-3 relative">
                        <div>
                            <button type="button" class="max-w-xs bg-white flex items-center text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                <span class="sr-only">Open user menu</span>
                                <img class="h-8 w-8 rounded-full" src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="flex-1 flex overflow-hidden">
        <!-- Sidebar -->
        <div class="w-64 bg-white border-r border-gray-200 flex-shrink-0">
            <div class="h-full flex flex-col">
                <!-- Search -->
                <div class="p-4 border-b border-gray-200">
                    <div class="relative rounded-md shadow-sm">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                            </svg>
                        </div>
                        <input type="text" name="search" id="search" class="focus:ring-purple-500 focus:border-purple-500 block w-full pl-10 sm:text-sm border-gray-300 rounded-md" placeholder="Search">
                    </div>
                </div>

                <!-- Chats -->
                <div class="flex-1 overflow-y-auto">
                    <div class="p-4">
                        <h2 class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Direct Messages</h2>
                        <ul class="mt-2 space-y-1">
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-50">
                                    <img class="h-8 w-8 rounded-full mr-2" src="https://randomuser.me/api/portraits/women/32.jpg" alt="">
                                    <span>Sarah Johnson</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-50">
                                    <img class="h-8 w-8 rounded-full mr-2" src="https://randomuser.me/api/portraits/men/46.jpg" alt="">
                                    <span>Michael Chen</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-50">
                                    <img class="h-8 w-8 rounded-full mr-2" src="https://randomuser.me/api/portraits/women/65.jpg" alt="">
                                    <span>Emily Rodriguez</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="p-4">
                        <h2 class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Group Chats</h2>
                        <ul class="mt-2 space-y-1">
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 bg-gray-100">
                                    <span class="w-8 h-8 rounded-full bg-purple-100 text-purple-700 flex items-center justify-center mr-2">
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                        </svg>
                                    </span>
                                    <span>Marketing Team</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-50">
                                    <span class="w-8 h-8 rounded-full bg-green-100 text-green-700 flex items-center justify-center mr-2">
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                                        </svg>
                                    </span>
                                    <span>Project Alpha</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="flex items-center px-3 py-2 text-sm font-medium rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-50">
                                    <span class="w-8 h-8 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center mr-2">
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                                        </svg>
                                    </span>
                                    <span>General</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Create New Chat -->
                <div class="p-4 border-t border-gray-200">
                    <button type="button" class="w-full flex items-center justify-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                        </svg>
                        New Chat
                    </button>
                </div>
            </div>
        </div>

        <!-- Chat Area -->
        <div class="flex-1 flex flex-col bg-white">
            <!-- Chat Header -->
            <div class="border-b border-gray-200 px-6 py-4 flex items-center">
                <div class="flex-shrink-0">
                    <span class="w-10 h-10 rounded-full bg-purple-100 text-purple-700 flex items-center justify-center">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                    </span>
                </div>
                <div class="ml-3">
                    <h2 class="text-lg font-medium text-gray-900">Marketing Team</h2>
                    <p class="text-sm text-gray-500">5 members • 2 online</p>
                </div>
                <div class="ml-auto flex items-center">
                    <button type="button" class="inline-flex items-center p-2 border border-transparent rounded-full shadow-sm text-gray-400 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </button>
                    <button type="button" class="ml-2 inline-flex items-center p-2 border border-transparent rounded-full shadow-sm text-gray-400 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Messages -->
            <div class="flex-1 p-6 overflow-y-auto message-container">
                <div class="space-y-6">
                    <!-- Day Divider -->
                    <div class="flex items-center">
                        <div class="flex-grow border-t border-gray-200"></div>
                        <span class="flex-shrink mx-4 text-sm text-gray-400">Today</span>
                        <div class="flex-grow border-t border-gray-200"></div>
                    </div>

                    <!-- Message: Other Person -->
                    <div class="flex items-start">
                        <img class="h-10 w-10 rounded-full mr-4" src="https://randomuser.me/api/portraits/women/32.jpg" alt="">
                        <div>
                            <div class="flex items-center">
                                <h3 class="text-sm font-medium text-gray-900">Sarah Johnson</h3>
                                <span class="ml-2 text-xs text-gray-500">10:32 AM</span>
                            </div>
                            <div class="mt-1 bg-gray-100 rounded-lg p-3 text-sm text-gray-700">
                                <p>Hey team! I've just finished the marketing report for Q2. I'll be sharing it with everyone shortly.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Message: Other Person with File -->
                    <div class="flex items-start">
                        <img class="h-10 w-10 rounded-full mr-4" src="https://randomuser.me/api/portraits/women/32.jpg" alt="">
                        <div>
                            <div class="flex items-center">
                                <h3 class="text-sm font-medium text-gray-900">Sarah Johnson</h3>
                                <span class="ml-2 text-xs text-gray-500">10:35 AM</span>
                            </div>
                            <div class="mt-1 bg-gray-100 rounded-lg p-3 text-sm text-gray-700">
                                <p>Here's the file:</p>
                                <div class="mt-2 flex items-center p-2 border border-gray-200 rounded-md bg-white">
                                    <svg class="h-8 w-8 text-red-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                                    </svg>
                                    <div class="ml-2">
                                        <p class="text-sm font-medium text-gray-900">Q2_Marketing_Report.pdf</p>
                                        <p class="text-xs text-gray-500">2.4 MB</p>
                                    </div>
                                    <button type="button" class="ml-auto p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Message: Other Person -->
                    <div class="flex items-start">
                        <img class="h-10 w-10 rounded-full mr-4" src="https://randomuser.me/api/portraits/men/46.jpg" alt="">
                        <div>
                            <div class="flex items-center">
                                <h3 class="text-sm font-medium text-gray-900">Michael Chen</h3>
                                <span class="ml-2 text-xs text-gray-500">10:40 AM</span>
                            </div>
                            <div class="mt-1 bg-gray-100 rounded-lg p-3 text-sm text-gray-700">
                                <p>Thanks Sarah! Looking forward to reviewing it. Do we need to prepare anything for the meeting with the client tomorrow?</p>
                            </div>
                        </div>
                    </div>

                    <!-- Message: Current User -->
                    <div class="flex items-start justify-end">
                        <div class="max-w-lg">
                            <div class="flex items-center justify-end">
                                <span class="text-xs text-gray-500">10:42 AM</span>
                                <h3 class="ml-2 text-sm font-medium text-gray-900">You</h3>
                            </div>
                            <div class="mt-1 bg-purple-600 rounded-lg p-3 text-sm text-white">
                                <p>I've already prepared the presentation slides. I'll share them in a moment.</p>
                            </div>
                        </div>
                        <img class="h-10 w-10 rounded-full ml-4" src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                    </div>

                    <!-- Message: Current User with Image -->
                    <div class="flex items-start justify-end">
                        <div class="max-w-lg">
                            <div class="flex items-center justify-end">
                                <span class="text-xs text-gray-500">10:45 AM</span>
                                <h3 class="ml-2 text-sm font-medium text-gray-900">You</h3>
                            </div>
                            <div class="mt-1 bg-purple-600 rounded-lg p-3 text-sm text-white">
                                <p>Here's a preview of the main slide:</p>
                                <div class="mt-2 rounded-md overflow-hidden">
                                    <img src="https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80" alt="Presentation slide" class="w-full h-auto">
                                </div>
                            </div>
                        </div>
                        <img class="h-10 w-10 rounded-full ml-4" src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                    </div>

                    <!-- Message: Other Person -->
                    <div class="flex items-start">
                        <img class="h-10 w-10 rounded-full mr-4" src="https://randomuser.me/api/portraits/women/65.jpg" alt="">
                        <div>
                            <div class="flex items-center">
                                <h3 class="text-sm font-medium text-gray-900">Emily Rodriguez</h3>
                                <span class="ml-2 text-xs text-gray-500">10:50 AM</span>
                            </div>
                            <div class="mt-1 bg-gray-100 rounded-lg p-3 text-sm text-gray-700">
                                <p>Looks great! I think we're well prepared for tomorrow. Let's have a quick call at 4 PM to go through everything one more time. Does that work for everyone?</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Message Input -->
            <div class="border-t border-gray-200 p-4 bg-white">
                <form class="flex items-center">
                    <button type="button" class="p-2 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13" />
                        </svg>
                    </button>
                    <input type="text" placeholder="Type your message..." class="flex-1 border-0 focus:ring-0 focus:outline-none px-4 py-2 text-sm text-gray-700">
                    <div class="flex">
                        <button type="button" class="p-2 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </button>
                        <button type="submit" class="ml-2 inline-flex items-center justify-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                            <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>