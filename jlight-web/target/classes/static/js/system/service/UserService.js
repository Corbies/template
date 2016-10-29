userApp.service('userService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
              //添加用户
            	addUser: function(user) {
                    var url = _ctx + '/rest/user/add';
                    return baseService.post(url,user);
                },
                //删除用户
                deleteUser: function(json) {
                    var url = _ctx + '/rest/user/delete';
                    return baseService.post(url,json);
                },
                //重置密码
                resetPwd: function(json) {
                    var url = _ctx + '/rest/user/resetPwd';
                    return baseService.post(url,json);
                },
                //编辑用户
                editUser: function(user) {
                    var url = _ctx + '/rest/user/edit';
                    return baseService.post(url,user);
                },
                //用户详细
                detail: function(userId) {
                    var url = _ctx + '/rest/user/detail';
                    return baseService.post(url,userId);
                },
                //角色编号名称映射
                getRoleMap: function() {
                    var url = _ctx + '/rest/role/getRoleMap';
                    return baseService.post(url);
                }
            }
        }
]);
