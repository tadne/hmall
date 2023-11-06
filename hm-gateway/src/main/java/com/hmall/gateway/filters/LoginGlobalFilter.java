package com.hmall.gateway.filters;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.text.AntPathMatcher;
import com.hmall.common.exception.UnauthorizedException;
import com.hmall.gateway.config.AuthProperties;
import com.hmall.gateway.utils.JwtTool;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;
@Component
@RequiredArgsConstructor
public class LoginGlobalFilter implements GlobalFilter , Ordered {

    private final AuthProperties authProperties;

    private final AntPathMatcher antPathMatcher=new AntPathMatcher();

    private final JwtTool jwtTool;
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //获取request
        ServerHttpRequest request = exchange.getRequest();
        //判断请求是否要拦截
        if (isAllowPath(request)){
            return chain.filter(exchange);
        }
        // 获取token
        String token=null;
        List<String> headers = request.getHeaders().get("authorization");
        if (headers!=null){
            token = headers.get(0);
        }
        //要拦截,解析token
        Long userId =null;
        try {
            userId = jwtTool.parseToken(token);
            System.out.println("userId = "+userId);
        }catch (Exception e){
            ServerHttpResponse response = exchange.getResponse();
            response.setRawStatusCode(401);
            return response.setComplete();
        }
        //传递用户到服务
        String userInfo = userId.toString();
        ServerWebExchange exc = exchange.mutate()
                .request(builder -> builder.header("user-info", userInfo))
                .build();
        //放行
        return chain.filter(exc);
    }

    private boolean isAllowPath(ServerHttpRequest request) {
        boolean flag=false;
       // String method=request.getMethodValue();
        String path=request.getPath().toString();
        for (String excludePath : authProperties.getExcludePaths()) {
            if (antPathMatcher.match(excludePath,path)){
                flag=true;
                break;
            }
        }
        return flag;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
