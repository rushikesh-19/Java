package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import net.healthcare.model.Payment;

public class PaymentDAO {
	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	Statement stmt = null;

	public int paymentPaid(Payment payment) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String paymentPaid = "update payment set paymentStatus = true where paymentId = " + payment.getPaymentId();

			stmt = con.createStatement();
			stmt.executeUpdate(paymentPaid);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int paymentUnpaid(Payment payment) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String paymentUnpaid = "update payment set paymentStatus = false where paymentId=" + payment.getPaymentId();

			stmt = con.createStatement();
			stmt.executeUpdate(paymentUnpaid);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int paymentDelete(Payment payment) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String deletePayment = "delete from payment where paymentId =" + payment.getPaymentId();

			stmt = con.createStatement();
			stmt.executeUpdate(deletePayment);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}