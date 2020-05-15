<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Contact Manager Application</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#contactSearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#contactTb tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<style type="text/css">
	table {
	  border-collapse: collapse;
	  width: 80%;
	}
	th {
	  background-color: #4285F4;
	  color: white;
	}
	table, th, td,tr {
	  height: 30px;
	  border: 1px solid black;
	}
	tr:hover {
		background-color: #ddd;
	}
	.contact {
	  box-shadow: 0 10px 6px 0 rgba(0, 0, 0, 0.2);
	  padding: 16px;
	  text-align: center;
	}
	.alink{
		text-decoration: none;
	}
	.message{
		margin-bottom: 15px;
	}
	.pagination {
	  display: inline-block;
	}
	.pagination a {
	  color: black;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  border-radius: 50%;
	}	
	.pagination a:hover:not(.active) {
		background-color: #ddd;
	}
</style>
</head>
<body>
	<h2 align="center">----- Contact Manager Application -----</h2>
	<div align="center">
		<!-- <h3> Contact List </h3> -->
		<div style="margin: 15px 0px;">
			<a class="alink" href="../addContact">Add Contact</a>
		</div>
		<div class="form-group">
			<input style="width: 20%;" class="form-control" type="text" id="contactSearch" placeholder="Search Contact ">
		</div>
		<div class="message">
			<b style="color: green;"><c:if test="${addCon!=null}">${addCon}</c:if></b>
			<b style="color: green;"><c:if test="${updateCon!=null}">${updateCon}</c:if></b>
            <b style="color: red;"><c:if test="${delCon!=null}">${delCon}</c:if></b>
        </div>
		<table class="contact">
			<thead>
				<tr>
					<th>No.</th>
					<th>Name</th>
					<th>E-Mail</th>
					<th>Address</th>
					<th>Mobile</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="contactTb">
			<c:choose>
  				<c:when test="${not empty listContact}">
				<c:forEach items="${listContact}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td>${list.email}</td>
						<td>${list.address}</td>
						<td>${list.phone}</td>
						<td><a class="alink" href="../editcontact/${list.id}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							class="alink" href="../deletecontact/${list.id}">Delete</a></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">No Contact Found.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
	<div class="pagination" style="display: block; text-align: center; margin-top: 20px;">
		Total Contact : ${totalContcat} - Page ${currPage} of ${totalPages} -
		<c:choose>
			<c:when test="${currPage > 1}">
				<a href="${currPage-1}">Previous</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		<c:forEach var="contactPage" begin="1" end="${totalPages}">
			<c:choose>
				<c:when test="${contactPage != currPage}">
					<a href="/page/${contactPage}"><c:out value="${contactPage}" /></a>&nbsp;
				</c:when>
				<c:otherwise>
					<a class="active" href="/page/${contactPage}"><c:out value="${contactPage}" /></a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${currPage < totalPages}">
				<a href="${currPage+1}">Next</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>