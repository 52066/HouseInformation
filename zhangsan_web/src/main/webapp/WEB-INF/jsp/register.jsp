<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css" />
	</head>
	<body>
<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="">用户注册</a></li>

</ul>
	
		<div style="width:400px; margin:auto; margin-top: 50px; padding: 30px 10px; border: lightblue 1px solid;">
			<blockquote class="layui-elem-quote">
				<h4>注册</h4>
			</blockquote>
			
			<form class="layui-form layui-form-pane" >
			  <div class="layui-form-item" style="margin-top: 20px">
			    <label class="layui-form-label">身份证号：</label>
			    <div class="layui-input-block">
			      <input type="text" name="title" autocomplete="off" placeholder="请输入帐号" id="userIdentity" class="layui-input">
			    </div>
			  </div>


				<div class="layui-form-item" style="margin-top: 20px">
					<label class="layui-form-label">用户名：</label>
					<div class="layui-input-block">
						<input type="text" name="title" autocomplete="off" placeholder="请输入帐号" id="name" class="layui-input">
					</div>
				</div>
			  <div class="layui-form-item" style="margin-top: 20px">
			    <label class="layui-form-label">密码：</label>
			    <div class="layui-input-block">
			      <input type="password" name="title" autocomplete="off" placeholder="请输入密码"  id="pwd" class="layui-input">
			    </div>
			  </div>

				<div class="layui-form-item" style="margin-top: 20px">
					<label class="layui-form-label">确认密码：</label>
					<div class="layui-input-block">
						<input type="password" name="title" autocomplete="off" placeholder="请输入密码"  id="pwd1" class="layui-input">
					</div>
				</div>
			  
			  <div class="layui-form-item" style="margin-top: 20px">
			    <input type="button" class="layui-btn" onclick="checkInfo()" value="注册" style="width:100%"/>
			  </div>
			</form>


		</div>
		
		<script type="text/javascript" src="layui/layui.js" ></script>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
		<script type="text/javascript">
			var layer;
			layui.use("layer",function(){
				layer = layui.layer;
			});



			$(function () {
				$("#pwd1").blur(function () {
					if ($("#pwd").val()!=$("#pwd1").val()){
						alert("俩次密码不一致")
					}
				})

				$("#userIdentity").blur(function () {
					if ($("#userIdentity").val().length<6){
						alert("身份证号不小于6位");

					} else {
						var userIdentity = $("#userIdentity").val();
						console.log(userIdentity);
						$.post("user/selectByUserIdentity.do",{"userIdentity":userIdentity},function(data){
							console.log(data);
							//根据校验结果进行页面跳转
							if(data.code == 0) {
								alert(data.msg);
							}
						},"json");
					}
				})
				//
				// $("#name").blur(function () {
				// 	var name = $("#name").val();
				// 	$.post("",{},function () {
				//
				// 	},JSON);
				// })
			});

			function checkInfo() {
				var userIdentity = $("#userIdentity").val();
				var name = $("#name").val();
				var pwd = $("#pwd").val();
				var pwd1 = $("#pwd1").val();

				$.post("user/register.do",{"userIdentity":userIdentity,"name":name,"password":pwd,"password1":pwd1},function(data){
					console.log(data);
					//根据校验结果进行页面跳转
					if(data.code == 1){
						var flag = confirm("注册成功，是否登陆");
						if(flag) {
							location.href = "toLogin.do";
						}
					}else{
						//登录失败
						layer.msg(data.msg);
					}
				},"json");
			}
		</script>
	</body>
</html>
