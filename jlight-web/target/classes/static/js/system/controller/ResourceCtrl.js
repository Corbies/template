var resourceApp = angular.module('resourceApp', ['base']);
resourceApp.filter('trustHtml', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input);
    }
});
resourceApp.controller('resourceCtrl', ['$rootScope', '$scope','resourceService',function ($rootScope,$scope,resourceService) {
	$scope.requestParam = {};
	
	$scope.resourceType = [{typeId: '0', name: "菜单"}, {typeId: '1', name: "按钮"}];
	
	$scope.subResources = [];
	
	$scope.resource = {};
	
	//添加、修改菜单
	$scope.updateResource = function(sign){
		var selectArray = $("#Res_list tbody input:checked");
		if(!selectArray || (selectArray.length!=1 && sign==0)){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var titleName = selectArray && selectArray.length>0 ? '修改角色':'添加角色';
		var resId =  $(selectArray[0]).val();
		$scope.getResourceMap();
		if(resId && sign==0){
			$scope.subResources = [];
			resourceService.detail(resId).then(function(response){
				var res = response.data;
				if(res){
					$scope.resource = res;
					$scope.resource.type = res.type.toString();
				}
			},function(response){
				
			});
		}else{
			$scope.resource = {
				isShow :1,
				type:'0',
				parentId : '0'
			};
			$scope.subResources = [];
		}
		layer.open({
			type : 1,
			title : titleName,
			shadeClose : true, //点击遮罩关闭层
			area : [ '500px', '440px' ],
			content : $('#Adding_menu'),
			btn : [ '保存', '关闭' ],
			yes : function(index, layero) {
				var str = "";
				if(!resId){
					$(".addtext").each(function(n) {
						if ($(this).val() == "") {
							layer.alert(str += ""+ $(this).attr("name")+ "不能为空！\r\n", {
								title : '提示框',
								icon : 0,
							});
							return;

						} 
					});
				}
				//菜单编号为空时，则为添加菜单;否则为编辑菜单
				var resource = $scope.resource;
				if(!resource.name || !resource.isShow){
					layer.alert("信息不完整,请重新填写！\r\n", {
						title : '提示框',
						icon : 0,
					});
					return;
				}
				if(!resId){
					if($scope.resource.type == 1 && $scope.subResourcesId){
						$scope.resource.parentId = $scope.subResourceId;
					}
					resourceService.addResource(resource).then(function(response){
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
					resourceService.editResource(resource).then(function(response){
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
		});
	}
	
	//删除菜单
	$scope.deleteResource = function(){
		var selectArray = $("#Res_list tbody input:checked");
		if(!selectArray || selectArray.length==0){
			layer.alert('请选择一个！', {
				title : '提示框',
				icon : 1,
			});
			return;
		}
		var resIds = new Array();
		$.each(selectArray,function(i,e){
			var val = $(this).val();
			resIds.push(val);
		});
		if(resIds.lenght==0){
			return;
		}
		layer.confirm('是否删除菜单？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			var json = {'resIds':resIds.toString()};
			resourceService.deleteResource(json).then(function(response){
				layer.msg('删除成功！', {
					time : 1000,
					icon : 1
				},function(){
					window.location.reload();
				});
			},function(){
				layer.msg('删除失败！', {
					time : 1000,
					icon : 1
				});
			});
		});
}
	//动态改变URL输入框内容
	$scope.isShowChange = function(isTitle){
		if(isTitle){
			$scope.menu.url = '';
		}
	}
	
	$scope.getResourceMap = function(){
		resourceService.getResourceMap().then(function(response){
			$scope.resourceMap = response.data;
		},function(response){
			
		});
	}
	
	//
	$scope.updateSubRes = function(){
		var parentId = $scope.resource.parentId;
		if(!parentId){
			$scope.subResource = [];
			return;
		}
		resourceService.getSubMenusByParentId(parentId).then(function(response){
			var subResource = response.map;
			if(subResource && subResource.length>0){
				$scope.subResId = subResource[0].menuId;
			}
			$scope.subResource = response.map;
		},function(){
			
		});
	}
	
	$scope.selectAll = function($event){
		var target = $event.target
		if($(target).prop("checked")){
			$(".subResChkBox").each(function(i,e){
				$(this).attr("checked",true);
			});
		}else{
			$(".subResChkBox").each(function(i,e){
				$(this).attr("checked",false);
			});
		}
	}
 }]);