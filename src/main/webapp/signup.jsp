
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ChatWave</title>
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

      const heardEl = document.getElementById("heard");
      if (heardEl) {
        heardEl.textContent = transcript;
      } else {
        console.warn("Element with id='heard' not found. Cannot display transcript.");
      }

      const normalized = transcript.trim().toLowerCase();
      console.log("📎 Normalized Command:", normalized);

      // Fuzzy matching for common voice recognition errors
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
      } else if (actionPart === "signup page") {
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


<body class="bg-gray-50 min-h-screen flex flex-col">
    <!-- Header -->
    <header class="bg-white shadow-sm">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <div class="flex-shrink-0 flex items-center">
                        <a href="index.html" class="text-2xl font-bold text-purple-600">ChatWave</a>
                    </div>
                </div>
                <div class="flex items-center">
                    <a href="signup.jsp" class="ml-4 inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                        Sign up
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Login Form -->
    <div class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8">
            <div>
                <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                   Create a new account
                </h2>
                <p class="mt-2 text-center text-sm text-gray-600">
                    Or
                    <a href="login.jsp" class="font-medium text-purple-600 hover:text-purple-500">
                       Login Now
                    </a>
                </p>
            </div>
            <form class="mt-8 space-y-6" action="/hackathon/register" method="POST">
                <input type="hidden" name="remember" value="true">


                <input type="hidden" name="remember" value="true">
                    <div class="rounded-md shadow-sm -space-y-px flex flex-col gap-5">
                        <div>
                            <label for="name" class="sr-only">Full Name</label>
                            <input id="name" name="name" type="text" required placeholder="Full Name" class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                        </div>

                        <div>
                            <label for="username" class="sr-only">Username</label>
                            <input id="username" name="username" type="text" required placeholder="Username" class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                        </div>

                        <div>
                            <label for="email" class="sr-only">Email address</label>
                            <input id="email" name="email" type="email" autocomplete="email" required placeholder="Email address" class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                        </div>

                        <div>
                            <label for="password" class="sr-only">Password</label>
                            <input id="password" name="password" type="password" autocomplete="current-password" required placeholder="Password" class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                        </div>

                        <div>
                            <label for="age" class="sr-only">Age</label>
                            <input id="age" name="age" type="number" required placeholder="Age" class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                        </div>

                        <div>
                            <label for="gender" class="sr-only">Gender</label>
                            <select id="gender" name="gender" required class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 bg-white text-gray-500 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                                <option value="" disabled selected>Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                                <option value="prefer-not-to-say">Prefer not to say</option>
                            </select>
                        </div>

                <div class="flex items-center justify-between">


                    <div class="text-sm">
                        <a href="#" class="font-medium text-purple-600 hover:text-purple-500">
                            Forgot your password?
                        </a>
                    </div>
                </div>

                <div>
                    <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">

                        Sign in
                    </button>
                </div>
            </form>


        </div>
    </div>


</body>
</html>