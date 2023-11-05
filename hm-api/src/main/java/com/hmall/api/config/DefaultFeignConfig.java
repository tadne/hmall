package com.hmall.api.config;

import com.hmall.api.Interceptor.UserInfoInterceptor;
import com.hmall.api.client.ItemClient;
import com.hmall.api.client.fallback.ItemClientFallbackFactory;
import feign.Logger;
import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;

public class DefaultFeignConfig {
    @Bean
    public Logger.Level feignLoggerLevel(){
        return Logger.Level.FULL;
    }

    @Bean
    public RequestInterceptor requestInterceptor(){
        return new UserInfoInterceptor();
    }

    @Bean
    public ItemClientFallbackFactory fallbackFactory(){
        return new ItemClientFallbackFactory();
    }

}
