package com.project.demo.rpc.fallback;

import java.util.HashMap;
import java.util.Map;

public class FallbackErrorReturn {

    public static Map<String, Object> error(Integer code, String message) {
        Map<String, Object> map = new HashMap<>();
        map.put("error", new HashMap<String, Object>(4) {{
            put("code", code);
            put("message", message);
        }});
        return map;
    }

}
