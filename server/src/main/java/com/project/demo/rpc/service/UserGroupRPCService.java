package com.project.demo.rpc.service;

import com.project.demo.rpc.dto.RequestDto;
import com.project.demo.rpc.feignClient.UserGroupRPCFeignClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class UserGroupRPCService {

    @Resource
    UserGroupRPCFeignClient userGroupRPCFeignClient;

    public Map<String, Object> add(Map<String, Object> body) {
        RequestDto requestDto = new RequestDto();
        requestDto.setBody(body);
        return userGroupRPCFeignClient.add(requestDto);
    }

    public Map<String, Object> update(Map<String, String> readQuery, Map<String, String> readConfig, Map<String, Object> readBody) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        if (readBody != null) {
            requestDto.setBody(readBody);
        }
        return userGroupRPCFeignClient.set(requestDto);
    }

    public Map<String, Object> delete(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userGroupRPCFeignClient.del(requestDto);
    }

    public Map<String, Object> select(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userGroupRPCFeignClient.obj(requestDto);
    }

    public Map<String, Object> selectToPage(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userGroupRPCFeignClient.getList(requestDto);
    }

    public Map<String, Object> selectToList(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userGroupRPCFeignClient.listGroup(requestDto);
    }
}
