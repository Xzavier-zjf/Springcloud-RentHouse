package com.project.demo.rpc.service;

import com.project.demo.entity.User;
import com.project.demo.rpc.dto.RequestDto;
import com.project.demo.rpc.feignClient.UserRPCFeignClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class UserRPCService {

    @Resource
    UserRPCFeignClient userRPCFeignClient;

    public Map<String, Object> add(Map<String, Object> body) {
        RequestDto requestDto = new RequestDto();
        requestDto.setBody(body);
        return userRPCFeignClient.add(requestDto);
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
        return userRPCFeignClient.set(requestDto);
    }

    public Map<String, Object> delete(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userRPCFeignClient.del(requestDto);
    }

    public Map<String, Object> select(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userRPCFeignClient.obj(requestDto);
    }

    public Map<String, Object> selectToPage(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userRPCFeignClient.getList(requestDto);
    }

    public Map<String, Object> selectToList(Map<String, String> readQuery, Map<String, String> readConfig) {
        RequestDto requestDto = new RequestDto();
        if (readQuery != null) {
            requestDto.setQuery(readQuery);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        return userRPCFeignClient.listGroup(requestDto);
    }

    public Map<String, Object> signUp(User user) {
        RequestDto requestDto = new RequestDto();
        if (user != null) {
            requestDto.setUser(user);
        }
        return userRPCFeignClient.signUp(requestDto);
    }

    public Map<String, Object> forgetPassword(Map<String, String> readConfig, User user) {
        RequestDto requestDto = new RequestDto();
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        if (user != null) {
            requestDto.setUser(user);
        }
        return userRPCFeignClient.forgetPassword(requestDto);
    }

    public Map<String, Object> login(Map<String, String> data) {
        RequestDto requestDto = new RequestDto();
        if (data != null) {
            requestDto.setData(data);
        }
        return userRPCFeignClient.login(requestDto);
    }

    public Map<String, Object> changePassword(Map<String, String> data, Map<String, String> readConfig, Map<String, String> header) {
        RequestDto requestDto = new RequestDto();
        if (data != null) {
            requestDto.setData(data);
        }
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        if (header != null) {
            requestDto.setHeader(header);
        }
        return userRPCFeignClient.changePassword(requestDto);
    }

    public Map<String, Object> state(Map<String, String> readConfig, Map<String, String> header) {
        RequestDto requestDto = new RequestDto();
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        if (header != null) {
            requestDto.setHeader(header);
        }
        return userRPCFeignClient.state(requestDto);
    }

    public Map<String, Object> quit(Map<String, String> readConfig, Map<String, String> header) {
        RequestDto requestDto = new RequestDto();
        if (readConfig != null) {
            requestDto.setConfig(readConfig);
        }
        if (header != null) {
            requestDto.setHeader(header);
        }
        return userRPCFeignClient.quit(requestDto);
    }
}
