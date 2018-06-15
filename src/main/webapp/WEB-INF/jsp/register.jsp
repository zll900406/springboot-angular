<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">@IMPORT url("<%=path%>/css/bootstrap.min.css");</style>
<script language='javascript' src='<%=path%>/js/jquery-3.1.0.js'></script>
<script language='javascript' src='<%=path%>/js/bootstrap.js'></script>
<title>注册</title>
<script type="text/javascript">
$(function(){
	var ok1=false;
	var ok2=false;
	var ok3=false;
	var ok4=false;
	 $("form").submit(function(){
		
		var name=$('input[name="name"]').val();
		var pwd=$('input[name="pwd"]').val();
		var pwd2=$('input[name="pwd2"]').val();
		var tel=$('input[name="tel"]').val();

		if(name!=''){
			ok1=true;	
		}
		if(pwd!='' && pwd2!=''){
			ok2=true;	
		}
		if(pwd==pwd2){
			ok3=true;	
		}
         if(tel!=''){
             ok4=true;
         }
		if(ok1 && ok2 && ok3 && ok4){
		$('form').submit();
		}else{
			if(!ok1){ alert("用户名不能为空！"); return false;}
			if(!ok2){ alert("密码不能为空！"); return false;}
			if(!ok3){ alert("两次密码不一致！"); return false;}
			if(!ok4){ alert("电话不能为空！"); return false;}
			return false; 
		}
	});	         
	});
</script>
</head>
<body>
 ${msg}
<div align="center">
<form action="addUser" method="post">
<div class="row" style="margin-top:50px;text-align:center">
<div class="col-md-6" >
<div class="well col-md-8 col-lg-offset-8">
	<h3>用户注册</h3>
    <div class="input-group" style="margin-top:5px;">
          <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
          <input type="text" name="name" class="form-control" placeholder="用户名" aria-describedby="sizing-addon1">
    </div>
    <div class="input-group" style="margin-top:5px;">
          <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>
          <input type="password" name="pwd" class="form-control" placeholder="密码" aria-describedby="sizing-addon1">
    </div>
    <div class="input-group" style="margin-top:5px;">
          <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>
          <input type="password" name="pwd2" class="form-control" placeholder="确认密码" aria-describedby="sizing-addon1">
    </div>
    <div class="input-group" style="margin-top:5px;">
        <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
        <input type="text" name="tel" class="form-control" placeholder="手机号" aria-describedby="sizing-addon1">
    </div>
    
    <div style="text-align:center;margin-top:10px;">
    <button type="submit" class="btn btn-success">
                                                 &nbsp;&nbsp;注&nbsp;&nbsp;  册&nbsp;&nbsp;
    </button> 
    <button type="button" onclick="javascript:history.go(-1)" class="btn btn-success">
                                               &nbsp;&nbsp;返&nbsp;&nbsp;  回&nbsp;&nbsp;
    </button> 
    </div>
</div>
</div> 
</div>
</form>
</div>
</body>
</html>