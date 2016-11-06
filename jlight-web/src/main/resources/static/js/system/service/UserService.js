userApp.service('userService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
              //添加用户
            	addUser: function(user) {
                    var url = _ctx + '/user/add';
                    return baseService.post(url,user);
                },
                //删除用户
                deleteUser: function(json) {
                    var url = _ctx + '/user/delete';
                    return baseService.post(url,json);
                },
                //重置密码
                resetPwd: function(json) {
                    var url = _ctx + '/user/resetPwd';
                    return baseService.post(url,json);
                },
                //编辑用户
                editUser: function(user) {
                    var url = _ctx + '/user/edit';
                    return baseService.post(url,user);
                },
                //用户详细
                detail: function(userId) {
                    var url = _ctx + '/user/detail';
                    return baseService.post(url,userId);
                },
                //角色编号名称映射
                getRoleMap: function(userId) {
                    var url = _ctx + '/role/getRoleMap';
                    return baseService.post(url,userId);
                },
                //保存角色编号名称映射
                saveUserRole: function(param) {
                    var url = _ctx + '/userRole/add';
                    return baseService.postForm(url,param);
                }
            }
        }
]);
