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
    
    <title>My JSP 'showOrderDetails.jsp' starting page</title>
    
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
   <h3>订单详细页面</h3><br>
   <button style="margin-left:185px" onclick="show()">变更订单</button>
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
  <%=reservation.orderstatus %>
   </td>
   </tr>
   </table>
   <script>
		function show(){
		var status ='<%=reservation.orderstatus%>';
		if(status!="进行中" ){
		alert("无法变更");
		event.preventDefault();
		}
		else window.location.href = "modifyOrderDetails.jsp";
		}
		</script>
  </body>
</html>
