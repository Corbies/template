var loginApp = angular.module('loginApp', ['base']);
loginApp.controller('loginCtrl', ['$rootScope', '$window','$scope','loginService',function ($rootScope,$window,$scope,loginService) {
	//系统登录
	$scope.login = function(){
		var loginUser = $scope.user;
		if(!loginUser){
			return;
		}
		loginService.doLogin(loginUser).then(function () {
			$window.location.href  =  _ctx + "/index.jsp";
		},function(response){
			$scope.errorMsg = response.msg;
		});
	};
	//enter事件
	$scope.enterKeyup = function(e){
         var keycode = window.event?e.keyCode:e.which;
         if(keycode==13){
             $scope.login();
         }
     };
 }]);
