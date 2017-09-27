package com.cms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.db.MyDB;

public class UpdateAdminComplaint extends HttpServlet {

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

			String token = request.getParameter("token");

			MyDB db = new MyDB();

			Connection con = db.getCon();

			String sql = "UPDATE complaint  SET  status = ?  where token= ? ;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "1");
			ps.setString(2, token);
			ps.executeUpdate();

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/ac");
			requestDispatcher.forward(request, response);

		} catch (Exception ex) {
			request.setAttribute("message",
					"Something Went Wrong. Please try again later.");

			request.getServletContext().getRequestDispatcher("/success.jsp")
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
	protected void doGet(HttpServletRequest request,
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
