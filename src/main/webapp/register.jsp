<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>竞拍者注册页面 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function usernameCheck(){
			/* alert($("#username").val()); */
			var name = $("#username").val();
			if(name.length >= 6){
				$("#username").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("#username").next().prop("class","");
				return true;
			}else{
				$("#username").next().html("用户名要求不低于6个字符");
				$("#username").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function passwordCheck(){
			/* alert($("#password").val()); */
			var pwd = $("#password").val();
			if(pwd.length >= 6){
				$("#password").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("#password").next().prop("class","");
				return true;
			}else{
				$("#password").next().html("密码要求不低于6个字符");
				$("#password").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function userCardCheck(){
			/* alert($("#userCard").val()); */
			var ucard = $("#userCard").val();
			if(ucard.length >= 6){
				$("#userCard").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("#userCard").next().prop("class","");
				return true;
			}else{
				$("#userCard").next().html("身份证号不正确");
				$("#userCard").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function telephoneCheck(){
			/* alert($("#telephone").val()); */
			var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
			var tel = $("#telephone").val();
			//alert(reg.test(tel));
			if(reg.test(tel)){
				$("#telephone").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("#telephone").next().prop("class","");
				return true;
			}else{
				$("#telephone").next().html("电话号码不正确");
				$("#telephone").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function addressCheck(){
			//alert($("[name='user_address']").val());
			var address = $("[name='user_address']").val();
			// alert(address);
			if(address.length >= 6){
				$("[name='user_address']").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("[name='user_address']").next().prop("class","");
				return true;
			}else{
				$("[name='user_address']").next().html("地址必填");
				$("[name='user_address']").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function postNumberCheck(){
			//alert($("[name='user_post_number']").val());
			var postnum = $("[name='user_post_number']").val();
			//alert(postnum);
			if(postnum.length == 6){
				$("[name='user_post_number']").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("[name='user_post_number']").next().prop("class","");
				return true;
			}else{
				$("[name='user_post_number']").next().html("邮编必须为6位");
				$("[name='user_post_number']").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function questionCheck(){
			//alert($("[name='user_question']").val());
			var question = $("[name='user_question']").val();
			// alert(question);
			if(question.length > 0){
				$("[name='user_question']").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("[name='user_question']").next().prop("class","");
				return true;
			}else{
				$("[name='user_question']").next().html("用户找回密码的问题不能为空");
				$("[name='user_question']").next().prop("class","lf red laba");
				return false;
			}
		}
		
		function answerCheck(){
			//alert($("[name='user_answer']").val());
			var ans = $("[name='user_answer']").val();
			// alert(ans);
			if(ans.length > 0){
				$("[name='user_answer']").next().html("<img src='${pageContext.request.contextPath}/images/timg.jpg' width='25px' height='25px'>");
				$("[name='user_answer']").next().prop("class","");
				return true;
			}else{
				$("[name='user_answer']").next().html("用户找回密码的答案不能为空");
				$("[name='user_answer']").next().prop("class","lf red laba");
				return false;
			}
		}
		
		// 表单验证
		function registerCheck(){
			var name = usernameCheck();
			var pwd = passwordCheck();
			var ucard = userCardCheck();
			var tel = telephoneCheck();
			var add = addressCheck();
			// alert(add);
			var post = postNumberCheck();
			// alert(post);
			var quest = questionCheck();
			// alert(quest);
			var ans = answerCheck();
			// alert(ans);
			// alert(name&&pwd&&ucard&&tel&&add&&post&&quest&&ans);
			return name&&pwd&&ucard&&tel&&add&&post&&quest&&ans?true:false;
		}
		
		// 服务条款
		function checkbox(){
			if($(":checkbox").prop("checked")){
				$("[name='submit']").prop("type","hidden");
				$("[name='submit']").prop("type","submit");
			}else{
				$("[name='submit']").prop("type","hidden");
			}
			
		}
		
		// 验证码
		$(function(){
			$("a[href='javascript:void(0)']").click(function(){
				$("#verificationCode").prop("src","${pageContext.request.contextPath}/getKaptcha.do?a="+Math.random());
			});
		});
	</script>
  </head>
  
  <body>
    <div class="wrap">
	  <!-- main begin-->
	      <div class="zclf login logns">
	        <h1  class="blue">用户注册</h1>
	        <form action="${pageContext.request.contextPath}/register.do" method="post" onsubmit="return registerCheck()">
	          <dl>
	            <dd>
	              <label> <small>*</small>用户名</label>
	              <input type="text" class="inputh lf" value="" onblur="usernameCheck()" id="username" name="user_name"/>
	             <div ></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>密码</label>
	              <input type="text" class="inputh lf" value="" onblur="passwordCheck()" id="password" name="user_password"/>
	              <div></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>身份证号</label>
	              <input type="text" class="inputh lf" value="" onblur="userCardCheck()" id="userCard" name="user_card_no"/>
	              <div ></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>电话</label>
	              <input type="text" class="inputh lf" value="" onblur="telephoneCheck()" id="telephone" name="user_tel"/>
	              <div ></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>住址</label>
	              <input type="text" class="inputh lf" value="" onblur="addressCheck()" name="user_address"/>
	              <div ></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>邮政编码</label>
	              <input type="text" class="inputh lf" value="" onblur="postNumberCheck()" name="user_post_number"/>
	              <div ></div>
	            </dd>
	              <span><input type="hidden" class="inputh lf" value="0"  name="user_is_admin"/></span>
	            <dd>
	              <label> <small>*</small>用户找回密码的问题</label>
	              <input type="text" class="inputh lf" value="" onblur="questionCheck()" name="user_question"/>
	              <div ></div>
	            </dd>
	            <dd>
	              <label> <small>*</small>用户找回密码答案</label>
	              <input type="text" class="inputh lf" value="" onblur="answerCheck()" name="user_answer"/>
	              <div ></div>
	            </dd>
	            
	            
	            <dd class="hegas">
	              <label> <small>*</small>验证码</label>
	              <input type="text" class="inputh inputs lf" value="" name="kaptcha"/>
	               <span class="wordp lf"><img src="${pageContext.request.contextPath}/getKaptcha.do" width="96" height="27" alt="" id="verificationCode"/></span>
	               <span class="blues lf"><a href="javascript:void(0)" title="">看不清</a></span>
	            </dd>
	            <dd class="hegas">
	              <label>&nbsp;</label>
	               <input name=""  type="checkbox" id="rem_u"  onclick="checkbox()" />
	              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
	            </dd>
	            <dd class="hegas">
	              <label>&nbsp;</label>
	              <input name="submit" type="hidden" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
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
