package com.admin.side;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/AddBook")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
				maxFileSize = 1024 * 1024 * 10, 
				maxRequestSize = 1024 * 1024 * 50)
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "B:/SW & Apps/Windows SW/Project/BookStore/WebContent/bookImages";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String savePath = File.separator + SAVE_DIR;
		
		File fileSaveDir = new File(savePath);
		
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		String book_name = request.getParameter("book_name");
		
		String book_author = request.getParameter("book_author");
		
		String book_isbn = request.getParameter("book_isbn");
		
		String book_price = request.getParameter("book_price");
		
		String book_details = request.getParameter("book_details");
		
		Part part = request.getPart("book_image");
		
		String image_name = extractFileName(part);
		
		part.write(savePath + File.separator + image_name);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
			String query = "insert into book values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery("select book_id from book");
			int bid = 0;
			while(rs.next())
			{
				 bid=rs.getInt("book_id");
			}
			bid++;
			ps.setInt(1,bid);
			ps.setString(2,book_name);
			ps.setString(3,book_author);
			ps.setString(4,book_isbn);
			ps.setString(5,book_price);
			ps.setString(6,image_name);
			ps.setString(7,book_details);
			ps.executeUpdate();
			
			
			response.sendRedirect("addbook.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private String extractFileName(Part part) {
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
