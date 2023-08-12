<%@page import="com.entity.TodoDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container ">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card bg-info-subtle">
					<div class="card-body">
						<h3 class="text-center">Add TODO Here!</h3>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						TodoDAO dao = new TodoDAO(DBConnect.getConn());
						TodoDtls t = dao.getTodoById(id);
						
						%>
						
						


						<form action="update" method="post">
						<input type="hidden" value="<%= t.getId()%>" name="id">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name
								</label> <input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="username" value="<%=t.getName()%>">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Todo
									Task </label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="todo" value="<%=t.getTodo()%>">

							</div>
							<div class="mb-3">
								<label for="inputState" class="form-label">Status </label> <select
									id="inputState" class="form-select" name="status">
									
									<%
									if("Pending".equals(t.getStatus())){%>
										<option value="Pending">Pending</option>
									<option value="Complete">Complete</option>
									<%}
									else{%>
										<option value="Pending">Pending</option>
										<option value="Complete">Complete</option>
									<%}
									%>
									
								
									
								</select>
							</div>

							<button type="submit" class="btn btn-primary">UpDate</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>