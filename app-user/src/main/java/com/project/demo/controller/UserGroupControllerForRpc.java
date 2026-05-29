package com.project.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.project.demo.controller.base.BaseRpcController;
import com.project.demo.dto.RequestDto;
import com.project.demo.entity.UserGroup;
import com.project.demo.service.UserGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.Query;
import java.util.List;
import java.util.Map;

/**
 * 用户组：用于用户前端身份和鉴权(UserGroup)表控制层
 *
 */
@RestController
@RequestMapping("user_group_rpc")
public class UserGroupControllerForRpc extends BaseRpcController<UserGroup, UserGroupService> {
    /**
     * 服务对象
     */
    @Autowired
    public UserGroupControllerForRpc(UserGroupService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(@RequestBody RequestDto requestDto) {
        Map<String, Object> body = requestDto.getBody();
        body.put("password",service.encryption(String.valueOf(body.get("password"))));
        service.insert(body);
        return success(1);
    }

    @PostMapping("/set")
    @Transactional
    public Map<String, Object> set(@RequestBody RequestDto requestDto) {
        service.update(requestDto.getQuery(), requestDto.getConfig(), requestDto.getBody());
        return success(1);
    }


    @PostMapping(value = "/del")
    @Transactional
    public Map<String, Object> del(@RequestBody RequestDto requestDto) {
        service.delete(requestDto.getQuery(), requestDto.getConfig());
        return success(1);
    }

    @PostMapping("/get_obj")
    public Map<String, Object> obj(@RequestBody RequestDto requestDto) {
        Query select = service.select(requestDto.getQuery(), requestDto.getConfig());
        List resultList = select.getResultList();
        if (resultList.size() > 0) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("obj", resultList.get(0));
            return success(jsonObject);
        } else {
            return success(null);
        }
    }

    @PostMapping("/get_list")
    public Map<String, Object> getList(@RequestBody RequestDto requestDto) {
        Map<String, Object> map = service.selectToPage(requestDto.getQuery(), requestDto.getConfig());
        return success(map);
    }

    @PostMapping("/list_group")
    public Map<String, Object> listGroup(@RequestBody RequestDto requestDto) {
        Map<String, Object> map = service.selectToList(requestDto.getQuery(), requestDto.getConfig());
        return success(map);
    }
}


