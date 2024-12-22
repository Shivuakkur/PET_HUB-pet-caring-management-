<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
   
}

a {
    text-decoration: none;
    color: inherit;
}

header {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    
   
}

header .logo img {
    height: 100px;
    width: auto;
    margin-left:30px;
}

header .menu {
    display: flex;
    align-items: center;
}

header .menu ul {
    display: flex;
    list-style-type: none;
   
}

header .menu ul li a {
    padding: 10px 15px;
    font-size:16px;
    font-weight: 600;
    
    color: #333;
    border-bottom: 2px solid transparent;
    transition: color 0.3s, border-color 0.3s, transform 0.3s;
}

header .menu ul li a:hover {
    color: #007bff;
    border-color: #007bff;
    transform: translateY(-2px);
}

header .header_right {
    display: flex;
    align-items: center;
    gap: 20px;
}

header .header_right i {
    font-size: 26px;
    color: #333;
}

header .header_right .rel {
    position: relative;
}

header .header_right .rel .num {
    position: absolute;
    top: 0;
    right: -10px;
    background-color: red;
    color: white;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
}

.uname {
    display: flex;
    align-items: center;
    font-size: 16px;
    color: #333;
    padding: 10px;
   
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}



button.btn {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

button.btn:hover {
    background-color: #0056b3;
}

@media (max-width: 768px) {
    header {
        flex-direction: column;
        padding: 20px;
    }

    .menu ul {
        flex-direction: column;
        gap: 15px;
    }

    .header_right {
        margin-top: 20px;
        justify-content: center;
    }

    .menu ul li a {
        padding: 12px 20px;
    }
}
</style>
</head>
<body>

<header>
    <div class="logo">
        <a href="Home1.jsp">
            <img src="Images/Logo.png" alt="Logo">
        </a>
    </div>
    
    <div class="menu">
        <ul>
            <% if (session.getAttribute("uname") != null) { %>
                
                <li><a href="Home1.jsp">Home</a></li>
                
                <li><a href="Contact.jsp">Contact</a></li>

                <!-- Admin-specific Menu Items (id = 1) -->
                <% if ("1".equals(session.getAttribute("id"))) { %>
                    <li><a href="myorder.jsp">My Orders</a></li>
                    <li><a href="Admin.jsp">Dashboard</a></li>
                    <li><a href="BookedProducts.jsp">Booked Products</a></li>
                    <li><a href="UserReviews.jsp">User Reviews</a></li>
                    <li><a href="AppList.jsp">Appointment List</a></li>
                <% } else { %>
                 
                    <li><a href="HealthAssist.jsp">Health Assistance</a></li>
                <% } %>

                <li><a href="register?logout=yes">Logout</a></li>
            <% } else { %>
                
                <li><a href="Home1.jsp">Home</a></li>
                
                <li><a href="Login.jsp">Login</a></li>
                <li><a href="Registration.jsp">Register</a></li>
            <% } %>
        </ul>
    </div>
       <% if (session.getAttribute("uname") != null) { %>
    <div class="header_right">
        <a href="Wishlist.jsp"><i class="fa fa-heart"></i></a>
        <a href="Search.jsp"><i class="fa-solid fa-magnifying-glass"></i></a>
        <div class="rel">
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>

     
            <div class="uname">
                <i class="fa fa-user-circle" style="margin-right: 5px;"></i>
                <%= session.getAttribute("uname") %>
            </div>
        <% } %>
    </div>
</header>

</body>
</html>
