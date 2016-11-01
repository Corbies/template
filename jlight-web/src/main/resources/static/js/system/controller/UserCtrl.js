var userApp = angular.module('userApp', ['base']);
userApp.controller('userCtrl', ['$rootScope', '$scope','userService',function ($rootScope,$scope,userService) {
	
	$('#multiselect').multiselect({});
	//搜索参数
	$scope.requestParam = {};
	$scope.role = {	};
	$scope.isLockMap = [{isLock: '0', name: "启用"}, {isLock: '1', name: "停用"}];
	//添加用户,1为添加，0为修改
	$scope.updateUser = function(sign){
		var selectArray = $("#User_list tbody input:checked");
		if(!selectArray || (selectArray.length!=1 && sign==0)){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var titleName = selectArray && selectArray.length>0 ? '修改用户':'添加用户';
		var userId = $(selectArray[0]).val();
		$scope.getRoleMap();
		if(userId && sign==0){
			userService.detail(userId).then(function(response){
				var isLock = response.data.user.isLock;
				response.data.user.isLock = isLock.toString();
				$scope.user = response.data.user;
				$scope.roleIds = response.data.roleIds;
				var includeRolesMap = [];
				var excludeRolesMap = [];
				$.each($scope.roleMap,function(i,e){
					var roleId = e.roleId;
					if($scope.roleIds.indexOf(roleId)>=0){
						var roleObj = {'roleId':roleId,'name':e.name};
						includeRolesMap.push(roleObj);
					}else{
						var roleObj = {'roleId':roleId,'name':e.name};
						excludeRolesMap.push(roleObj);
					}
				});
				$scope.roleMap = excludeRolesMap;
				$scope.includeRoleMap =includeRolesMap;
			},function(response){
				
			});
		}else{
			$scope.user = {
					isLock :'0'
			};
		}
		layer.open({
			type : 1,
			title : titleName,
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ '576px', '468px' ],
			content : $('#Add_user_style'),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				if ($("#name").val() == "") {
					layer.alert('登录用户名不能为空!', {
						title : '提示框',
						icon : 0,
					});
					return false;
				}
				if ($("#password").val() == "") {
					layer.alert('密码不能为空!', {
						title : '提示框',
						icon : 0,
					});
					return false;
				}
				if ($("#select_Roles").val() == "") {
					layer.alert('用角色不能为空!', {
						title : '提示框',
						icon : 0,
					});
					return false;
				}
				if ($("#phone").val() == "") {
					layer.alert('电话号码不能为空!', {
						title : '提示框',
						icon : 0,

					});
					return false;
				}
				if ($("#user_name").val() == "") {
					layer.alert('用户名不能为空!', {
						title : '提示框',
						icon : 0,
					});
					return false;
				}
				if ($("#select_status").val() == "") {
					layer.alert('用户状态能为空!', {
						title : '提示框',
						icon : 0,
					});
					return false;
				} else {
					var user = $scope.user;
					var roleIds = [];
					$("#multiselect_to option").each(function(i,e){
						var selectVal = $(this).val();
						roleIds.push(selectVal);
					});
					if(!user || roleIds.length==0){
						layer.msg('角色不能为空,必须选择！', {
							time : 1000,
							icon : 1
						});
						return;
					}
					user.isLock = parseInt(user.isLock);
					var json = {'user':user,'roleIds':roleIds.toString()};
					if(!userId){
						userService.addUser(json).then(function(response){
							layer.alert('添加成功！', {
								title : '提示框',
								icon : 1,
							},function(){
								window.location.reload();
							});
							layer.close(index);
						},function(response){

						});
					}else{
						userService.editUser(json).then(function(response){
							layer.alert('修改成功！', {
								title : '提示框',
								icon : 1,
							},function(){
								window.location.reload();
							});
							layer.close(index);
						},function(response){

						});
					}
				}
			}
		});
	}
	//重置密码
	$scope.resetPwd =function(){
		var selectArray = $("#User_list tbody input:checked");
		if(!selectArray || selectArray.length==0){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var userIds = new Array();
		$.each(selectArray,function(i,e){
			var val = $(this).val();
			userIds.push(val);
		});
		if(userIds.lenght==0){
			return;
		}
		layer.confirm('是否重置密码，重置后原密码将失效？', {
			btn : [ '重置', '取消' ]
		//按钮
		}, function() {
			var json = {"userIds" : userIds.toString()};
			userService.resetPwd(json).then(function(response){
				layer.msg('重置成功！', {
					time : 1000,
					icon : 1
				});
			},function(response){
				
			});
		});
	}
	
	//删除用户
	$scope.deleteUser = function(){
		var selectArray = $("#User_list tbody input:checked");
		if(!selectArray || selectArray.length==0){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var userIds = new Array();
		$.each(selectArray,function(i,e){
			var val = $(this).val();
			userIds.push(val);
		});
		if(userIds.lenght==0){
			return;
		}
		layer.confirm('是否删除用户？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			var json = {"userIds":userIds.toString()};
			userService.deleteUser(json).then(function(){
				layer.msg('删除成功！', {
					time : 1000,
					icon : 1
				},function(){
					window.location.reload();
				});
			},function(){
				
			});
		});
	}
	
	$scope.getRoleMap = function(){
		userService.getRoleMap().then(function(response){
			$scope.roleMap = response.data;
		},function(response){
			
		});
	}
	
	$scope.selectAll = function($event){
		var target = $event.target
		if($(target).prop("checked")){
			$(".subUserChkbox").each(function(i,e){
				$(this).attr("checked",true);
			});
		}else{
			$(".subUserChkbox").each(function(i,e){
				$(this).attr("checked",false);
			});
		}
	}
 }]);