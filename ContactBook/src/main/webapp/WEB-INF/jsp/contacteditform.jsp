<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Contact Manager Application</title>
<style type="text/css">
input[type=text], select {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
textarea{
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
.button {
	background-color: #4285F4;
    border: none;
    color: white;
    padding: 12px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
}
table {
  border-collapse: collapse;
  width: 20%;
}
th, td,tr {
  height: 50px;
  
}
</style>
</head>
<body>
	<h2 align="center">----- Contact Manager Application -----</h2>
	<div align="center">
		<h4>Update Contact</h4>
		<form:form method="post" action="/editsave" modelAttribute="contact">
			<table>
				<tr style="visibility: collapse;">
					<td></td>
					<td><form:hidden path="id" /></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td>E-Mail :</td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td>Address :</td>
					<td><form:textarea path="address" /></td>
				</tr>
				<tr>
					<td>Mobile :</td>
					<td><form:input path="phone" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="button" type="submit" value="Update Contact" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>