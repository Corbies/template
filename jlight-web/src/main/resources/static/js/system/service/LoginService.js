loginApp.service('loginService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
            	//用户登录
            	doLogin: function(loginUser) {
                    var url = _ctx +"/doLogin";
                    return baseService.postForm(url,loginUser);
                }
            }
        }
]);
