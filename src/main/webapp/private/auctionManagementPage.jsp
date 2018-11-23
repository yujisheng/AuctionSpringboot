<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>拍卖商品管理页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(function(){
			$("[class='spbg buttombg f14  sale-buttom buttomb']").click(function(){
				location="${pageContext.request.contextPath}/private/add.jsp";
			});
		});
		
		$(function(){
			var price = parseInt($("#price").val());
			if(price==0){
				$("#price").val("");
			}
			
		});
	</script>
  </head>
  
  <body>
    <div class="wrap">
	<!-- main begin-->
	  <div class="sale">
	    <h1 class="lf">在线拍卖系统</h1>
	    <div class="logout right"><a href="${pageContext.request.contextPath}/logOut.do" title="注销">注销</a></div>
	  </div>
	  <form action="${pageContext.request.contextPath}/private/getAll.do" method="post">
		  <div class="forms">
		    <label for="name">名称</label>
		    <input name="auction_name" type="text" class="nwinput" id="name" value="${requestScope.auction.auction_name }"/>
		    <label for="names">描述</label>
		    <input name="auction_desc" type="text" id="names" class="nwinput" value="${requestScope.auction.auction_desc }"/>
		    <label for="time">开始时间</label>
		    <input name="auction_start_time" type="text" id="time" class="nwinput" value="<fmt:formatDate value='${requestScope.auction.auction_start_time }' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
		    <label for="end-time">结束时间</label>
		    <input name="auction_end_time" type="text" id="end-time" class="nwinput" value="<fmt:formatDate value='${requestScope.auction.auction_end_time }' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
		    <label for="price">起拍价</label>
		    <input name="auction_start_price" type="text" id="price" class="nwinput" value="${requestScope.auction.auction_start_price }"/>
		    <input name="" type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
		    <c:if test="${sessionScope.auctionUser.user_is_admin==1}">
		    	<input type="button"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"/>
		    </c:if>
		  </div>
	  </form>
	  <div class="items">
	      <ul class="rows even strong">
	        <li>名称</li>
	        <li class="list-wd">描述</li>
	        <li>开始时间</li>
	        <li>结束时间</li>
	        <li>起拍价</li>
	        <li class="borderno">操作</li>
	      </ul>
	      <c:forEach items="${requestScope.auctionList}" var="auction">
	      <ul class="rows">
	        <li><a href="#" title="">${auction.auction_name }</a></li>
	        <li class="list-wd">${auction.auction_desc }</li>
	        <li><fmt:formatDate value="${auction.auction_start_time }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
	        <li><fmt:formatDate value="${auction.auction_end_time }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
	        <li>${auction.auction_start_price }</li>
	        <li class="borderno red">
	        	<c:if test="${sessionScope.auctionUser.user_is_admin==0}">
	           		<a href="${pageContext.request.contextPath}/private/auctionList.do?auctionId=${auction.auction_id}">竞拍</a>
	           	</c:if>
			   <c:if test="${sessionScope.auctionUser.user_is_admin==1}">
				   <%-- <a href="${pageContext.request.contextPath}/private/getOne.do?auctionId=${auction.auction_id}" title="修改" onclick="dele()">修改</a>| --%>
				   <a href="javascript:void(0)" title="修改" onclick="dele(${auction.auction_id})">修改</a>|
		           <%-- <a href="${pageContext.request.contextPath}/private/deleteAuction.do?auctionId=${auction.auction_id}" title="删除" onclick="abc()">删除</a> --%>
		           <a href="javascript:void(0)" title="删除" onclick="abc(${auction.auction_id})">删除</a>
	           </c:if>
	        </li>
	      </ul>
	      </c:forEach>
	     
	      <div class="page">
	        <a href="#" title="">首页</a>
	        <a href="#" title="">上一页</a>
	        <span class="red">前5页</span>
	        <a href="#" title="">1</a> 
	        <a href="#" title="">2</a> 
	        <a href="#" title="">3</a> 
	        <a href="#" title="">4</a>
	        <a href="#" title="">5</a> 
	        <a href="#" title="">下一页</a>
	        <a href="#" title="">尾页</a> 
	      </div>
	  </div>
	  <script type="text/javascript">
	   function abc(id){
		   
		   if(confirm("你真的确认要删除吗？请确认")){
		    	location = "${pageContext.request.contextPath}/private/deleteAuction.do?auctionId="+id;
			   return true;
			} 	 
		};
		
	   function dele(id){
		   if(confirm("你真的确认要修改吗？请确认")){
		   	   location = "${pageContext.request.contextPath}/private/getOne.do?auctionId="+id;
			   return true;
		   }else{
			   return false;
		   }
		};
	  </script>
	<!-- main end-->
	</div>
  </body>
</html>
