 var roleApp = angular.module('app', ['formDirective']);
roleApp.controller('ctrl', ['$rootScope', '$scope','baseService',function ($rootScope,$scope,baseService) {
	$scope.requestParam = {};
	var layerIndex;
	//添加或者修改
	$scope.update = function(sign){
		$('#myDicTree').jstree({
		     "core" : {
		         "animation" : 0,
		         "check_callback" : true,
		         "themes" : { },
		         "data" : {
		             "url" : function (node) {
		                 return _ctx+"/dic/getTree";
		             },
		             "data" : function (node) {
		                 return { "id" : node.id };
		             },
		         }},
		     "plugins" : [ "contextmenu","search" ]
		  });
		var titleName = "添加";
		$scope.entity = {};
		if(!sign){
			// 编辑
			titleName = "编辑";
			var idArr =  $.getChkValueArr("subDicChkbox");
			if(idArr && idArr.length==1){
				baseService.post(_ctx+"/dic/detail",idArr[0]).then(function(response){
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
	
	$scope.$on("afterSaveEvent",function(event,data){
		window.location.reload();
	});
	
 }]);