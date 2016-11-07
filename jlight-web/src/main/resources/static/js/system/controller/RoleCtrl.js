 var roleApp = angular.module('roleApp', ['formDirective']);
roleApp.controller('roleCtrl', ['$rootScope', '$scope','baseService','roleService','roleResService',function ($rootScope,$scope,baseService,roleService,roleResService) {
	$scope.requestParam = {};
	var layerIndex;
	//添加或者修改角色
	$scope.updateRole = function(sign){
		var titleName = "添加角色";
		$scope.role = {};
		if(!sign){
			// 编辑
			titleName = "编辑角色";
			var roleIdArr =  $.getChkValueArr("subRoleChkbox");
			if(roleIdArr && roleIdArr.length==1){
				baseService.get(_ctx+"/role/detail?roleId="+roleIdArr[0]).then(function(data){
					$scope.role = data;
					openLayer(titleName);
				});
			}else{
				layer.alert('请选择一个！');
			}
		}else{
			openLayer(titleName);
		}
	
	
	}
	
	function openLayer(titleName){
		layerIndex = layer.open({
			type : 1,
			title : titleName,
			maxmin : true,
			shadeClose : true, //点击遮罩关闭层
			area : [ '600px', '' ],
			content : $('#Add_Roles_style')
		});
	}
	
	$scope.$on("afterSaveEvent",function(event,data){
		if(!data.r){
			layer.close(layerIndex);
		}
	});
	
	$scope.deleteRole = function(){
		var roleIdArr =  $.getChkValueArr("subRoleChkbox");
		if(roleIdArr&&roleIdArr.length>0){
			layer.confirm('是否删除用户角色？', {
				btn : [ '确定', '取消' ]
			}, function() {
				 var json = {"roleIds":roleIdArr.join(",")};
				 var url = _ctx + '/role/delete';
                 baseService.post(url,json).then(function(response){
					layer.msg('删除成功！', {
						time : 1000,
						icon : 1
					},function(){
						window.location.reload();
					});
				},function(){
					
				});
			});
		}else{
			layer.alert('请至少选择一个！');
		}
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
			area : ['250px','500px'],
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