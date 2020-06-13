<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css" />
	</head>
	<body>
<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="">管理员登陆</a></li>

</ul>
	
		<div style="width:400px; margin:auto; margin-top: 50px; padding: 30px 10px; border: lightblue 1px solid;">
			<blockquote class="layui-elem-quote">
				<h4>会员登录</h4> <a href="toRegister.do"><h5><font color="#a52a2a"> 还不是会员去注册</font></h5></a>
			</blockquote>
			
			<form class="layui-form layui-form-pane" >
			  <div class="layui-form-item" style="margin-top: 20px">
			    <label class="layui-form-label">身份证号：</label>
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
			    <input type="button" class="layui-btn" onclick="checkInfo()" value="登录" style="width:100%"/>
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

			function checkInfo() {
				var name = $("#name").val();
				var pwd = $("#pwd").val();

				$.post("user/login.do",{"userIdentity":name,"password":pwd},function(data){
					console.log(data);
					//根据校验结果进行页面跳转
					if(data.code == 1){
						layer.msg(data.msg);
						//表示登录成功
						location.href = "index.do";
					}else{
						//登录失败
						layer.msg(data.msg);
					}
				},"json");
			}
		</script>
	</body>
</html>
