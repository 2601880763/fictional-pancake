<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="com.Homework.Reservation" %>
<%@ page import ="com.Homework.Product" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyOrderDetails.jsp' starting page</title>
    
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
  <%Reservation reservation = (Reservation) session.getAttribute("reservation"); %>
<h3>订单状态变更页面</h3><br>
<form action="ReservationController" method="post" >
<table>
   <tr>
   <td>
   用户ID
   </td>
   <td>
    <%=reservation.userid %>
   </td>
   </tr>
   <tr>
   <td>
   订单ID
   </td>
   <td>
   <%=reservation.orderid %>
   </td>
   </tr>
   <tr>
   <td>
   订单时间
   </td>
   <td>
   <%=reservation.ordertime %>
   </td>
   </tr>
   <tr>
   <td>
   预订商品列表
   </td>
   <td>
   
   <c:forEach items="${list2}" var="product" varStatus="s">
            <p width = 40px>${product.pname} (${product.pcount})、</p>
            </c:forEach>
            
   </td>
   </tr>
   <tr>
   <td>
   订单总价
   </td>
   <td>
 <%=reservation.ordertotal %>
   </td>
   </tr>
   <tr>
   <td>
   订单状态
   </td>
   <td>
  <select name="dropdown" id="dropdown">
        <option value="option1">已完成</option>
        <option value="option2">已撤销</option>
        <option value="option3" selected>进行中</option>
        
    </select>
   </td>
   </tr>
   </table>
   
   <button onclick="show2()">取消变更</button>
   
    <input type="hidden" name="oId" value="${reservation.orderid}" />

   
   <button type="submit" style="margin-left:100px" onclick="show1()">确认变更</button>
   </form>
   <script>
		function show1(){
		var status =dropdown;
		if(status.equals("进行中") ){
		alert("不能变更");
		
		event.preventDefault();
		}
		
		}
		function show2(){
		window.location.href = "showOrderDetails.jsp";
		event.preventDefault();
		}
		
		
		</script>
  </body>
</html>
