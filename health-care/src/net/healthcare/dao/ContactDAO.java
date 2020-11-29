package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import net.healthcare.model.Contact;

public class ContactDAO {
	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	Statement stmt = null;

	public int submitQuery (Contact contact) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String submitQuery = "update contact set enquiryStatus = true where contactId = " + contact.getContactId();

			stmt = con.createStatement();
			stmt.executeUpdate(submitQuery);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int undoQuery (Contact contact) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String undoQuery = "update contact set enquiryStatus = false where contactId = " + contact.getContactId();

			stmt = con.createStatement();
			stmt.executeUpdate(undoQuery);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteContact(Contact contact) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String deleteQuery = "delete from contact where contactId = " + contact.getContactId();

			stmt = con.createStatement();
			stmt.executeUpdate(deleteQuery);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
