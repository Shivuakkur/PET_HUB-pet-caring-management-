<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.AppointmentPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: #4CAF50;
        margin-top: 10px;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    .button-container {
        text-align: center;
        margin-top: 20px;
    }

    .button-container a {
        text-decoration: none;
    }

    .button-container button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .button-container button:hover {
        background-color: #45a049;
    }

</style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <h1>Appointment List</h1>
    <table>
        <tr>
            <th> Name</th>
            <th>Phone Number</th>
            <th>Date</th>
            <th>Disease</th>
        </tr>
        <% Appointment app1 = new Appointment(session);
        ArrayList<AppointmentPojo> al1 = app1.getAppinfo();
        Iterator<AppointmentPojo> itr2 = al1.iterator();
        while (itr2.hasNext()) {
            AppointmentPojo app = itr2.next();
        %>
        <tr>
            <td><%= app.getP_name() %></td>
            <td><%= app.getPhone() %></td>
            <td><%= app.getDate() %></td>
            <td><%= app.getDisease() %></td>
        </tr>
        <% } %>
    </table>
    <div class="button-container">
        <a href="Admin.jsp"><button type="button">Back to Main Page</button></a>
    </div>
    
</body>
</html>
