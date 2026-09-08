package servlet;

import cart.Cart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy action từ form
        String action = request.getParameter("action");

        // Lấy mã sản phẩm
        String productCode =
                request.getParameter("productCode");

        // Lấy Session
        HttpSession session =
                request.getSession();

        // Lấy Cart từ Session
        Cart cart =
                (Cart) session.getAttribute("cart");

        // Nếu chưa có Cart thì tạo mới
        if (cart == null) {
            cart = new Cart();
        }

        // =========================================
        // ADD TO CART
        // =========================================

        if ("add".equals(action)) {

            Product product =
                    getProduct(productCode);

            if (product != null) {
                cart.addProduct(product);
            }
        }

        // =========================================
        // UPDATE QUANTITY
        // =========================================

        else if ("update".equals(action)) {
            String quantityText = request.getParameter("quantity");

            if (quantityText != null && !quantityText.isEmpty()) {
                int quantity = Integer.parseInt(quantityText);

                if (quantity > 0) {
                    cart.updateQuantity(productCode, quantity);
                }
            }
        }

        // =========================================
        // REMOVE ITEM
        // =========================================

        else if ("remove".equals(action)) {

            cart.removeProduct(productCode);
        }

        // Lưu Cart vào Session
        session.setAttribute("cart", cart);

        // Chuyển sang Cart Page
        response.sendRedirect("cart.jsp");
    }


    // =============================================
    // Lấy thông tin sản phẩm
    // =============================================

    private Product getProduct(String productCode) {

        if ("CD001".equals(productCode)) {

            return new Product(
                    "CD001",
                    "86 (the band) - True Life Songs and Pictures",
                    14.95
            );
        }

        if ("CD002".equals(productCode)) {

            return new Product(
                    "CD002",
                    "Paddlefoot - The first CD",
                    12.95
            );
        }

        if ("CD003".equals(productCode)) {

            return new Product(
                    "CD003",
                    "Paddlefoot - The second CD",
                    14.95
            );
        }

        if ("CD004".equals(productCode)) {

            return new Product(
                    "CD004",
                    "Joe Rut - Genuine Wood Grained Finish",
                    14.95
            );
        }

        return null;
    }
}