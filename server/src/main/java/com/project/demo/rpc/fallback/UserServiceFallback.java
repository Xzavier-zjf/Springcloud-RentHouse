package com.project.demo.rpc.fallback;

import com.project.demo.rpc.dto.RequestDto;
import com.project.demo.rpc.feignClient.UserRPCFeignClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Hystrix针对方法进行降级的三种方式
 * 1.使用注解@HystrixCommand(fallbackMethod = "debitFallbackMethod")指定降级的方法
 * 降级方法名字和入参全部跟RPC方法一样，可在入参最后加入Throwable throwable 得到Hystrix封装后的Exception
 * <p>
 * 如果使用@HystrixCommand方式指定降级的方法，那么即使
 * * feign:
 * *   hystrix:
 * *     enabled: false
 * * RPC调用的时候也会使用Hystrix的线程池hystrix-StorageService-2，而不是http-nio-8085-exec-4
 * <p>
 * 缺点：
 * 无法得到被RPC调用的服务到底抛出了什么方法。
 * throwable.fillInStackTrace()会显示
 * com.netflix.hystrix.exception.HystrixRuntimeException: AccountFeignClient#debit(String,Double) failed and no fallback available.
 * <p>
 * <p>
 * 2.新建类AccountServiceFallback  implements AccountFeignClient 在里面些每个方法的降级
 * 使用注解@FeignClient(value = "app-account",fallback = AccountServiceFallback.class)
 * 缺点：
 * 无法得到throwable，RPC调用的throwable得不到，且Hystrix封装后的异常都得不到
 * <p>
 * 3.本方式
 */
@Component
@Slf4j
public class UserServiceFallback implements FallbackFactory<UserRPCFeignClient> {

    @Override
    public UserRPCFeignClient create(Throwable throwable) {

        return new UserRPCFeignClient() {
            @Override
            public Map<String, Object> add(RequestDto requestDto) {
                /**
                 * 这里就能看到account的debit方法被调用里面抛出了除以0的异常
                 *
                 * */
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中add方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.add fallback");
                return result;
            }

            @Override
            public Map<String, Object> set(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中set方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.set fallback");
                return result;
            }

            @Override
            public Map<String, Object> del(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中del方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.del fallback");
                return result;
            }

            @Override
            public Map<String, Object> obj(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中obj方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.obj fallback");
                return result;
            }

            @Override
            public Map<String, Object> getList(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中getList方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.getList fallback");
                return result;
            }

            @Override
            public Map<String, Object> listGroup(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中listGroup方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.listGroup fallback");
                return result;
            }

            @Override
            public Map<String, Object> signUp(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中signUp方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.signUp fallback");
                return result;
            }

            @Override
            public Map<String, Object> forgetPassword(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中forgetPassword方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.forgetPassword fallback");
                return result;
            }

            @Override
            public Map<String, Object> login(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中login方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.login fallback");
                return result;
            }

            @Override
            public Map<String, Object> changePassword(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中changePassword方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.changePassword fallback");
                return result;
            }

            @Override
            public Map<String, Object> state(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中state方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.state fallback");
                return result;
            }

            @Override
            public Map<String, Object> quit(RequestDto requestDto) {
                if (throwable != null) {
                    log.error("UserRPCFeignClient 中quit方法降级", throwable);
                }
                Map<String, Object> result = FallbackErrorReturn.error(30001,"UserRPCFeignClient.quit fallback");
                return result;
            }
        };
    }
}

