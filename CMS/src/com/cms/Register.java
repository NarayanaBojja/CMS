package com.cms;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.db.MyDB;

/**
 *This servlet is used to register user/staff/admin
 * 
 */
public class Register extends HttpServlet {

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
			String name = request.getParameter("name");

			String mob = request.getParameter("mob");
			String add = request.getParameter("add");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String role = request.getParameter("role");
			String dept = request.getParameter("dept");
			
			MyDB db = new MyDB();
			Connection con = db.getCon();
			Statement stmt = con.createStatement();
			
			stmt.executeUpdate("insert into sregister(name,mobile,address,email,password,role,department)values('"
					+ name
					+ "','"
					+ mob
					+ "','"
					+ add
					+ "','"
					+ email
					+ "','"
					+ pass 
					+ "','"
					+ role 
					+ "','"
					+ dept 
					+ "') ");

			String successMessage = "You have successfully created  Account. Click here to login <a href='Login.jsp'>Login</a>";
		
			request.setAttribute("message", successMessage);

			request.getServletContext().getRequestDispatcher("/Join_Us.jsp")
					.forward(request, response);
			
			
		} catch (Exception ex) {
			request.setAttribute("message", "Something Went Wrong. Please try again later.");

			request.getServletContext().getRequestDispatcher("/Join_Us.jsp")
					.forward(request, response);
			Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null,
					ex);
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
