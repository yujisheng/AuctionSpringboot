<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品页</title>
    
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
				$("[name='auction_start_time']").next().html("格式：2010-05-05 12:30:00");
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
				$("[name='auction_end_time']").next().html("格式：2010-05-05 12:30:00");
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
		
		// 获取上传文件的图片
		$(function(){
            // 文件上传(文件域)的改变事件
            $(':file').change(function(event) {
                  //  HTML5 js 对象的获取
                 var files = event.target.files, file;  
                  if(files && files.length > 0){
                      // 获取目前上传的文件
                    file = files[0];
                      // 文件的限定类型什么的道理是一样的
                    if(file.size > 1024 * 1024 * 2) {
                          alert('图片大小不能超过 2MB!');
                           return false;
                   }
                   // file对象生成可用的图片
                    var URL = window.URL || window.webkitURL;
                   // 通过 file 生成目标 url
                   var imgURL = URL.createObjectURL(file);
                    // 用这个 URL 产生一个 <img> 将其显示出来
                   $("#img2").prop('src', imgURL);
                }
            });
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
	      <div class="login logns produce">
	        <h1 class="blues">拍卖品信息</h1>
	        <form action="${pageContext.request.contextPath}/private/addAuction.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	          <dl>
	            <dd >
	              <label>名称：</label>
	              <input type="text" class="inputh lf" value="" name="auction_name" onblur="nameCheck()"/>
	              <div class="xzkbg spbg lf"></div>
	            </dd>
	            <dd>
	              <label>起拍价：</label>
	              <input type="text" class="inputh lf" value="" name="auction_start_price" onblur="startPriceCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>底价：</label>
	              <input type="text" class="inputh lf" value="" name="auction_upset" onblur="upsetCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>开始时间：</label>
	              <input type="text" class="inputh lf" value="" name="auction_start_time" onblur="startTimeCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd>
	              <label>结束时间：</label>
	              <input type="text" class="inputh lf" value="" name="auction_end_time" onblur="endTimeCheck()"/>
	              <div class="lf red laba"></div>
	            </dd>
	            <dd class="dds">
	              <label>拍卖品图片：</label>
	               <div class="lf salebd"><a href="#"><img src="" width="100" height="100" id="img2"/></a></div>
	              <input name="uploadFile" type="file" class="offset10 lf" onblur="uploadFileCheck()"/>
	             
	            </dd>
	             <dd class="dds">
	              <label>描述：</label>
	              <textarea name="auction_desc" cols="" rows="" class="textarea" onblur="descCheck()"></textarea>
	            </dd>
	            <dd class="hegas">
	                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs buttomb f14 lf" />
	                <input name="" type="button" value="取 消" class="spbg buttombg buttombgs buttomb f14 lf" />
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
