package com.cms;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.db.MyDB;
import com.cms.mail.SendEmail;

/**
 *
 * 
 */
public class ComplaintRegister extends HttpServlet {

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
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			String name1 = request.getParameter("name1");
			String email1 = request.getParameter("email1");
			String subject1 = request.getParameter("subject1");
			String address1 = request.getParameter("address1");
			String type = request.getParameter("dept");
			Random rn = new Random();
			int range = 200000 - 100000 + 1;
			int randomNum = rn.nextInt(range) + 100000;

			String token = email1.substring(0, 6) + randomNum;

			MyDB db = new MyDB();
			Connection con = db.getCon();
			Statement stmt = con.createStatement();
			int status = 0;
			stmt.executeUpdate("insert into complaint(name,email,subject,message,type,status,token)values('"
					+ name1
					+ "','"
					+ email1
					+ "','"
					+ subject1
					+ "','"
					+ address1 + "','" + type + "','" + status + "','" + token

					+ "') ");

			SendEmail sendEmail = new SendEmail();

			String message = "Hi  "
					+ name1
					+ ", \n"
					+ "We have received your complaint. Our team will look into the issue and get back to you shortly. \n"
					+ "Your Token : " + token;

			sendEmail.sendEmail(email1, subject1, message);

			String successMessage = "You have successfully submitted Complaint.";

			request.setAttribute("message", successMessage);

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/Complaint_Reg.jsp");
			requestDispatcher.forward(request, response);
			return;

		} catch (Exception ex) {
			Logger.getLogger(ComplaintRegister.class.getName()).log(
					Level.SEVERE, null, ex);
			request.setAttribute("message",
					"Something Went Wrong. Please try again later.");

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/Complaint_Reg.jsp");
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
