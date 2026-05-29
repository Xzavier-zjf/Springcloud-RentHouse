package com.project.demo.service;

import com.project.demo.entity.UserGroup;
import com.project.demo.rpc.service.UserGroupRPCService;
import com.project.demo.rpc.service.UserRPCService;
import com.project.demo.service.base.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 用户组：用于用户前端身份和鉴权(UserGroup)表服务接口
 *
 */
@Service
public class UserGroupService extends BaseService<UserGroup> {
    @Resource
    UserGroupRPCService userGroupRPCService;

    public Map<String, Object> insertRPC(Map<String, Object> body) {
        Map<String, Object> result = userGroupRPCService.add(body);
        return result;
    }

    public Map<String, Object> updateRPC(Map<String, String> readQuery, Map<String, String> readConfig, Map<String, Object> readBody) {
        Map<String, Object> result = userGroupRPCService.update(readQuery,  readConfig,  readBody);
        return result;
    }

    public Map<String, Object> deleteRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userGroupRPCService.delete( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userGroupRPCService.select( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectToPageRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userGroupRPCService.selectToPage( readQuery,  readConfig);
        return result;
    }

    public Map<String, Object> selectToListRPC(Map<String, String> readQuery, Map<String, String> readConfig) {
        Map<String, Object> result = userGroupRPCService.selectToList( readQuery,  readConfig);
        return result;
    }
}


