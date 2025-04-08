package com.hackthon.dao;

import com.hackthon.model.User;
import com.hackthon.util.MongoUtil;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import static com.mongodb.client.model.Filters.eq;

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

    public User getUserByEmail(String email) {
        Document doc = collection.find(eq("email", email)).first();
        if (doc != null) {
            User user = new User();
            user.setUsername(doc.getString("username"));
            user.setPassword(doc.getString("password"));
            user.setName(doc.getString("name"));
            user.setEmail(doc.getString("email"));
            user.setAge(doc.getInteger("age", 0));
            user.setGender(doc.getString("gender"));
            return user;
        }
        return null;
    }
}
