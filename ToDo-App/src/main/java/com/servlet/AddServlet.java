package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.db.DBConnect;

@WebServlet("/add_todo")

public class AddServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");
		
		System.out.println(username+" "+todo+" "+status+"");
		
		TodoDAO dao=new TodoDAO(DBConnect.getConn());
		boolean b=dao.addTodo(username, todo,status);
		HttpSession session=req.getSession();
		
		if(b) {
			session.setAttribute("sscMsg", "TODO Added Successfully !");
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something Went Wrong !");
			resp.sendRedirect("index.jsp");
			System.out.println(b);
		}
	}
}
