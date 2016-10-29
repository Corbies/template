var indexApp = angular.module('indexApp', ['base']);
indexApp.controller('indexCtrl', ['$rootScope', '$scope','indexService',function ($rootScope,$scope,indexService) {
	//查询侧边栏菜单
	indexService.getLeftRes().then(function(response){
		$scope.resourceList = response.data;
		$scope.subResources = $scope.resourceList['resources'];
	},function(response){

	});
	
	//退出登录
	$scope.logout = function(){
	   layer.confirm('是否确定退出系统？', {
		   btn: ['是','否'] 
		}, function(){
		  location.href= _ctx + "/rest/logout";
		 });
	}
	
	//修改密码
	$scope.changePwd = function(){
		layer.open({
		type: 1,
		title:'修改密码',
		area: ['300px','300px'],
		shadeClose: true,
		content: $('#change_Pass'),
		btn:['确认修改'],
		yes:function(index, layero){	
			   if ($("#password").val()==""){
				  layer.alert('原密码不能为空!',{
		          title: '提示框',				
					icon:0,
				 });
				return false;
		      } 
			  if ($("#Nes_pas").val()==""){
				  layer.alert('新密码不能为空!',{
		          title: '提示框',				
					icon:0,
				 });
				return false;
		      } 
			  if ($("#c_mew_pas").val()==""){
				  layer.alert('确认新密码不能为空!',{
		          title: '提示框',				
					icon:0,
				 });
				return false;
		      }
			    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
		    		{
			            layer.alert('密码不一致!',{
			              title: '提示框',				
							icon:0,
						 });
						 return false;
		    	}   
			 else{	
				  var json = $scope.code;
				  if(!json){
					  return;
				  }
				  indexService.changePwd(json).then(function(){
					  layer.alert('修改成功！',{
				           title: '提示框',				
							icon:1,		
						  }); 
				       layer.close(index);    
				  },function(){
					  
				  });
			 }	 
			}
		    });
	}
 }]);