package net.healthcare.web;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadPaymentReceipt")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class UploadPaymentReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "B:/Work/Java/Projects/HealthCare/WebContent/paymentImages";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String type = request.getContentType();
//		System.out.println(type);

		String savePath = File.separator + SAVE_DIR;

		File fileSaveDir = new File(savePath);

		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		String patientId = request.getParameter("patientId");
		String paymentId = request.getParameter("paymentId");
		Part part = request.getPart("paymentImage");
		String submitValue = request.getParameter("submit");

		String image_name = extractNewFile(part);

		System.out.println("Patient id: " + patientId);
		System.out.println("Payment id: " + paymentId);
		System.out.println("Payment image name: " + image_name);
		System.out.println("Submit Value: " + submitValue);
		
		part.write(savePath + File.separator + image_name);

		try {
			Connection con = null;
			PreparedStatement ps = null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");

			if (submitValue.equals("Send New Bill")) {
				
				String setNewPayment = "insert into payment (paymentStatus, paymentReceipt, patientId) values (?,?,?)";
				ps = con.prepareStatement(setNewPayment);
				
				ps.setBoolean(1, false);
				ps.setString(2, image_name);
				ps.setString(3, patientId);
				ps.executeUpdate();

				ps.close();
				con.close();
				
				System.out.println("New payment set successfully Patient Id: " + patientId);
				
			} else if (submitValue.equals("Update Bill")) {
				
				String updatePaymentReceipt = "update payment set paymentReceipt = ? where paymentId = " + paymentId;
				ps = con.prepareStatement(updatePaymentReceipt);
				
				ps.setString(1, image_name);
				ps.executeUpdate();

				ps.close();
				con.close();
				System.out.println("Payment update successfully Payment id: " + paymentId);
				
			} else {
				System.out.println("Something Went Wrong patient id:" + patientId);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		response.sendRedirect("showPayment.jsp?patientId=" + patientId);
	}

	private String extractNewFile(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");

		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}