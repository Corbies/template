roleApp.service('roleService', ['$http', '$q', 'baseService',
        function($http, $q, baseService) {
            return {
                //角色详细
                detail: function(roleId) {
                    var url = _ctx + '/rest/role/detail';
                    return baseService.post(url,roleId);
                },
              //角色添加
                add: function(json) {
                    var url = _ctx + '/rest/role/add';
                    return baseService.post(url,json);
                },
              //角色修改
                edit: function(json) {
                    var url = _ctx + '/rest/role/edit';
                    return baseService.post(url,json);
                },
              //角色删除
                deleteRole: function(json) {
                    var url = _ctx + '/rest/role/delete';
                    return baseService.post(url,json);
                }
            }
        }
]);
