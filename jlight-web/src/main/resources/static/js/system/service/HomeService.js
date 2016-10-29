homeApp.service('homeService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
            	//用户登录
            	list: function() {
                    var url = _ctx + '/rest/home/list';
                    return baseService.get(url);
                }
            }
        }
]);
