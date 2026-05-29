package com.project.demo.interceptor;


import lombok.extern.slf4j.Slf4j;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    private final String tokenName = "x-auth-token";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(this.tokenName);

        log.info("[请求接口] - {} , [请求类型] - {}",request.getRequestURL().toString(),request.getMethod());
        if (request.getRequestURL().toString().contains("/api/user/login")){
            return true;
        }
        else if (request.getRequestURL().toString().contains("/api/user/state")){
            return true;
        }
        else if (request.getRequestURL().toString().contains("/api/user/register")){
            return true;
        }
//        if (token == null || "".equals(token)){
//            if ("POST".equals(request.getMethod())){
//                return false;
//            }else {
//                return true;
//            }
//        }else {
            return true;
//        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        //更新token
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
