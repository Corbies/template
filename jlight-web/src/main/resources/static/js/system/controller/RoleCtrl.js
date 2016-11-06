 var roleApp = angular.module('roleApp', ['base']);
roleApp.controller('roleCtrl', ['$rootScope', '$scope','baseService','roleService','roleResService',function ($rootScope,$scope,baseService,roleService,roleResService) {
	$scope.requestParam = {};
	
	//添加或者修改角色
	$scope.updateRole = function(sign){
		var selectArray = $("#Role_list tbody input:checked");
		if(!selectArray || (selectArray.length!=1 && sign==0)){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var titleName = selectArray && selectArray.length>0 ? '修改角色':'添加角色';
		var roleId =  $(selectArray[0]).val();
		if(roleId && sign==0){
			roleService.detail(roleId).then(function(response){
				$scope.role = response.data;
			},function(response){
				
			});
		}else{
			$scope.role='';
		}
		layer.open({
			type : 1,
			title : titleName,
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ '600px', '' ],
			content : $('#Add_Roles_style'),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				var num = 0;
				var str = "";
			$("#Add_Roles_style input[type$='text']").each(function(n) {
				if ($(this).val() == "") {
					layer.alert(str += ""
							+ $(this).attr("name")
							+ "不能为空！\r\n", {
						title : '提示框',
						icon : 0,
					});
					num++;
					return false;
				}
				});
				if (num > 0) {
					return false;
				} else {
					var json = $scope.role;
					if(!json){
						return;
					}
					if(!roleId){
						roleService.add(json).then(function(response){
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
						roleService.edit(json).then(function(response){
							layer.alert('修改成功！', {
								title : '提示框',
								icon : 1,
							},function(){
								window.location.reload();
							});
							layer.close(index);
						},function(response){
							layer.alert(response.msg, {
								title : '提示框',
								icon : 0,
							});
						});
					}
				}
			}
		});
	}
	
	$scope.deleteRole = function(){
		var selectArray = $("#Role_list tbody input:checked");
		if(!selectArray || selectArray.length==0){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var roleIds = new Array();
		$.each(selectArray,function(i,e){
			var val = $(this).val();
			roleIds.push(val);
		});
		if(roleIds.lenght==0){
			return;
		}
		layer.confirm('是否删除用户角色？', {
			btn : [ '确定', '取消' ]
		}, function() {
			var json = {"roleIds":roleIds.toString()};
			roleService.deleteRole(json).then(function(response){
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
	
	$scope.assignPerission = function(){
		var selectArray = $("#Role_list tbody input:checked");
		if(!selectArray || selectArray.length!=1){
			layer.alert('请选择一个！');
			return;
		}
		var roleId =  $(selectArray[0]).val();
		var roleMenuIds = [];
		//获取角色对应的资源
		baseService.get(_ctx+"/roleMenu/getMenuByRole?roleId="+roleId).then(function(data){
			roleMenuIds = data;
			// 显示树
			showCheckboxTree( _ctx+"/menu/listTree?roleId="+roleId,"tree",roleMenuIds);
			openMenuTree(roleId);
		});
	}
	
	function openMenuTree(roleId){
		layer.open({
			type : 1,
			title : '资源权限',
			shadeClose : true, //点击遮罩关闭层
			offset:["20px"],
			area : ['250px','400px'],
			content : $('#Assigned_Roles_style'),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				var resIds = getCheckboxTreeSelNode("tree");
				var json = {'roleId':roleId,'resIds':resIds};
				baseService.post(_ctx+"/roleMenu/add",json).then(function(response){
					layer.alert('保存成功！');
					layer.close(index);
				});
			}
		});
	}
	
 }]);