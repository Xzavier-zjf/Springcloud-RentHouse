package com.project.demo.service;

import com.project.demo.entity.User;
import com.project.demo.rpc.service.UserRPCService;
import com.project.demo.service.base.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 用户账户：用于保存用户登录信息(User)表服务接口
 *
 */
@Service
public class UserService extends BaseService<User> {
    @Resource
    UserRPCService userRPCService;

    public Map<String, Object> insertRPC(Map<String, Object> body) {
        Map<String, Object> result = userRPCService.add(body);
        return result;
    }

    public Map<String, Object> updateRPC(Map<String, String> readQuery, Map<String, String> readConfig, Map<String, Object> readBody) {
        Map<String, Object> result = userRPCService.update(readQuery,  readConfig,  readBody);
        return result;
    }

    public Map<String, Object> deleteRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userRPCService.delete( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userRPCService.select( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectToPageRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userRPCService.selectToPage( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectToListRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userRPCService.selectToList( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> signUpRpc(User user) {
        Map<String, Object> result = userRPCService.signUp(user);
        return result;
    }

    public Map<String, Object> forgetPasswordRpc(Map<String, String> readConfig,User user) {
        Map<String, Object> result = userRPCService.forgetPassword(readConfig,user);
        return result;
    }

    public Map<String, Object> loginRpc(Map<String, String> data) {
        Map<String, Object> result = userRPCService.login(data);
        return result;
    }

    public Map<String, Object> changePasswordRpc(Map<String, String> data, Map<String, String> readConfig, Map<String, String> header) {
        Map<String, Object> result = userRPCService.changePassword(data,readConfig,header);
        return result;
    }

    public Map<String, Object> stateRpc(Map<String, String> readConfig, Map<String, String> header) {
        Map<String, Object> result = userRPCService.state(readConfig,header);
        return result;
    }

    public Map<String, Object> quitRpc(Map<String, String> readConfig, Map<String, String> header) {
        Map<String, Object> result = userRPCService.quit(readConfig,header);
        return result;
    }
}


