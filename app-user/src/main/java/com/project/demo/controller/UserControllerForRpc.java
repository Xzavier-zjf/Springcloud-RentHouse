package com.project.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.project.demo.controller.base.BaseController;
import com.project.demo.controller.base.BaseRpcController;
import com.project.demo.dto.RequestDto;
import com.project.demo.entity.AccessToken;
import com.project.demo.entity.User;
import com.project.demo.entity.UserGroup;
import com.project.demo.service.AccessTokenService;
import com.project.demo.service.UserGroupService;
import com.project.demo.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 用户账户：用于保存用户登录信息(User)表控制层
 */
@Slf4j
@RestController
@RequestMapping("user_rpc")
public class UserControllerForRpc extends BaseRpcController<User, UserService> {
    /**
     * 服务对象
     */
    @Autowired
    public UserControllerForRpc(UserService service) {
        setService(service);
    }

    /**
     * Token服务
     */
    @Autowired
    private AccessTokenService tokenService;

    @Autowired
    private UserGroupService userGroupService;

    /**
     * 注册
     * @param requestDto
     * @return
     */
    @PostMapping("register")
    public Map<String, Object> signUp(@RequestBody RequestDto requestDto) {
        User user = requestDto.getUser();

        // 查询用户
        Map<String, String> query = new HashMap<>();
        query.put("username",user.getUsername());
        List list = service.select(query, new HashMap<>()).getResultList();
        if (list.size()>0){
            return error(30000, "用户已存在");
        }
        user.setUserId(null);
        user.setPassword(service.encryption(user.getPassword()));
        service.save(user);
        return success(1);
    }

    /**
     * 找回密码
     * @param requestDto
     * @return
     */
    @PostMapping("forget_password")
    public Map<String, Object> forgetPassword(@RequestBody RequestDto requestDto) {
        User form = requestDto.getUser();
        Map<String, String> config = requestDto.getConfig();

        JSONObject ret = new JSONObject();
        String username = form.getUsername();
        String code = form.getCode();
        String password = form.getPassword();
        // 判断条件
        if(code == null || code.length() == 0){
            return error(30000, "验证码不能为空");
        }
        if(username == null || username.length() == 0){
            return error(30000, "用户名不能为空");
        }
        if(password == null || password.length() == 0){
            return error(30000, "密码不能为空");
        }

        // 查询用户
        Map<String, String> query = new HashMap<>();
        query.put("username",username);
        Query select = service.select(query, config);
        List list = select.getResultList();
        if (list.size() > 0) {
            User o = (User) list.get(0);
            JSONObject query2 = new JSONObject();
            JSONObject form2 = new JSONObject();
            // 修改用户密码
            query2.put("user_id",o.getUserId());
            form2.put("password",service.encryption(password));
            service.update(query, config, form2);
            return success(1);
        }
        return error(70000,"用户不存在");
    }

    /**
     * 登录
     * @param requestDto
     * @return
     */
    @PostMapping("login")
    public Map<String, Object> login(@RequestBody RequestDto requestDto) {
        log.info("[执行登录接口]");
        Map<String, String> data = requestDto.getData();


        String username = data.get("username");
        String email = data.get("email");
        String phone = data.get("phone");
        String password = data.get("password");

        List resultList = null;
        Map<String, String> map = new HashMap<>();
        if(username != null && "".equals(username) == false){
            map.put("username", username);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }
        else if(email != null && "".equals(email) == false){
            map.put("email", email);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }
        else if(phone != null && "".equals(phone) == false){
            map.put("phone", phone);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }else{
            return error(30000, "账号或密码不能为空");
        }
        if (resultList == null || password == null) {
            return error(30000, "账号或密码不能为空");
        }
        //判断是否有这个用户
        if (resultList.size()<=0){
            return error(30000,"用户不存在");
        }

        User byUsername = (User) resultList.get(0);


        Map<String, String> groupMap = new HashMap<>();
        groupMap.put("name",byUsername.getUserGroup());
        List groupList = userGroupService.select(groupMap, new HashMap<>()).getResultList();
        if (groupList.size()<1){
            return error(30000,"用户组不存在");
        }

        UserGroup userGroup = (UserGroup) groupList.get(0);

        //查询用户审核状态
        if (!StringUtils.isEmpty(userGroup.getSourceTable())){
            String sql = "select examine_state from "+ userGroup.getSourceTable() +" WHERE user_id = " + byUsername.getUserId();
            String res = String.valueOf(service.runCountSql(sql).getSingleResult());
            if (res==null){
                return error(30000,"用户不存在");
            }
            if (!res.equals("已通过")){
                return error(30000,"该用户审核未通过");
            }
        }

        //查询用户状态
        if (byUsername.getState()!=1){
            return error(30000,"用户非可用状态，不能登录");
        }

        String md5password = service.encryption(password);
        if (byUsername.getPassword().equals(md5password)) {
            // 存储Token到数据库
            AccessToken accessToken = new AccessToken();
            accessToken.setToken(UUID.randomUUID().toString().replaceAll("-", ""));
            accessToken.setUser_id(byUsername.getUserId());
            tokenService.save(accessToken);

            // 返回用户信息
            JSONObject user = JSONObject.parseObject(JSONObject.toJSONString(byUsername));
            user.put("token", accessToken.getToken());
            JSONObject ret = new JSONObject();
            ret.put("obj",user);
            return success(ret);
        } else {
            return error(30000, "账号或密码不正确");
        }
    }

