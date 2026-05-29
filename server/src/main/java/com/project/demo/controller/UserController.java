package com.project.demo.controller;

import com.project.demo.entity.User;
import com.project.demo.service.UserService;

import com.project.demo.controller.base.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * 用户账户：用于保存用户登录信息(User)表控制层
 */
@Slf4j
@RestController
@RequestMapping("user")
public class UserController extends BaseController<User, UserService> {
    /**
     * 服务对象
     */
    @Autowired
    public UserController(UserService service) {
        setService(service);
    }

    /**
     * Token服务

     @Autowired private AccessTokenService tokenService;

     @Autowired private UserGroupService userGroupService;
     */
    /**
     * 注册
     *
     * @param user
     * @return
     */
    @PostMapping("register")
    public Map<String, Object> signUp(@RequestBody User user) {
        if (user == null) {
            user = new User();
        }
        return service.signUpRpc(user);
    }

    /**
     * 找回密码
     *
     * @param form
     * @return
     */
    @PostMapping("forget_password")
    public Map<String, Object> forgetPassword(@RequestBody User form, HttpServletRequest request) {
        Map<String, String> config = service.readConfig(request);
        if (form == null) {
            form = new User();
        }
        return service.forgetPasswordRpc(config, form);
    }

    /**
     * 登录
     *
     * @param data
     * @param httpServletRequest
     * @return
     */
    @PostMapping("login")
    public Map<String, Object> login(@RequestBody Map<String, String> data, HttpServletRequest httpServletRequest) {
        if (data == null) {
            data = new HashMap<>();
        }
        return service.loginRpc(data);
    }

    /**
     * 修改密码
     *
     * @param data
     * @param request
     * @return
     */
    @PostMapping("change_password")
    public Map<String, Object> change_password(@RequestBody Map<String, String> data, HttpServletRequest request) {
        if (data == null) {
            data = new HashMap<>();
        }
        Map<String, String> readConfig = service.readConfig(request);
        Map<String, String> header = new HashMap<>();
        header.put("x-auth-token", request.getHeader("x-auth-token"));
        return service.changePasswordRpc(data, readConfig, header);
    }

    /**
     * 登录态
     *
     * @param request
     * @return
     */
    @GetMapping("state")
    public Map<String, Object> state(HttpServletRequest request) {
        Map<String, String> readConfig = service.readConfig(request);
        Map<String, String> header = new HashMap<>();
        header.put("x-auth-token", request.getHeader("x-auth-token"));
        return service.stateRpc(readConfig, header);
    }

    /**
     * 登录态
     *
     * @param request
     * @return
     */
    @GetMapping("quit")
    public Map<String, Object> quit(HttpServletRequest request) {

        Map<String, String> readConfig = service.readConfig(request);
        Map<String, String> header = new HashMap<>();
        header.put("x-auth-token", request.getHeader("x-auth-token"));
        return service.quitRpc(readConfig, header);
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
