package com.project.demo.controller;

import com.project.demo.entity.UserGroup;
import com.project.demo.service.UserGroupService;

import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 用户组：用于用户前端身份和鉴权(UserGroup)表控制层
 */
@RestController
@RequestMapping("user_group")
public class UserGroupController extends BaseController<UserGroup, UserGroupService> {
    /**
     * 服务对象
     */
    @Autowired
    public UserGroupController(UserGroupService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String, Object> paramMap = service.readBody(request.getReader());
        Map<String, Object> stringObjectMap = service.insertRPC(paramMap);
        return stringObjectMap;
    }

    @PostMapping("/set")
    @Transactional
    public Map<String, Object> set(HttpServletRequest request) throws IOException {
        return service.updateRPC(service.readQuery(request), service.readConfig(request), service.readBody(request.getReader()));
    }


    @RequestMapping(value = "/del")
    @Transactional
    public Map<String, Object> del(HttpServletRequest request) {
        return service.deleteRPC(service.readQuery(request), service.readConfig(request));
    }

    @RequestMapping("/get_obj")
    public Map<String, Object> obj(HttpServletRequest request) {
        Map<String, Object> stringObjectMap = service.selectRPC(service.readQuery(request), service.readConfig(request));
        return stringObjectMap;
    }


    @RequestMapping("/get_list")
    public Map<String, Object> getList(HttpServletRequest request) {
        Map<String, Object> map = service.selectToPageRPC(service.readQuery(request), service.readConfig(request));
        return map;
    }

    @RequestMapping("/list_group")
    public Map<String, Object> listGroup(HttpServletRequest request) {
        Map<String, Object> map = service.selectToListRPC(service.readQuery(request), service.readConfig(request));
        return map;
    }
}


