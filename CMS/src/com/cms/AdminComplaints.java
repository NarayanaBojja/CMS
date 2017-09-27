package com.cms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.db.MyDB;
import com.cms.model.Complaint;

public class AdminComplaints extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {

			MyDB db = new MyDB();
			Connection con = db.getCon();
			Statement stmt = con.createStatement();

			ResultSet result = stmt
					.executeQuery("select * from complaint where status = 0 ");

			List<Complaint> complaintList = new ArrayList<>();

			while (result.next()) {
				Complaint complaint = new Complaint();
				complaint.setEmail(result.getString("email"));
				complaint.setMessage(result.getString("message"));
				complaint.setName(result.getString("name"));
				complaint.setStatus(result.getString("status"));
				complaint.setSubject(result.getString("subject"));
				complaint.setToken(result.getString("token"));
				complaint.setType(result.getString("type"));
				complaintList.add(complaint);
			}

			Collections.reverse(complaintList);

			request.setAttribute("complaintList", complaintList);

			request.getServletContext()
					.getRequestDispatcher("/IssuesAdmin.jsp")
					.forward(request, response);

		} catch (SQLException ex) {
			request.setAttribute("message",
					"Something Went Wrong. Please try again later.");

			request.getServletContext()
					.getRequestDispatcher("/IssuesAdmin.jsp")
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
