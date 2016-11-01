roleApp.service('roleService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
                //角色详细
                detail: function(roleId) {
                    var url = _ctx + '/role/detail';
                    return baseService.post(url,roleId);
                },
              //角色添加
                add: function(json) {
                    var url = _ctx + '/role/add';
                    return baseService.post(url,json);
                },
              //角色修改
                edit: function(json) {
                    var url = _ctx + '/role/edit';
                    return baseService.post(url,json);
                },
              //角色删除
                deleteRole: function(json) {
                    var url = _ctx + '/role/delete';
                    return baseService.post(url,json);
                }
            }
        }
]);
