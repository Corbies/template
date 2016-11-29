 var dictApp = angular.module('dictApp', ['formDirective']);
 dictApp.controller('dictCtrl', ['$rootScope', '$scope','baseService',function ($rootScope,$scope,baseService) {
	$scope.requestParam = {};
	var layerIndex;
	//添加或者修改
	$scope.update = function(sign){
		var titleName = "添加";
		$scope.entity = {};
		if(!sign){
			// 编辑
			titleName = "编辑";
			if(idArr && idArr.length==1){
				baseService.post(_ctx+"/dict/detail",idArr[0]).then(function(response){
					$scope.entity = response.data;
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
			content : $('#Add_Dic_style')
		});
	}

	$scope.getParentByMenuId = function(parentId){
        baseService.get(_ctx+"/dict/getByParentId?parentId="+parentId).then(function(data){
            $scope.dictList = data;
        });
	}
	
	$scope.$on("afterSaveEvent",function(event,data){
		window.location.reload();
	});
	
 }]);