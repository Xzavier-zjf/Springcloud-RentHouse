package com.project.demo.controller.base;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.project.demo.service.base.BaseService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 */
@Slf4j
public class BaseRpcController<E, S extends BaseService<E>> {

    @Setter
    protected S service;

    public Map<String, Object> success(Object o) {
        Map<String, Object> map = new HashMap<>();
        if (o == null) {
            map.put("result", null);
            return map;
        }
        if (o instanceof List) {
            if (((List) o).size() == 1) {
               o =  ((List) o).get(0);
                map.put("result", o);
            }else {
                String jsonString = JSONObject.toJSONString(o);
                JSONArray objects = service.covertArray(JSONObject.parseArray(jsonString));
                map.put("result", objects);
            }
        } else if (o instanceof Integer || o instanceof String) {
            map.put("result", o);
        } else {
            String jsonString = JSONObject.toJSONString(o);
            JSONObject jsonObject = JSONObject.parseObject(jsonString);
            JSONObject j = service.covertObject(jsonObject);
            map.put("result", j);
        }
        return map;
    }

    public Map<String, Object> error(Integer code, String message) {
        Map<String, Object> map = new HashMap<>();
        map.put("error", new HashMap<String, Object>(4) {{
            put("code", code);
            put("message", message);
        }});
        return map;
    }
}
