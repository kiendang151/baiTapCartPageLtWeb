<%@page import="cart.Cart"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cart cart = (Cart) session.getAttribute("cart");

    List<Product> items = null;

    if (cart != null) {
        items = cart.getItems();
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Your Cart</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="container">

    <h2>Your cart</h2>

    <table>

        <!-- HEADER -->
        <tr>

            <th class="quantity">
                Quantity
            </th>

            <th class="description">
                Description
            </th>

            <th class="price">
                Price
            </th>

            <th class="amount">
                Amount
            </th>

            <th class="action">
            </th>

        </tr>


        <%
            if (items != null && !items.isEmpty()) {

                for (Product product : items) {
        %>

        <!-- PRODUCT -->
        <tr>

            <!-- QUANTITY + UPDATE -->
            <td class="quantity-area">

                <form action="cart" method="post">

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="productCode"
                           value="<%= product.getCode() %>">

                    <!-- Ô NHẬP SỐ LƯỢNG -->
                    <input type="number"
                           name="quantity"
                           value="<%= product.getQuantity() %>"
                           min="1"
                           class="quantity-box">

                    <input type="submit"
                           value="Update"
                           class="button">

                </form>

            </td>


            <!-- DESCRIPTION -->
            <td class="description">

                <%= product.getDescription() %>

            </td>


            <!-- PRICE -->
            <td class="price">

                $<%= String.format("%.2f",
                        product.getPrice()) %>

            </td>


            <!-- AMOUNT -->
            <td class="amount">

                $<%= String.format("%.2f",
                        product.getAmount()) %>

            </td>


            <!-- REMOVE -->
            <td class="remove">

                <form action="cart" method="post">

                    <input type="hidden"
                           name="action"
                           value="remove">

                    <input type="hidden"
                           name="productCode"
                           value="<%= product.getCode() %>">

                    <input type="submit"
                           value="Remove Item"
                           class="button">

                </form>

            </td>

        </tr>


        <%
                }

            } else {
        %>

        <!-- EMPTY CART -->
        <tr>

            <td colspan="5"
                class="empty">

                Your cart is empty.

            </td>

        </tr>

        <%
            }
        %>

    </table>


    <!-- NOTE -->
    <div class="note">

        <strong>
            To change the quantity, enter the new quantity and click on the Update button.
        </strong>

    </div>


    <!-- BUTTONS -->
    <div class="bottom-buttons">

        <!-- CONTINUE SHOPPING -->
        <form action="index.jsp" method="get">

            <input type="submit"
                   value="Continue Shopping"
                   class="button">

        </form>


        <!-- CHECKOUT -->
        <form action="checkout.jsp" method="get">

            <input type="submit"
                   value="Checkout"
                   class="button">

        </form>

    </div>

</div>

</body>

</html>