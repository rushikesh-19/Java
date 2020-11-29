package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.ReportDAO;
import net.healthcare.model.Report;

@WebServlet("/ReportSetting")
public class ReportSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rId = request.getParameter("reportId");
		int reportId = Integer.parseInt(rId);
		
		String patientId = request.getParameter("patientId");
		String submitValue = request.getParameter("submit");

		System.out.println("Report Id: " + reportId);
		System.out.println("Patient Id: " + patientId);
		System.out.println("Submit Value: " + submitValue);
		
		Report report = new Report();
		ReportDAO reportDao = new ReportDAO();
		
		report.setReportId(reportId);

		if (submitValue.equals("Show")) {
			
			reportDao.showReport(report);
			
			System.out.println("Report show successfully Report id: " + reportId);
			
		} else if(submitValue.equals("Hide")) {
		
			reportDao.hideReport(report);
			
			System.out.println("Report hide successfully Report id: " + reportId);
		
		} else if (submitValue.equals("Delete")) {
			
			reportDao.deleteReport(report);
			
			System.out.println("Report delete successfully: " + reportId);
		
		} 
		
		response.sendRedirect("showReport.jsp?patientId=" + patientId);
	}

}