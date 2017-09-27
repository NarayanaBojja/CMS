package com.cms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.db.MyDB;
import com.cms.model.Complaint;

public class GetStaffComplaint extends HttpServlet {

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

			String sql = "select * from complaint where token= ? ;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, token);
			
			ResultSet result = ps.executeQuery();
			result.next();
			Complaint complaint = new Complaint();
			complaint.setEmail(result.getString("email"));
			complaint.setMessage(result.getString("message"));
			complaint.setName(result.getString("name"));
			complaint.setStatus(result.getString("status"));
			complaint.setSubject(result.getString("subject"));
			complaint.setToken(result.getString("token"));
			complaint.setType(result.getString("type"));
			
			request.setAttribute("complaint", complaint);

			request.getServletContext().getRequestDispatcher("/resolveComplaint.jsp")
					.forward(request, response);
			
		
			
			
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
