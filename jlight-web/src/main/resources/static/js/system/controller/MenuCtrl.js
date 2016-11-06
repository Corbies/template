var resourceApp = angular.module('resourceApp', ['formDirective']);
resourceApp.filter('trustHtml', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input);
    }
});
resourceApp.controller('resourceCtrl', ['$scope','baseService',function ($scope,baseService) {
	$scope.resourceType = [{typeId: 0, name: "菜单"}, {typeId: 1, name: "按钮"}];
	$scope.resource = {};
	$scope.getByMenuId = function(menuId){
		baseService.get(_ctx+"/menu/detail?menuId="+menuId).then(function(data){
			$scope.resource = data;
		});
	}
	
	$scope.$on("afterSaveEvent",function(event,data){
		if(!data.r){
			layer.close(layerIndex);
		}
		currentNode.state.selected = false;
		$.jstree.reference("#jstree").refresh();
	});
 }]);