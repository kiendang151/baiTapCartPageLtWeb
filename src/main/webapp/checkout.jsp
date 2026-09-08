<%@page import="cart.Cart"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Lấy Cart từ Session
    Cart cart = (Cart) session.getAttribute("cart");

    List<Product> items = null;

    double total = 0;

    if (cart != null) {

        items = cart.getItems();

        total = cart.getTotal();
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout</title>

    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: white;
        }

        .container {
            width: 760px;
            margin: 35px auto;
        }

        h2 {
            color: #008c95;
            font-size: 22px;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        th {
            border: 1px solid #333;
            padding: 7px;
            text-align: left;
        }

        td {
            border: 1px solid #333;
            padding: 7px;
        }

        .description {
            width: 55%;
        }

        .quantity {
            width: 15%;
            text-align: center;
        }

        .amount {
            width: 30%;
            text-align: right;
        }

        .total {
            margin-top: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .button {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            padding: 4px 10px;
            cursor: pointer;
            border: 1px solid #999;
            background: linear-gradient(#ffffff, #dddddd);
        }

        .button:hover {
            background: linear-gradient(#eeeeee, #cccccc);
        }

        .bottom {
            margin-top: 15px;
        }

    </style>

</head>


<body>

<div class="container">

    <h2>Checkout</h2>


    <%
        if (items != null && !items.isEmpty()) {
    %>


    <table>

        <tr>

            <th class="description">
                Description
            </th>

            <th class="quantity">
                Quantity
            </th>

            <th class="amount">
                Amount
            </th>

        </tr>


        <%
            for (Product product : items) {
        %>


        <tr>

            <td>
                <%= product.getDescription() %>
            </td>

            <td class="quantity">
                <%= product.getQuantity() %>
            </td>

            <td class="amount">

                $<%= String.format("%.2f",
                        product.getAmount()) %>

            </td>

        </tr>


        <%
            }
        %>


    </table>


    <div class="total">

        Total:
        $<%= String.format("%.2f", total) %>

    </div>


    <%
        } else {
    %>


    <p>
        Your cart is empty.
    </p>


    <%
        }
    %>


    <div class="bottom">

        <form action="index.html" method="get">

            <input type="submit"
                   value="Continue Shopping"
                   class="button">

        </form>

    </div>

</div>

</body>

</html>