package com.lew.jlight.web.service.impl;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;

import com.lew.jlight.core.Response;
import com.lew.jlight.core.page.Page;
import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.mybatis.ParamFilter;
import com.lew.jlight.web.dao.RoleDao;
import com.lew.jlight.web.dao.UserDao;
import com.lew.jlight.web.dao.UserRoleDao;
import com.lew.jlight.web.entity.Role;
import com.lew.jlight.web.entity.User;
import com.lew.jlight.web.entity.UserRole;
import com.lew.jlight.web.service.UserService;
import com.lew.jlight.web.util.DigestUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public Response listUser(ParamFilter<String, String> param) {
        Response response = new Response();
        Page page = param.getPage();
        List<Map<String, Object>> list = userDao.findMap("getList", param, page);
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        if (list != null && list.size() > 0) {
            for (Map<String, Object> map : list) {
                String userId = (String) map.get("userId");
                List<String> roleIds = userRoleDao.findColumn("getRoleIdByUserId", String.class, userId);
                StringBuilder buidler = new StringBuilder();
                for (int i = 0, size = roleIds.size(); i < size; i++) {
                    String roleName = roleDao.findOneColumn("getRoleNameByRoleId", String.class, roleIds.get(i));
                    if (i == size - 1) {
                        buidler.append(roleName);
                    } else {
                        buidler.append(roleName + "、");
                    }
                }
                map.put("roleName", buidler.toString());
                resultList.add(map);
            }
        }

        Integer resultCount = userDao.findOneColumn("getCount", Integer.class, param);
        page.setResultCount(resultCount);

        response.setPage(page);
        response.setData(resultList);
        return response;
    }

    @Override
    public Response updateDefaultPwd(String userIds) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(userIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }
        String[] idArray = userIds.split(",");

        for (String userId : idArray) {
            User user = userDao.findUnique("getByUserId", userId);
            if (user == null) {
                response.setCode(Response.NOT_FOUND);
                response.setMsg("用户不存在");
                return response;
            }
        }
        for (String userId : idArray) {
            String defaultPwd = DigestUtil.sha256().digest("123456");
            Map<String, String> paramMap = Maps.newHashMapWithExpectedSize(2);
            paramMap.put("defaultPwd", defaultPwd);
            paramMap.put("userId", userId);
            userDao.update("updateDefaultPwd", paramMap);
        }
        return response;
    }

    @Override
    public Response updateUser(String roleIds, User user) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        String[] roleIdArry = roleIds.split(",");
        if (BeanUtil.isEmpty(roleIdArry)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }

        if (user == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户对象不能为空");
            return response;
        }

        String userId = user.getUserId();
        // 删除原有角色
        userRoleDao.update("deleteUserRoleByUserId", userId);
        boolean isExist = true;
        for (String roleId : roleIdArry) {
            Role role = roleDao.findUnique("getRoleByRoleId", roleId);
            if (role == null) {
                isExist = false;
                break;
            }
        }
        if (!isExist) {
            response.setMsg("角色信息不存在");
            return response;
        }

        User model = userDao.findUnique("getByUserId", userId);
        if (model == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("用户信息不存在");
            return response;
        }

        for (String roleId : roleIdArry) {
            UserRole userRole = new UserRole();
            userRole.setRoleId(roleId);
            userRole.setIsDelete(BigInteger.ZERO.intValue());
            userRole.setCreateTime(new Date());
            userRole.setUpdateTime(new Date());
            userRole.setUserId(userId);

            userRoleDao.save("addUserRole", userRole);
        }

        String oldPwd = user.getPassword();
        if (model.getPassword().equals(oldPwd)) {
            user.setPassword(oldPwd);
        } else {
            user.setPassword(DigestUtil.sha256().digest(oldPwd));
        }
        Map<String, Object> params = Maps.newHashMap();
        params.put("account", user.getAccount());
        params.put("password", user.getPassword());
        params.put("mobile", user.getMobile());
        params.put("email", user.getEmail());
        params.put("trueName", user.getTrueName());
        params.put("isLock", user.getIsLock());
        params.put("userId", user.getUserId());

        userDao.update("updateUser", params);

        return response;
    }

    @Override
    public Response addUser(String roleIds, User user) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(roleIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }
        String[] roleIdsToUse = roleIds.split(",");
        if (BeanUtil.isEmpty(roleIdsToUse)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("角色编号不能为空");
            return response;
        }
        if (user == null) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户信息不能为空");
            return response;
        }
        boolean isExist = true;
        for (String roleIdToUse : roleIdsToUse) {
            Role role = roleDao.findUnique("getRoleByRoleId", roleIdToUse);
            if (role == null) {
                isExist = false;
                break;
            }
        }

        if (!isExist) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("用户对象不存在");
            return response;
        }

        String account = user.getAccount();
        User model = userDao.findUnique("getByAccount", account);
        if (model != null) {
            response.setCode(Response.EXSIED);
            response.setMsg("用户对象已存在");
            return response;
        }

        String password = user.getPassword();
        password = DigestUtil.sha256().digest(password);
        Date createTime = new Date();
        user.setIsDelete(BigInteger.ZERO.intValue());
        user.setCreateTime(createTime);
        user.setUpdateTime(createTime);
        user.setErrorCount(BigInteger.ZERO.intValue());
        user.setUserId("2");
        user.setPassword(password);

        userDao.save("addUser", user);
        for (String roleId : roleIdsToUse) {
            UserRole userRole = new UserRole();
            userRole.setRoleId(roleId);
            userRole.setIsDelete(BigInteger.ZERO.intValue());
            userRole.setCreateTime(createTime);
            userRole.setUpdateTime(createTime);
            userRole.setUserId(user.getUserId());

            userRoleDao.save("addUserRole", userRole);
        }
        return response;
    }

    @Override
    public Response updatePwd(String oldPwd, String confirmPwd, String newPwd, String userId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(userId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }

        if (Strings.isNullOrEmpty(oldPwd)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("旧密码不能为空");
            return response;
        }
        if (Strings.isNullOrEmpty(newPwd)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("新密码不能为空");
            return response;
        }
        if (Strings.isNullOrEmpty(confirmPwd)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("确认密码不能为空");
            return response;
        }

        if (!newPwd.equals(confirmPwd)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("新密码与确认密码不一致");
            return response;
        }

        User user = userDao.findUnique("getByUserId", userId);
        if (user == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("用户对象不存在");
            return response;
        }

        if (!user.getPassword().equals(DigestUtil.sha256().digest(oldPwd))) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("原密码不正确");
            return response;
        }

        String newPassword = DigestUtil.sha256().digest(newPwd);
        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("newPassword", newPassword);
        paramMap.put("userId", userId);
        userDao.update("updatePwd", paramMap);

        return response;
    }

    @Override
    public Response deleteUser(String userIds) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(userIds)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }

        String[] idArray = userIds.split(",");
        for (String userId : idArray) {
            User user = userDao.findUnique("getByUserId", userId);
            if (user == null) {
                response.setCode(Response.NOT_FOUND);
                response.setMsg("用户对象不存在");
                return response;
            }
        }

        for (String userId : idArray) {
            userDao.update("deleteByUserId", userId);
            userRoleDao.update("deleteUserRoleByUserId", userId);
        }
        return response;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Response getUserDetail(String userId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(userId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }

        Map<String, Object> resultMap = Maps.newHashMap();
        Map<String, Object> userMap = userDao.findOneColumn("getUserDetail", Map.class, userId);
        if (userMap == null) {
            response.setCode(Response.NOT_FOUND);
            response.setMsg("用户对象不存在");
            return response;
        }

        List<String> roleIds = userRoleDao.findColumn("getRoleIdByUserId", String.class, userId);

        resultMap.put("user", userMap);
        resultMap.put("roleIds", roleIds);
        response.setData(resultMap);
        return response;
    }

    @Override
    public Response getUserByUserId(String userId) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(userId)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("用户编号不能为空");
            return response;
        }
        User user = userDao.findUnique("getByUserId", userId);
        response.setData(user);

        return response;
    }

    @Override
    public Response getUserByAccount(String account) {
        Response response = new Response();
        if (Strings.isNullOrEmpty(account)) {
            response.setCode(Response.INVALID_PARAM);
            response.setMsg("帐号不能为空");
            return response;
        }
        User user = userDao.findUnique("getByAccount", account);
        response.setData(user);

        return response;
    }

}
