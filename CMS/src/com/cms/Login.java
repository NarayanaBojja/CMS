package com.cms;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cms.db.MyDB;
import com.cms.model.User;

public class Login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			MyDB db = new MyDB();

			User user = db.checkUser(email, password);
			if(user!=null){
				HttpSession session = request.getSession();
				session.setAttribute("user", user);

				session.setAttribute("department", user.getDepartment());

				Cookie role = new Cookie("role", user.getRole());
				response.addCookie(role);

				System.out.println(user);

				request.getServletContext().getRequestDispatcher("/Home.jsp")
						.forward(request, response);
			}else {
				request.setAttribute("message", "Please enter correct credentials");
				request.getServletContext().getRequestDispatcher("/Login.jsp")
				.forward(request, response);
			}
			
			

		} catch (Exception ex) {
			request.setAttribute("message",
					"Something Went Wrong. Please try again later.");

			request.getServletContext().getRequestDispatcher("/Home.jsp")
					.forward(request, response);
			Logger.getLogger(ComplaintRegister.class.getName()).log(
					Level.SEVERE, null, ex);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
