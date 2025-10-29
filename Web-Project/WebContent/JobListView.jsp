<%@page import="com.rays.bean.JobBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
	<div align="center">
		<h3>Job List</h3>
		<form action="JobListCtl.do" method="post">
			<table>
				<tr>
					<th>Search</th>
					<td><input type="text" name="searchByTitle" value=""
						placeholder="Search by First name"></td>
					<td><input type="submit" name="operation" value="search"></td>
				</tr>
			</table>
			<table border="1px" width="100%">
				<tr style="background-color: skyBlue;">
					<th>Delete</th>
					<th>ID</th>
					<th>Title</th>
					<th>Joining Date</th>
					<th>Experience</th>
					<th>Status</th>
					<th>Edit</th>
				</tr>
				<%
					List list = (List) request.getAttribute("list");
					List nextList = (List) request.getAttribute("nextList");
					String successMsg = (String) request.getAttribute("successMsg");
					String errorMsg = (String) request.getAttribute("errorMsg");
					int pageNo = (int) request.getAttribute("pageNo");
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
				<%
					Iterator<JobBean> it = list.iterator();
				%>
				<%
					while (it.hasNext()) {
						JobBean bean = it.next();
				%>
				<tr align="center" style="background-color: #d3d3d3;">
					<td><input type="checkbox" name="ids" value=<%=bean.getId()%>></td>
					<td><%=bean.getId()%></td>
					<td><%=bean.getTitle()%></td>
					<td><%=bean.getJoiningDate()%></td>
					<td><%=bean.getExperience()%></td>
					<td><%=bean.getStatus()%></td>
					
					<td><a href="JobCtl.do?id=<%=bean.getId()%>">edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<th></th>
					<td><input type="submit" name="operation" value="previous" <%=pageNo == 1 ? "disabled": ""%>></td>
					<td><input type="submit" name="operation" value="delete"></td>
					<td align="right"><input type="submit" name="operation"
						value="next" <%=nextList.size() == 0 ? "disabled": ""%>></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>">
		</form>
	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>