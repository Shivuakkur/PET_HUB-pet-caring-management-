package com.MVC.Controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {
    private static final String API_KEY = "YOUR_OPENAI_API_KEY"; // Replace with your OpenAI API key

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userMessage = request.getParameter("message");
        String botResponse = getAIResponse(userMessage);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write("{\"response\": \"" + botResponse + "\"}");
        out.close();
    }

    private String getAIResponse(String message) throws IOException {
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String inputJson = "{\"model\": \"gpt-3.5-turbo\", \"messages\":[{\"role\": \"user\", \"content\": \"" + message + "\"}]}";

        conn.getOutputStream().write(inputJson.getBytes());

        Scanner scanner = new Scanner(conn.getInputStream());
        StringBuilder response = new StringBuilder();
        while (scanner.hasNext()) {
            response.append(scanner.nextLine());
        }
        scanner.close();

        // Parse the response to extract the message
        String responseBody = response.toString();
        return responseBody.replaceAll(".*\"content\":\"([^\"]+)\".*", "$1");
    }
}

