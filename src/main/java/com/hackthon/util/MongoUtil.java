package com.hackthon.util;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoUtil {
    private static MongoClient mongoClient;

    public static MongoDatabase getDatabase() {
        if (mongoClient == null) {
            mongoClient = MongoClients.create("mongodb+srv://2003deepak:Deepak%407449%2A@atlascluster.yeqsq.mongodb.net/DevDuo?retryWrites=true&w=majority&appName=AtlasCluster");
        }
        return mongoClient.getDatabase("hackathon_db");
    }
}
