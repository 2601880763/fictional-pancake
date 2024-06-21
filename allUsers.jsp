<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="com.Homework.UserReservation" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'allUsers.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  </head>
  
  <body>
  <form action="UserController" method="get" align=center>
  <table width=550px>
  <tr>
  <th>
  用户ID
  </th>
  <th>
  用户名
  </th>
  <th>
  商品订单
  </th>
  </tr>
  <c:forEach items="${list}" var="ur" varStatus="s">
            <tr>
            <td>${ur.userid}</td>
            <td>${ur.username} </td>
            <td>
            <c:forEach items="${ur.orders}" var="order" varStatus="s">
            
            <a href="OrderController?param=${order}" >订单ID-${order}、</a>
            
            </c:forEach>
            </td>
            </tr>
            
            </c:forEach>
  </table>
  
  </form>
  
            
  </body>
</html>
