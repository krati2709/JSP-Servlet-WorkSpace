<%@page import="com.rays.bean.JobBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<%
	String successMsg = (String) request.getAttribute("successMsg");
	String errorMsg = (String) request.getAttribute("errorMsg");
	JobBean bean = (JobBean) request.getAttribute("bean");
	%>

	<div align="center">
		<%
		if (bean != null && bean.getId() > 0) {
		%>
		<h3>Update Job Requirement</h3>
		<%
		} else {
		%>
		<h3>Add Job</h3>
		<%
		}
		%>

		<%
		if (successMsg != null) {
		%>
		<h3 style="color: green;"><%=successMsg%></h3>
		<%
		}
		%>

		<%
		if (errorMsg != null) {
		%>
		<h3 style="color: red;"><%=errorMsg%></h3>
		<%
		}
		%>

		<form action="JobCtl.do" method="post">
			<input type="hidden" name="id"
				value="<%=bean != null ? bean.getId() : ""%>">
			<table>
				<tr>
					<th>Title</th>
					<td><input type="text" name="title"
						value="<%=bean != null ? bean.getTitle() : ""%>"
						placeholder="enter job title"><span style="color: red"><%=request.getAttribute("title") != null ? request.getAttribute("title") : ""%></span></td>
				</tr>
				<tr>
					<th>Joining date</th>
					<td><input type="date" name="joiningDate"
						value="<%=bean != null ? bean.getJoiningDate() : ""%>"><span style="color: red"><%=request.getAttribute("joiningDate") != null ? request.getAttribute("joiningDate") : ""%></span></td>
				</tr>
				<tr>
					<th>Required Experience</th>
					<td><input type="text" name="experience"
						value="<%=bean != null ? bean.getExperience() : ""%>"
						placeholder="enter required experience"><span style="color: red"><%=request.getAttribute("experience") != null ? request.getAttribute("experience") : ""%></span></td>
				</tr>
				<tr>
					<th>Status</th>
					<td><input type="text" name="status"
						value="<%=bean != null ? bean.getStatus() : ""%>"
						placeholder="enter current status"><span style="color: red"><%=request.getAttribute("status") != null ? request.getAttribute("status") : ""%></span></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" name="operation"
						value="<%=bean != null ? "update" : "save"%>"></td>
				</tr>
			</table>

		</form>

	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>