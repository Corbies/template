indexApp.service('indexService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
                //主页右侧更改密码
                changePwd: function(json) {
                    var url = _ctx + '/rest/user/changePwd';
                    return baseService.post(url,json);
                }
            }
        }
]);
