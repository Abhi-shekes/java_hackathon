/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.99
 * Generated at: 2025-04-08 11:23:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Login - ChatWave</title>\n");
      out.write("    <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <script src=\"https://unpkg.com/lucide@latest/dist/umd/lucide.js\"></script>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: 'Inter', sans-serif;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("  const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;\n");
      out.write("\n");
      out.write("  if (!SpeechRecognition) {\n");
      out.write("    alert(\"Speech Recognition is not supported in this browser.\");\n");
      out.write("  } else {\n");
      out.write("    const recognition = new SpeechRecognition();\n");
      out.write("    recognition.continuous = true;\n");
      out.write("    recognition.lang = \"en-US\";\n");
      out.write("    recognition.interimResults = false;\n");
      out.write("\n");
      out.write("    recognition.onstart = () => {\n");
      out.write("      console.log(\"ðï¸ Voice recognition activated. Try speaking.\");\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    recognition.onresult = (event) => {\n");
      out.write("      const transcript = event.results[event.results.length - 1][0].transcript;\n");
      out.write("      console.log(\"ð¤ Heard:\", transcript);\n");
      out.write("\n");
      out.write("      const heardEl = document.getElementById(\"heard\");\n");
      out.write("      if (heardEl) {\n");
      out.write("        heardEl.textContent = transcript;\n");
      out.write("      } else {\n");
      out.write("        console.warn(\"Element with id='heard' not found. Cannot display transcript.\");\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      const normalized = transcript.trim().toLowerCase();\n");
      out.write("      console.log(\"ð Normalized Command:\", normalized);\n");
      out.write("\n");
      out.write("      // Fuzzy matching for common voice recognition errors\n");
      out.write("      const triggerPhrases = [\"hey\", \"heyyyy\", \"heeyyy\"];\n");
      out.write("      const isTriggered = triggerPhrases.some(phrase => normalized.includes(phrase));\n");
      out.write("\n");
      out.write("      if (!isTriggered) {\n");
      out.write("        console.log(\"â Ignoring command. Prefix 'hey ' not found.\");\n");
      out.write("        return;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      let actionPart = normalized;\n");
      out.write("      triggerPhrases.forEach(phrase => {\n");
      out.write("        if (actionPart.includes(phrase)) {\n");
      out.write("          actionPart = actionPart.replace(phrase, \"\").trim();\n");
      out.write("        }\n");
      out.write("      });\n");
      out.write("\n");
      out.write("      if (actionPart === \"login page\") {\n");
      out.write("        console.log(\"ð Redirecting to login.jsp\");\n");
      out.write("        window.location.href = \"login.jsp\";\n");
      out.write("      } else if (actionPart === \"signup page\") {\n");
      out.write("        console.log(\"ð Redirecting to register.jsp\");\n");
      out.write("        window.location.href = \"signup.jsp\";\n");
      out.write("      } else {\n");
      out.write("        console.log(\"ð¤ Unknown command:\", actionPart);\n");
      out.write("      }\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    recognition.onerror = (event) => {\n");
      out.write("      console.error(\"ð¤ Error:\", event.error);\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    recognition.onend = () => {\n");
      out.write("      console.log(\"ðï¸ Voice recognition stopped. Restarting...\");\n");
      out.write("      recognition.start(); // Keep it running continuously\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    recognition.start();\n");
      out.write("  }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<body class=\"bg-gray-50 min-h-screen flex flex-col\">\n");
      out.write("    <!-- Header -->\n");
      out.write("    <header class=\"bg-white shadow-sm\">\n");
      out.write("        <div class=\"max-w-7xl mx-auto px-4 sm:px-6 lg:px-8\">\n");
      out.write("            <div class=\"flex justify-between h-16\">\n");
      out.write("                <div class=\"flex\">\n");
      out.write("                    <div class=\"flex-shrink-0 flex items-center\">\n");
      out.write("                        <a href=\"index.html\" class=\"text-2xl font-bold text-purple-600\">ChatWave</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"flex items-center\">\n");
      out.write("                    <a href=\"signup.jsp\" class=\"ml-4 inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500\">\n");
      out.write("                        Sign up\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <!-- Login Form -->\n");
      out.write("    <div class=\"flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8\">\n");
      out.write("        <div class=\"max-w-md w-full space-y-8\">\n");
      out.write("            <div>\n");
      out.write("                <h2 class=\"mt-6 text-center text-3xl font-extrabold text-gray-900\">\n");
      out.write("                   Create a new account\n");
      out.write("                </h2>\n");
      out.write("                <p class=\"mt-2 text-center text-sm text-gray-600\">\n");
      out.write("                    Or\n");
      out.write("                    <a href=\"login.jsp\" class=\"font-medium text-purple-600 hover:text-purple-500\">\n");
      out.write("                       Login Now\n");
      out.write("                    </a>\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <form class=\"mt-8 space-y-6\" action=\"/hackathon/register\" method=\"POST\">\n");
      out.write("                <input type=\"hidden\" name=\"remember\" value=\"true\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                <input type=\"hidden\" name=\"remember\" value=\"true\">\n");
      out.write("                    <div class=\"rounded-md shadow-sm -space-y-px flex flex-col gap-5\">\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"name\" class=\"sr-only\">Full Name</label>\n");
      out.write("                            <input id=\"name\" name=\"name\" type=\"text\" required placeholder=\"Full Name\" class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"username\" class=\"sr-only\">Username</label>\n");
      out.write("                            <input id=\"username\" name=\"username\" type=\"text\" required placeholder=\"Username\" class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"email\" class=\"sr-only\">Email address</label>\n");
      out.write("                            <input id=\"email\" name=\"email\" type=\"email\" autocomplete=\"email\" required placeholder=\"Email address\" class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"password\" class=\"sr-only\">Password</label>\n");
      out.write("                            <input id=\"password\" name=\"password\" type=\"password\" autocomplete=\"current-password\" required placeholder=\"Password\" class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"age\" class=\"sr-only\">Age</label>\n");
      out.write("                            <input id=\"age\" name=\"age\" type=\"number\" required placeholder=\"Age\" class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div>\n");
      out.write("                            <label for=\"gender\" class=\"sr-only\">Gender</label>\n");
      out.write("                            <select id=\"gender\" name=\"gender\" required class=\"appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 bg-white text-gray-500 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm\">\n");
      out.write("                                <option value=\"\" disabled selected>Select Gender</option>\n");
      out.write("                                <option value=\"male\">Male</option>\n");
      out.write("                                <option value=\"female\">Female</option>\n");
      out.write("                                <option value=\"other\">Other</option>\n");
      out.write("                                <option value=\"prefer-not-to-say\">Prefer not to say</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                <div class=\"flex items-center justify-between\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"text-sm\">\n");
      out.write("                        <a href=\"#\" class=\"font-medium text-purple-600 hover:text-purple-500\">\n");
      out.write("                            Forgot your password?\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <button type=\"submit\" class=\"group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500\">\n");
      out.write("\n");
      out.write("                        Sign in\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
