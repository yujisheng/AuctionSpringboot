<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>竞拍页面</title>
    
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
			// 刷新
			$("[name='button1']").click(function(){
				var auction_id = parseInt($(":hidden[name='auction_id']").val());
				//alert(auction_id);
				location = "${pageContext.request.contextPath}/private/auctionList.do?auctionId="+auction_id;
			});
			
			// 返回列表
			$("[name='button2']").click(function(){
				location = "${pageContext.request.contextPath}/private/getAll.do";
			});
			
		});
		
		// 竞拍提示
		function auctionPriceCheck(){
			//alert($("#sale").val());
			//alert($("[name='maxPrice']:first").html());
			var inputPrice = $("#sale").val();
			var price = $("[name='maxPrice']:first").html();
			if(inputPrice > price || price == undefined){
				$("[name='auction_price']").parent().next().html("");
				return true;
			}else{
				$("[name='auction_price']").parent().next().html("不能低于最高竞拍价");
				return false;
			}
		}
	</script>
  </head>
  
  <body>
    <div class="wrap">
	<!-- main begin-->
	  <div class="sale">
	    <h1 class="lf">在线拍卖系统</h1>
	    <div class="logout right"><a href="${pageContext.request.contextPath}/logOut.do" title="注销">注销</a></div>
	  </div>
	  <div class="items sg-font lf">
	      <ul class="rows">
	        <li>名称：</li>
	        <li class="borderno">${requestScope.auction.auction_name}</li>
	      </ul>
	      <ul class="rows">
	        <li>描述：</li>
	        <li class="borderno">${requestScope.auction.auction_desc}</li>
	      </ul>
	      <ul class="rows">
	        <li>开始时间：</li>
	        <li class="borderno"><fmt:formatDate value="${requestScope.auction.auction_start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
	      </ul>
	      <ul class="rows">
	        <li>结束时间：</li>
	        <li class="borderno"><fmt:formatDate value="${requestScope.auction.auction_end_time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
	      </ul>
	      <ul class="rows border-no">
	        <li>起拍价：</li>
	        <li class="borderno">${requestScope.auction.auction_start_price}</li>
	      </ul>
	  </div>
	  <div class="rg borders"><img src="${pageContext.request.contextPath }/images/${requestScope.auction.auction_pic}" width="270" height="185" alt="" /></div>
	  <div class="cl"></div>
	  <form action="${pageContext.request.contextPath}/private/addAuctionPrice" method="post" onsubmit="return auctionPriceCheck()">
		  <div class="top10 salebd">
		  	<input type="hidden" name="auction_id" value="${requestScope.auction.auction_id}"/>
		  	<input type="hidden" name="user_id" value="${sessionScope.auctionUser.user_id}"/>
		       <p>
			       <label for="sale">出价：</label>
			       <input type="text"  class="inputwd" id="sale" value="" name="auction_price"/>
			       <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom"/>
		       </p>
		       <p class="f14 red"></p>
		  </div>
	  </form>
	  <div class="top10">
	    <input name="button1" type="button" value="刷 新" class="spbg buttombg f14" />
	    <input name="button2" type="button" value="返回列表" class="spbg buttombg f14" />
	  </div>
	  <div class="offer">
	    <h3>出价记录</h3>
	    <div class="items sg-font">
	      <ul class="rows even strong">
	        <li>竞拍时间</li>
	        <li>竞拍价格</li>
	        <li class="borderno">竞拍人</li>
	      </ul>
	      <c:forEach items="${requestScope.recordList }" var="auc">
		      <ul class="rows" >
		        <li><fmt:formatDate value="${auc.auction_time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
		        <li name="maxPrice">${auc.auction_price}</li>
		        <li class="borderno">${auc.auctionUser.user_name}</li>
		      </ul>
	      </c:forEach>
	  </div>
	  </div>
	<!-- main end-->
	</div>
  </body>
</html>
