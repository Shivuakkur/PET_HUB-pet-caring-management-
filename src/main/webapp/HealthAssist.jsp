<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Packages</title>
<style>
    body {
        font-family: Arial, sans-serif;
        
        margin: 0;
        padding: 0;
        height: 100vh;
    }

    .parent {
        text-align: center;
        padding: 20px;
    }

    .parent h1 {
        font-size: 36px;
        color: #333;
        margin-bottom: 30px;
    }

    .child {
        display: inline-block;
        width: 270px;
        height: 300px;
        padding: 20px;
        margin: 15px;
        border-radius: 15px;
        background: linear-gradient(135deg, #ffd54f, #fff176);
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        color: #333;
        vertical-align: top;
    }

    .child:hover {
        transform: translateY(-10px);
        box-shadow: 0px 12px 25px rgba(0, 0, 0, 0.3);
    }

    .child img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        margin-bottom: 15px;
        border-radius: 50%;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .child p {
        font-size: 18px;
        color: #555;
        margin: 12px 0;
        line-height: 1.6;
    }

    .child button {
        background-color: #fbc02d;
        color: #333;
        border: none;
        border-radius: 25px;
        padding: 12px 28px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .child button:hover {
        background-color: #f9a825;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <div class="parent">
       

        <div class="child">
            <img src="Health/videoconsultancy.jpg" alt="Video Consultation">
            <p>Get a video consultation for your pets</p>
            <a href="HealthCarevideos.jsp"><button>View Videos</button></a>
        </div>

        <div class="child">
            <img src="Health/dogvet.jpg" alt="Vet At Home">
            <p>Cure the health and disease of your pet...</p>
           <a href="BookAppointment.jsp"><button>Book Appointment</button></a>
        </div>

        <div class="child">
            <img src="Health/catvet.avif" alt="Travel Certificate">
            <p>Cure the health and disease of your pet...</p>
            <a href="BookAppointment.jsp"><button>Book Appointment</button></a>
        </div>

        <div class="child">
            <img src="Health/birdvet.jpg" alt="General Checkup">
            <p>Cure the health and disease of your pet...</p>
            <a href="BookAppointment.jsp"><button>Book Appointment</button></a>
        </div>
    </div>
    <%@include file="Footer.jsp" %>
</body>
</html>
