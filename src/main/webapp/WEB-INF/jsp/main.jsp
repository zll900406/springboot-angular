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
<script language='javascript' src='<%=path%>/js/angular.min.js'></script>
<title>主界面</title>
<style type="text/css">
th{
text-align: center;
}
</style>
</head>
<body>
<h3>欢迎你，${name}</h3>
<div ng-app="myApp" ng-controller="userCtrl" style="text-align: center;"> 
<button ng-click='query()' class="btn btn-success">查询所有用户</button>
<div id="userinfo" class="container" hidden>
<table class=" table table-hover">
		<thead>
			<tr>
				<th>id</th>
				<th>用户名</th>
				<th>密码</th>
				<th>电话</th>
			</tr>
		</thead>
		<tbody  ng-repeat="u in users"> 
			<tr>
				<td>{{u.id}}</td>
				<td>{{u.name}}</td>
				<td>{{u.pwd}}</td>
				<td>{{u.tel}}</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('userCtrl', function($scope, $http) {
	$scope.query = function() {
		$http({
			method: 'GET',
			url: '/queryAllUser'
		}).then(function successCallback(response) {
				$scope.users = response.data;
				 $("#userinfo").show();
			}, function errorCallback(response) {
				alert('查询失败');
		});
    };
  
});
</script>
</body>
</html>