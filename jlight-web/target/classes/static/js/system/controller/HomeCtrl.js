var homeApp = angular.module('homeApp', ['base']);
homeApp.controller('homeCtrl', ['$rootScope', '$window','$scope','homeService',function ($rootScope,$window,$scope,homeService) {
	
	homeService.list().then(function(response){
		$scope.infoMap = response.data;
	},function(){
		
	});
	
 }]);
