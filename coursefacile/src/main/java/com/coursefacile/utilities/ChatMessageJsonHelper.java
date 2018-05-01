package com.coursefacile.utilities;


import org.json.JSONObject;

import java.util.HashMap;

public class ChatMessageJsonHelper {

    public HashMap<String, String> decodeMessage(String textMessage) {
        HashMap<String, String> chatMessage = new HashMap<String, String>();
        JSONObject jsonObject = new JSONObject(textMessage);
        chatMessage.put("message", jsonObject.getString("message").trim().replace("\n", "<br>"));
        chatMessage.put("sender", jsonObject.getString("sender"));
        chatMessage.put("receiver", jsonObject.getString("receiver"));
        chatMessage.put("sentDate", jsonObject.getString("sentDate"));
        return chatMessage;
    }

    public String encodeMessage(final HashMap<String, String> chatMessage) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", chatMessage.get("message"));
        jsonObject.put("sender", chatMessage.get("sender"));
        jsonObject.put("receiver", chatMessage.get("receiver"));
        jsonObject.put("sentDate", chatMessage.get("sentDate"));
        return jsonObject.toString();
    }

}