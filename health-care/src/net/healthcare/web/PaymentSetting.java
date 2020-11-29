package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.PaymentDAO;
import net.healthcare.model.Payment;

@WebServlet("/PaymentSetting")
public class PaymentSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pId = request.getParameter("paymentId");
		int paymentId = Integer.parseInt(pId);
		
		String patientId = request.getParameter("patientId");
		
		String submitValue = request.getParameter("submit");
		
		System.out.println("Payment id: " + paymentId);
		System.out.println("Patient id: " + patientId);
		System.out.println("Submit Value: " + submitValue);

		Payment payment = new Payment();
		PaymentDAO paymentDao = new PaymentDAO();
		
		payment.setPaymentId(paymentId);

		if (submitValue.equals("Paid")) {
			
			paymentDao.paymentPaid(payment);
			
			System.out.println("Payment Paid successfully Payment id: " + paymentId);
			
		} else if (submitValue.equals("Unpaid")) {
		
			paymentDao.paymentUnpaid(payment);
			
			System.out.println("Payment Unpaid successfully Payment id: " + paymentId);
		
		} else if (submitValue.equals("Delete")) {
			
			paymentDao.paymentDelete(payment);
		
			System.out.println("Payment delete successfully Payment id: " + paymentId);
			
		} 
		
		response.sendRedirect("showPayment.jsp?patientId=" + patientId);
	}
}