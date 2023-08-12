<%@page import="com.entity.TodoDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO_List</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<h1 class="text-center">TODO Application</h1>

	<%
	String sscMsg = (String) session.getAttribute("sscMsg");
	if (sscMsg != null) {
	%>
	<div class="alert alert-primary" role="alert">
		<%=sscMsg%>
	</div>
	<%
	session.removeAttribute("sscMsg");
	}
	%>
	
	<%
	String failedMsg = (String) session.getAttribute("failedMsg");
	if (failedMsg != null) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=sscMsg%>
	</div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>

	<div class="container">
		<table class="table table-striped" border="1">
			<thead class="table-info">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Todo</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
			<%
				TodoDAO dao = new TodoDAO(DBConnect.getConn());
				List<TodoDtls> todo= dao.geTodo();
				for(TodoDtls t:todo){%>
					<tr>
					<th scope="row"><%= t.getId() %></th>
					<td scope="col"><%=  t.getName()%></td>
					<td><%= t.getTodo() %></td>
					<td><%= t.getStatus() %></td>
					<td><a href="edit.jsp?id=<%=t.getId() %>" class="btn btn-info">Edit</a> 
					<a href="delete?id=<%=t.getId()%>"
						class="btn btn-danger">Delete</a></td>
				</tr>
				<%}
			%>
				

			</tbody>
		</table>
	</div>


</body>
</html>