    /**
     * 修改密码
     * @param requestDto
     * @return
     */
    @PostMapping("change_password")
    public Map<String, Object> change_password(@RequestBody RequestDto requestDto){
        Map<String, String> header = requestDto.getHeader();
        Map<String, String> config = requestDto.getConfig();
        Map<String, String> data = requestDto.getData();

        // 根据Token获取UserId
        String token = header.get("x-auth-token");
//        String token = request.getHeader("x-auth-token");
        Integer userId = tokenGetUserId(token);
        // 根据UserId和旧密码获取用户
        Map<String, String> query = new HashMap<>();
        String o_password = data.get("o_password");
        query.put("user_id" ,String.valueOf(userId));
        query.put("password" ,service.encryption(o_password));
        Query ret = service.count(query, config);
        List list = ret.getResultList();
        Object s = list.get(0);
        int count = Integer.parseInt(list.get(0).toString());
        if(count > 0){
            // 修改密码
            Map<String,Object> form = new HashMap<>();
            form.put("password",service.encryption(data.get("password")));
            service.update(query,config,form);
            return success(1);
        }
        return error(10000,"密码修改失败！");
    }

    /**
     * 登录态
     * @param requestDto
     * @return
     */
    @PostMapping("state")
    public Map<String, Object> state(@RequestBody RequestDto requestDto) {
        Map<String, String> header = requestDto.getHeader();
        Map<String, String> config = requestDto.getConfig();

        JSONObject ret = new JSONObject();
        // 获取状态
        String token = header.get("x-auth-token");
//        String token = request.getHeader("x-auth-token");

        // 根据登录态获取用户ID
        Integer userId = tokenGetUserId(token);

        log.info("[返回userId] {}",userId);
        if(userId == null || userId == 0){
            return error(10000,"用户未登录!");
        }

        // 根据用户ID获取用户
        Map<String,String> query = new HashMap<>();
        query.put("user_id" ,String.valueOf(userId));

        // 根据用户ID获取
        Query select = service.select(query,config);
        List resultList = select.getResultList();
        if (resultList.size() > 0) {
            JSONObject user = JSONObject.parseObject(JSONObject.toJSONString(resultList.get(0)));
            user.put("token",token);
            ret.put("obj",user);
            return success(ret);
        } else {
            return error(10000,"用户未登录!");
        }
    }

    /**
     * 登录态
     * @param requestDto
     * @return
     */
    @PostMapping("quit")
    public Map<String, Object> quit(@RequestBody RequestDto requestDto) {
        Map<String, String> header = requestDto.getHeader();
        Map<String, String> config = requestDto.getConfig();

        String token = header.get("x-auth-token");
//        String token = request.getHeader("x-auth-token");
        JSONObject ret = new JSONObject();
        Map<String, String> query = new HashMap<>(16);
        query.put("token", token);
        try{
            tokenService.delete(query,config);
        }catch (Exception e){
            e.printStackTrace();
        }
        return success("退出登录成功！");
    }

    /**
     * 获取登录用户ID
     * @param token
     * @return
     */
    public Integer tokenGetUserId(String token) {
        log.info("[获取的token] {}",token);
        // 根据登录态获取用户ID
        if(token == null || "".equals(token)){
            return 0;
        }
        Map<String, String> query = new HashMap<>(16);
        query.put("token", token);
        AccessToken byToken = tokenService.findOne(query);
        if(byToken == null){
            return 0;
        }
        return byToken.getUser_id();
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
