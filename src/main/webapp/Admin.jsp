<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Registration"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff8e1; 
            margin: 0;
            padding: 0;
            color: #333;
        }

        .header {
            background-color: #ffeb3b; 
            color: #fff;
            padding: 30px;
            text-align: center;
            border-bottom: 4px solid #fbc02d; 
        }

        .header h1 {
            font-size: 3rem;
            font-weight: bold;
            margin: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            margin-bottom: 40px;
            padding: 30px;
            background-color: #fff8e1; 
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            font-size: 1.8rem;
            color: #fbc02d; 
            margin-bottom: 20px;
        }

        input[type="text"], input[type="number"] {
            padding: 15px;
            margin: 10px 0;
            width: 90%;
            border: 2px solid #ffeb3b; 
            border-radius: 5px;
            font-size: 1rem;
            background-color: #fff8e1; 
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #fbc02d; 
            outline: none;
        }

        button[type="submit"] {
            background-color: #ffeb3b; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 18px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            background-color: #fbc02d; 
            transform: scale(1.05);
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
            margin-top: 40px;
        }
.product-card {
    background-color: #fff;
    border: 2px solid #ffeb3b;
    border-radius: 10px;
    padding: 20px;
    width: calc(33% - 20px); 
    box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    height: auto;
}

.product-card img {
    width: 100%;
    height: auto;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 15px;
}

.product-card h3 {
    font-size: 1.5rem;
    color: #fbc02d;
    margin-bottom: 10px;
    margin-top: 0;
}

.product-card p {
    font-size: 1.2rem;
    color: #444;
    margin-bottom: 20px;
}

.product-card .button-container {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
}

.product-card form button {
    background-color: #fbc02d; 
    color: white;
    padding: 10px 15px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 100%;
}

.product-card form button:hover {
    background-color: #ff9800; 
}


        .no-products {
            font-size: 1.3rem;
            color: #777;
            font-weight: bold;
            text-align: center;
        }

       
        @media screen and (max-width: 1024px) {
            .product-card {
                width: calc(50% - 20px); 
            }
        }

        @media screen and (max-width: 768px) {
            .product-container {
                flex-direction: column;
                align-items: center;
            }

            .product-card {
                width: 100%;
                margin-bottom: 20px;
            }

            .container {
                width: 90%;
                padding: 20px;
            }
        }
       .add-products-button {
        background-color: #ffc107; 
        color: white;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 5px;
        margin-left:1000px;
        margin-top:-50px;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

    .add-products-button:hover {
        background-color: #218838;
        transform: translateY(-2px);
    }

    .add-products-button:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(40, 167, 69, 0.7);
    }

    a {
        text-decoration: none;
    }
    </style>
</head>
<body>
<%@include file="Header1.jsp"%>
<div class="header">
    <h1>Admin Dashboard</h1>
</div>

<div class="container">
    <h2>Current Products</h2>
   <a href="Addproducts.jsp">
    <button class="add-products-button">Add Products</button>
</a>
    <div class="product-container">
        <%
            Registration r = new Registration(session);
            ArrayList<Dproduct> al = r.get_all_productinfo();
            if (al != null && !al.isEmpty()) {
                for (Dproduct s : al) {
        %>
                <div class="product-card">
                    <h3><%= s.getp_name() %></h3>
                    <img src="Images/<%= s.getp_image() %>" alt="<%= s.getp_name() %>" />
                    <p>Price: &#8377; <%= s.getP_cost() %></p>
                    <div class="button-container">
                        
                        <form action="updateProduct" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%= s.getp_id() %>" />
                            <input type="number" name="p_cost" value="<%= s.getP_cost() %>" required />
                            <button type="submit" class="btn">Update</button>
                        </form>
                        
                        <form action="deleteProduct" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%= s.getp_id() %>" />
                            <button type="submit" class="btn">Delete</button>
                        </form> 
                        
                        
                        <form action="SaveProductDetails" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%= s.getp_id() %>" />
                            <button type="submit" class="btn">Add Details</button>
                        </form>
                       
                    </div>
                   
                </div>
        <%
                }
            } else {
        %>
                <p class="no-products">No products found.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
