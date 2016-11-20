var menuApp = angular.module('menuApp', ['formDirective']);
menuApp.filter('trustHtml', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input);
    }
});
menuApp.controller('menuCtrl', ['$scope','baseService',function ($scope,baseService) {
	$scope.menuType = [{typeId: 0, name: "菜单"}, {typeId: 1, name: "按钮"}];
	$scope.menu = {};
	$scope.menus = [];
	$scope.getByMenuId = function(menuId){
		baseService.get(_ctx+"/menu/detail?menuId="+menuId).then(function(data){
				$scope.menu = data;
		});
	}

	$scope.getParentByMenuId = function(menuId){
		baseService.get(_ctx+"/menu/getByParentId?parentId="+menuId).then(function(data){
				$scope.menus = data;
		});
	}

	$scope.deleteByMenuId = function(menuId){
		baseService.post(_ctx+"/menu/delete",{menuIds:menuId}).then(function(data){
			$.jstree.reference("#jstree").refresh();
		});
	}

	$scope.$on("afterSaveEvent",function(event,data){
		if(!data.r){
			currentNode.state.selected = true;
			$scope.getParentByMenuId(currentNode.id);
			layer.close(layerIndex);
		}
		currentNode.state.selected = false;
		$.jstree.reference("#jstree").refresh();
	});
 }]);

