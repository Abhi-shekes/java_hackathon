package com.hackthon.controller;

import com.hackthon.dao.UserDAO;
import com.hackthon.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name     = request.getParameter("name");
        String email    = request.getParameter("email");
        int age         = Integer.parseInt(request.getParameter("age"));
        String gender   = request.getParameter("gender");

        // Create user object
        User user = new User(username, password, name, email, age, gender);

        // Store in DB
        userDAO.insertUser(user);

        // Redirect to login or success page
        response.sendRedirect("login.jsp");
    }
}
