package com.hackthon.dao;

import com.hackthon.model.User;
import com.hackthon.util.MongoUtil;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class UserDAO {
    private final MongoCollection<Document> collection;

    public UserDAO() {
        MongoDatabase db = MongoUtil.getDatabase();
        collection = db.getCollection("users");
    }

    public void insertUser(User user) {
        Document doc = new Document("username", user.getUsername())
                .append("password", user.getPassword())
                .append("name", user.getName())
                .append("email", user.getEmail())
                .append("age", user.getAge())
                .append("gender", user.getGender());
        collection.insertOne(doc);
    }

    // Add validation or login check later
}
