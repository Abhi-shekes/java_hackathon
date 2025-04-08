
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChatWave - Modern Team Communication</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>


<script>
  const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

  if (!SpeechRecognition) {
    alert("Speech Recognition is not supported in this browser.");
  } else {
    const recognition = new SpeechRecognition();
    recognition.continuous = true;
    recognition.lang = "en-US";
    recognition.interimResults = false;

    recognition.onstart = () => {
      console.log("🎙️ Voice recognition activated. Try speaking.");
    };

    recognition.onresult = (event) => {
      const transcript = event.results[event.results.length - 1][0].transcript;
      console.log("🎤 Heard:", transcript);

      // Display in DOM
      const heardEl = document.getElementById("heard");
      if (heardEl) {
        heardEl.textContent = transcript;
      } else {
        console.warn("Element with id='heard' not found. Cannot display transcript.");
      }

      // Normalize transcript
      const normalized = transcript.trim().toLowerCase();
      console.log("📎 Normalized Command:", normalized);

      const triggerPhrases = ["hey", "heyyyy", "heeyyy"];
      const isTriggered = triggerPhrases.some(phrase => normalized.includes(phrase));

      if (!isTriggered) {
        console.log("❌ Ignoring command. Prefix 'hey ' not found.");
        return;
      }

      let actionPart = normalized;
      triggerPhrases.forEach(phrase => {
        if (actionPart.includes(phrase)) {
          actionPart = actionPart.replace(phrase, "").trim();
        }
      });

      if (actionPart === "login page") {
        console.log("🔁 Redirecting to login.jsp");
        window.location.href = "login.jsp";
      } else if (actionPart === "sign up page") {
        console.log("🔁 Redirecting to register.jsp");
        window.location.href = "signup.jsp";
      } else {
        console.log("🤔 Unknown command:", actionPart);
      }
    };

    recognition.onerror = (event) => {
      console.error("🎤 Error:", event.error);
    };

    recognition.onend = () => {
      console.log("🎙️ Voice recognition stopped. Restarting...");
      recognition.start(); // Keep it running continuously
    };

    recognition.start();
  }
</script>


<body class="bg-gray-50 min-h-screen">
    <!-- Header -->
    <header class="bg-white shadow-sm fixed w-full z-10">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <div class="flex-shrink-0 flex items-center">
                        <h1 class="text-2xl font-bold text-purple-600">ChatWave</h1>
                    </div>

                </div>
                <div class="flex items-center">
                    <a href="login.jsp" class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-700 hover:text-gray-900">
                        Log in
                    </a>
                    <a href="signup.jsp" class="ml-4 inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        Sign up
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="pt-24 pb-12 md:pt-32 md:pb-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="lg:grid lg:grid-cols-12 lg:gap-8">
                <div class="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
                    <h1>
                        <span class="block text-sm font-semibold uppercase tracking-wide text-gray-500 sm:text-base lg:text-sm xl:text-base">
                            Introducing
                        </span>
                        <span class="mt-1 block text-4xl tracking-tight font-extrabold sm:text-5xl xl:text-6xl">
                            <span class="block text-gray-900">Team chat for the</span>
                            <span class="block text-purple-600">SPIT workplace</span>
                        </span>
                    </h1>
                    <p class="mt-3 text-base text-gray-500 sm:mt-5 sm:text-xl lg:text-lg xl:text-xl">
                        ChatWave helps your team collaborate seamlessly. Share files, chat in real-time, and keep your projects moving forward with our intuitive platform.
                    </p>
                    <div class="mt-8 sm:max-w-lg sm:mx-auto sm:text-center lg:text-left lg:mx-0">
                        <div class="mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-start">
                            <div class="rounded-md shadow">
                                <a href="signup.jsp" class="w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-purple-600 hover:bg-purple-700 md:py-4 md:text-lg md:px-10">
                                    Get started
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="mt-12 relative sm:max-w-lg sm:mx-auto lg:mt-0 lg:max-w-none lg:mx-0 lg:col-span-6 lg:flex lg:items-center">
                    <div class="relative mx-auto w-full rounded-lg shadow-lg lg:max-w-md">
                        <img class="w-full" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsHiAwPf2vd1wumopOzq3-k4J3IU2sBJhutg&s" alt="ChatWave app screenshot">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-12 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="lg:text-center">
                <h2 class="text-base text-purple-600 font-semibold tracking-wide uppercase">Features</h2>
                <p class="mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                    Everything you need to connect
                </p>
                <p class="mt-4 max-w-2xl text-xl text-gray-500 lg:mx-auto">
                    ChatWave provides all the tools your team needs to communicate effectively.
                </p>
            </div>

            <div class="mt-10">
                <div class="space-y-10 md:space-y-0 md:grid md:grid-cols-2 md:gap-x-8 md:gap-y-10">
                    <div class="relative">
                        <div class="absolute flex items-center justify-center h-12 w-12 rounded-md bg-purple-500 text-white">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                            </svg>
                        </div>
                        <div class="ml-16">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Real-time messaging</h3>
                            <p class="mt-2 text-base text-gray-500">
                                Communicate with your team in real-time with instant messaging that keeps everyone in sync.
                            </p>
                        </div>
                    </div>

                    <div class="relative">
                        <div class="absolute flex items-center justify-center h-12 w-12 rounded-md bg-purple-500 text-white">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                            </svg>
                        </div>
                        <div class="ml-16">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">File sharing</h3>
                            <p class="mt-2 text-base text-gray-500">
                                Share files, documents, and images with your team members instantly.
                            </p>
                        </div>
                    </div>

                    <div class="relative">
                        <div class="absolute flex items-center justify-center h-12 w-12 rounded-md bg-purple-500 text-white">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                        </div>
                        <div class="ml-16">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Team channels</h3>
                            <p class="mt-2 text-base text-gray-500">
                                Organize conversations by project, team, or topic with dedicated channels.
                            </p>
                        </div>
                    </div>

                    <div class="relative">
                        <div class="absolute flex items-center justify-center h-12 w-12 rounded-md bg-purple-500 text-white">
                            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                            </svg>
                        </div>
                        <div class="ml-16">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Secure communications</h3>
                            <p class="mt-2 text-base text-gray-500">
                                End-to-end encryption ensures your team's conversations remain private and secure.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- CTA Section -->
    <section class="py-12 bg-purple-600">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center">
                <h2 class="text-3xl font-extrabold text-white sm:text-4xl">
                    <span class="block">Ready to get started?</span>
                    <span class="block">Sign up for ChatWave today.</span>
                </h2>
                <p class="mt-4 text-lg leading-6 text-purple-200">
                    Join thousands of teams that use ChatWave to collaborate more effectively.
                </p>
                <div class="mt-8 flex justify-center">
                    <div class="inline-flex rounded-md shadow">
                        <a href="signup.jsp" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-purple-600 bg-white hover:bg-purple-50">
                            Sign up for free
                        </a>
                    </div>
                    <div class="ml-3 inline-flex">
                        <a href="#features" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-purple-700 hover:bg-purple-800">
                            Learn more
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>


</body>
</html>