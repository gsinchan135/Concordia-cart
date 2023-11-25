package com.shashi.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shashi.beans.UserBean;
import com.shashi.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RecommendationsSrv
 */
@WebServlet("/RecommendationsSrv")
public class RecommendationsSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecommendationsSrv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 // Retrieve form data
        String test = request.getParameter("something");
		response.setContentType("text/html");

        
        RequestDispatcher rd = request.getRequestDispatcher("/recommendations.jsp");

		HttpSession session = request.getSession();

        // You can perform further processing with the form data
        // For example, storing it in a database or session

        // Forward the request to a JSP file for displaying the result
		session.setAttribute("seed", test);
        rd.forward(request, response);

			

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
