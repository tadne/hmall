package com.hmall.api.Interceptor;

import com.hmall.api.client.UserClient;
import com.hmall.common.utils.UserContext;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.stereotype.Component;


public class UserInfoInterceptor implements RequestInterceptor {
    @Override
    public void apply(RequestTemplate requestTemplate) {
        Long userId = UserContext.getUser();
        if (userId!=null) {
            requestTemplate.header("user-info", userId.toString());
        }
    }
}
