<%@page import="com.demy.Entites.EmployeeEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

.header .logo img{
    width: 100%;
    height: 7vh;
    top: 0;
    left: 0;
}

#services
{
margin-top: -90px;
}
.service {
    padding: 32px;
    background-color: #fff;
    box-shadow: var(--shadow);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* horizontal-offset vertical-offset blur-radius color */
    border: 1px solid white;
    border-radius:10px;
    margin: 10px;
    height: 40vh;
}

.service h5 {
    margin-bottom: 14px;
}

.service img {
    width: 90px;
}
table,td,a
{
font-size: 120%;
    text-transform:none;

}

</style>
</head>
<body>

   <%@ include file="employeeheader.jsp" %>
   
   
 <section id="home" class="home">
        <h2>Home / Staff</h2>
    </section>

<br>
<br>
<br>

<div class="container-fluid">

    <h2 class="text-center">Staff Details&nbsp;&nbsp;&nbsp;<a href="./addEmployee" class="btn btn-primary" style="${msg1}">Add Employee</a></h2>
    <span style="color: green; text-align: center; margin:0px 30px;">${msg}</span><br><br><br>

   <div class="table-responsive">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Offerletter</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty employees}">
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.email}</td>
                        <td>${employee.role}</td>
                        <td>
                            <a href="/download/${employee.offerLetter}" class="btn btn-success">Download</a>
                        </td>
                        <c:choose>
                            <c:when test="${sessionScope.loggedInEmployee.role == 'Manager'}">
                                <td>
                                    <a href="/edit?id=${employee.id}" class="btn btn-primary">Edit</a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${sessionScope.loggedInEmployee.id == employee.id}">
                                            <button class="btn btn-danger" disabled>Delete</button>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/delete?id=${employee.id}" class="btn btn-danger">Delete</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${not empty employee}">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.email}</td>
                    <td>${employee.role}</td>
                    <td>
                        <a href="/download/${employee.offerLetter}" class="btn btn-success">Download</a>
                    </td>
                    <td>
                        <a href="/edit?id=${employee.id}" class="btn btn-primary">Edit</a>
                    </td>
                    <td>
                        <button class="btn btn-danger" disabled>Delete</button>
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>