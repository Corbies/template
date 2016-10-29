indexApp.service('indexService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
                // 主页左边菜单栏
            	getLeftRes: function() {
                    var url = _ctx + '/rest/resources/left';
                    return baseService.get(url);
                },
                //主页右侧更改密码
                changePwd: function(json) {
                    var url = _ctx + '/rest/user/changePwd';
                    return baseService.post(url,json);
                }
            }
        }
]);
