package com.hackthon.model;

public class User {
    private String username;
    private String password;
    private String name;
    private String email;
    private int age;
    private String gender;

    public User(String username, String password, String name, String email, int age, String gender) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.age = age;
        this.gender = gender;
    }

    // Getters
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    // Setters (optional, for completeness)
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
