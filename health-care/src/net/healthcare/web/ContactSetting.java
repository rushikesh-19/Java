package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.ContactDAO;
import net.healthcare.model.Contact;

@WebServlet("/ContactSetting")
public class ContactSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cId = request.getParameter("contactId");
		int contactId = Integer.parseInt(cId);
		
		String submitValue = request.getParameter("submit");
		
		System.out.println("Contact Id: " + contactId);
		System.out.println("Submit Value: " + submitValue);
		
		Contact contact = new Contact();
		ContactDAO contactDao = new ContactDAO();
		
		contact.setContactId(contactId);

		if (submitValue.equals("Submit")) {
			
			contactDao.submitQuery(contact);
			
			System.out.println("Query submitted successfully Contact id: " + contactId);
			
		} else if(submitValue.equals("Undo")) {
		
			contactDao.undoQuery(contact);
			
			System.out.println("Query retrive successfully Contact id: " + contactId);
		
		} else if (submitValue.equals("Delete")) {
			
			contactDao.deleteContact(contact);
			
			System.out.println("Contact delete successfully: " + contactId);
		
		} 
		
		response.sendRedirect("showQueries.jsp");
	}

}
