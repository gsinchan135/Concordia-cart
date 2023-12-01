RestockProductSrv:

package com.shashi.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shashi.service.impl.ProductServiceImpl;

@WebServlet("/RestockProductSrv")
public class RestockProductSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RestockProductSrv() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userType = (String) session.getAttribute("usertype");
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userType == null || !userType.equals("admin")) {
            response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
        } else if (userName == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
        } else {
            // Login checked
            String prodId = request.getParameter("prodid");
            ProductServiceImpl productService = new ProductServiceImpl();
            
            // Assuming a fixed quantity for restocking purposes
            int restockQuantity = 10; // This can be dynamic as per your need
            String status = productService.restockProduct(prodId, restockQuantity);

            // Redirect to the same page with a status message
            response.sendRedirect("stockProduct.jsp?message=" + status);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}