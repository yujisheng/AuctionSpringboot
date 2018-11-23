<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改商品页</title>
    
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
			$("[type='button']").click(function(){
				location="${pageContext.request.contextPath}/private/getAll.do";
			});
		});
		
		// 表单验证
		function nameCheck(){
			//alert($("[name='auction_name']").val());
			var reg = /^[\u4E00-\u9FA5A-Za-z0-9]+$/;
			var name = $("[name='auction_name']").val();
			// alert(reg.test(name));
			if(reg.test(name)){
				$("[name='auction_name']").next().prop("class","");
				$("[name='auction_name']").next().html("");
				return true;
			}else{
				$("[name='auction_name']").next().prop("class","lf red laba");
				$("[name='auction_name']").next().html("拍卖品名称由数组，中文，英文组成且不能为空");
				return false;
			}
		}
		
		function startPriceCheck(){
			//alert(parseInt($("[name='auction_start_price']").val()));
			var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
			var start = $("[name='auction_start_price']").val();
			// alert(reg.test(start));
			if(reg.test(start)){
				$("[name='auction_start_price']").next().prop("class","");
				$("[name='auction_start_price']").next().html("");
				return true;
			}else{
				$("[name='auction_start_price']").next().prop("class","lf red laba");
				$("[name='auction_start_price']").next().html("必须为数字");
				return false;
			}
		}
		
		function upsetCheck(){
			//alert($("[name='auction_upset']").val());
			var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
			var upset = $("[name='auction_upset']").val();
			if(reg.test(upset)){
				$("[name='auction_upset']").next().prop("class","");
				$("[name='auction_upset']").next().html("");
				return true;
			}else{
				$("[name='auction_upset']").next().prop("class","lf red laba");
				$("[name='auction_upset']").next().html("必须为数字");
				return false;
			}
		}
		function startTimeCheck(){
			//alert($("[name='auction_start_time']").val());
			var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
			var stime =  $("[name='auction_start_time']").val();
			// alert(reg.test(stime));
			if(reg.test(stime)){
				$("[name='auction_start_time']").next().prop("class","");
				$("[name='auction_start_time']").next().html("");
				return true;
			}else{
				$("[name='auction_start_time']").next().prop("class","lf red laba");
				$("[name='auction_start_time']").next().html("格式：2011-05-05 12:30:00");
				return false;
			}
		}
		
		function endTimeCheck(){
			//alert($("[name='auction_end_time']").val());
			var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
			var stime =  $("[name='auction_end_time']").val();
			// alert(reg.test(stime));
			if(reg.test(stime)){
				$("[name='auction_end_time']").next().prop("class","");
				$("[name='auction_end_time']").next().html("");
				return true;
			}else{
				$("[name='auction_end_time']").next().prop("class","lf red laba");
				$("[name='auction_end_time']").next().html("格式：2011-05-05 12:30:00");
				return false;
			}
		}
		
		function checkForm(){
			var n = nameCheck();
			//alert(n);
			var sp = startPriceCheck();
			//alert(s);
			var u = upsetCheck();
			//alert(u);
			var s = startTimeCheck();
			var e = endTimeCheck();
			
			return n&&sp&&u&&s&&e?true:false;
			 
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
	      <div class="login logns produce">
	        <h1 class="blues">拍卖品信息</h1>
	        <form action="${pageContext.request.contextPath}/private/updateAuction.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	          <dl>
	          	<input type="hidden" class="inputh lf" value="${requestScope.auction.auction_id }" name="auction_id"/>
	            <dd >
	              <label>名称：</label>
	              <input type="text" class="inputh lf" value="${requestScope.auction.auction_name }" name="auction_name" onblur="nameCheck()"/>
	              <div class="xzkbg spbg lf"></div>
	            </dd>
	            <dd>
	              <label>起拍价：</label>
	              <input type="text" class="inputh lf" value="${requestScope.auction.auction_start_price }" name="auction_start_price"  onblur="startPriceCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>底价：</label>
	              <input type="text" class="inputh lf" value="${requestScope.auction.auction_upset }" name="auction_upset" onblur="upsetCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>开始时间：</label>
	              <input type="text" class="inputh lf" value="<fmt:formatDate value='${requestScope.auction.auction_start_time}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="auction_start_time" onblur="startTimeCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>结束时间：</label>
	              <input type="text" class="inputh lf" value="<fmt:formatDate value='${requestScope.auction.auction_end_time }' pattern='yyyy-MM-dd HH:mm:ss'/>" name="auction_end_time" onblur="endTimeCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd class="dds">
	              <label>描述：</label>
	              <textarea name="auction_desc" cols="" rows="" class="textarea">${requestScope.auction.auction_desc}</textarea>
	            </dd>
	            <dd>
	              <label>修改图片：</label>
	              <div class="lf salebd"><a href="#"><img src="${pageContext.request.contextPath }/images/${requestScope.auction.auction_pic}" width="100" height="100" /></a></div>
	              <input type="hidden" name="auction_pic" value="${requestScope.auction.auction_pic }"/>
	               <input name="uploadFile" type="file" class="marg10"/>
	            </dd>
	            <dd class="hegas">
	                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
	                <input name="" type="button" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
	            </dd>
	          </dl>
	         </form>
	    </div>
	<!-- main end-->
	<!-- footer begin-->
	
	</div>
	 <!--footer end-->
	 
	</div>
  </body>
</html>
