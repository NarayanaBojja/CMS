package com.cms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.cms.model.User;

public class MyDB {
	Connection con;

	public Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/hostel", "root", "root");
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(MyDB.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println(ex);
		} catch (SQLException ex) {
			Logger.getLogger(MyDB.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println(ex);
		}
		return con;
	}

	public User checkUser(String email, String passWord) {

		Connection con = this.getCon();
		User user = null;
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from sregister where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, passWord);
			ResultSet rs = ps.executeQuery();
			int size = 0;
			while (rs.next()) {
				size++;
			}
			if (size > 0) {
				rs.beforeFirst();
				if (rs.next() == true) {
					user = new User();
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setRole(rs.getString("role"));
					user.setDepartment(rs.getString("department"));
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return user;

	}

}
