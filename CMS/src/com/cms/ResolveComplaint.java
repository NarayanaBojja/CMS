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
import com.cms.mail.SendEmail;

public class ResolveComplaint extends HttpServlet {

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

		try {
			/* TODO output your page here. You may use following sample code. */
			String token = request.getParameter("token");
			String name1 = request.getParameter("name1");
			String email = request.getParameter("cemail");
			String subject1 = request.getParameter("subject1");
			String message = request.getParameter("message");

			MyDB db = new MyDB();
			Connection con = db.getCon();

			String sql = "UPDATE complaint  SET  status = ?  where token= ? ;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "2");
			ps.setString(2, token);
			ps.executeUpdate();

			SendEmail sendEmail = new SendEmail();
			System.out.println(email);
			System.out.println(subject1);
			System.out.println(message);

			sendEmail.sendEmail(email, subject1, message);

			String successMessage = "You have successfully Updated Complaint.";

			request.setAttribute("message", successMessage);

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/resolveComplaint.jsp");
			requestDispatcher.forward(request, response);
			return;

		} catch (Exception ex) {
			Logger.getLogger(ComplaintRegister.class.getName()).log(
					Level.SEVERE, null, ex);
			request.setAttribute("message",
					"Something Went Wrong. Please try again later.");

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/resolveComplaint.jsp");
			requestDispatcher.forward(request, response);
			return;

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
