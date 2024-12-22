<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stylish Appointment Form</title>
    <style>
       
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            
            min-height: 100vh;
            background-image:url('https://img.freepik.com/premium-photo/generative-ai-cat-paws-stethoscope-isolated-blue-background-banner-with-copy-space_93150-35877.jpg?semt=ais_hybrid');
            background-position:fixed;
            background-repeat:no-repeat;
            background-size:1500px;
        }

        
        .form-container {
            width: 100%;
            max-width: 500px;
            background: #fff;
            padding: 40px;
            margin-left:750px;
            margin-bottom:30px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            animation: slide-in 0.6s ease-out;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        
        @keyframes slide-in {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #333;
            position: relative;
        }

        
        .form-container h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(135deg, #fbc531, #f7e441);
            border-radius: 5px;
        }

        
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
            display: inline-block;
        }

        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease;
            font-size: 16px;
        }

      
        .form-group input:focus,
        .form-group select:focus {
            border-color: #fbc531;
            box-shadow: 0 0 8px rgba(251, 197, 49, 0.3);
        }

        
        .form-group select {
            appearance: none;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"%3E%3Cpath d="M7 10l5 5 5-5z"%3E%3C/path%3E%3C/svg%3E') no-repeat right 15px center;
            background-size: 14px;
            padding-right: 40px;
        }

        
        .submit-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #fbc531, #f7e441);
            color: #333;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(251, 197, 49, 0.3);
        }

        .submit-btn:hover {
            transform: scale(1.05);
        }

       
        .response {
            margin-top: 20px;
            padding: 20px;
            border-radius: 8px;
            background: #fff8e7;
            color: #333;
            border: 1px solid #f7e441;
        }

        .response h3 {
            margin-bottom: 10px;
            font-size: 22px;
            color: #fbc531;
        }
      #msg {
    padding: 12px 20px;
    background-color: #d1ffd1;
    color: #1a7e1a;
    border: 1px solid #00a300;
    border-radius: 10px;
    text-align: center;
    margin: 20px auto;
    font-size: 18px;
    font-style: italic;
    width: 80%;
    box-shadow: 0px 5px 10px rgba(0, 163, 0, 0.2);
    letter-spacing: 1px;
}


        
    </style>
</head>
<body>

<%@include file="Header1.jsp" %>

    <div class="form-container">
    <% if (request.getAttribute("status") != null) { %>
    <script>
        alert("<%= request.getAttribute("status") %>");
    </script>
<% } %>

        <h2>Book an Appointment</h2>

         
        <form action="Schedule" method="post">
       
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="p_name" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="appointmentDate">Appointment Date:</label>
                <input type="date" id="appointmentDate" name="appointmentDate"  min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
            </div>

            
            <div class="form-group">
                <label for="disease">Select Disease:</label>
                <select id="disease" name="disease" required>
                    <option value="" disabled selected>Select disease</option>

                    
                    <optgroup label="Dog Diseases">
                        <option value="Ringworm">Ringworm</option>
                        <option value="Parvovirus">Parvovirus</option>
                        <option value="Kennel Cough">Kennel Cough</option>
                        <option value="Heartworm">Heartworm</option>
                    </optgroup>

                   
                    <optgroup label="Cat Diseases">
                       
                        <option value="Cat flu">Cat Flu</option>
                        <option value="Rabies">Rabies</option>
                        <option value="Dental issue">Dental issue</option>
                        <option value="Kidney Disease">Kidney Disease</option>
                    </optgroup>

                    
                    <optgroup label="Bird Diseases">
                        <option value="Parrot fever">Parrot fever</option>
                        <option value="Avian Influenza">Avian Influenza</option>
                        <option value="Fungal infection">Fungal infection</option>
                        
                        <option value="Polyoma virus">Polyoma virus Disease</option>
                    </optgroup>
                </select>
            </div>

            <button type="submit" class="submit-btn">Submit</button>
        </form>

        <!-- Processing Submitted Data -->
        <%
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String appointmentDate = request.getParameter("appointmentDate");
            String disease = request.getParameter("disease");

            if (name != null && phone != null && appointmentDate != null && disease != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                Date date = dateFormat.parse(appointmentDate);
        %>
                <div class="response">
                    <h3>Appointment Details:</h3>
                    <p><strong>Name:</strong> <%= name %></p>
                    <p><strong>Phone:</strong> <%= phone %></p>
                    <p><strong>Appointment Date:</strong> <%= dateFormat.format(date) %></p>
                    <p><strong>Disease:</strong> <%= disease %></p>
                </div>
        <%
            }
        %>
    </div>
    <%@include file="Footer.jsp" %>
</body>
</html>