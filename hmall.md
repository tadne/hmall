# 黑马商城

本项目源自bilibili黑马的springcloud课程项目,黑马商城

## 官方文档
    https://b11et3un53m.feishu.cn/wiki/PsyawI04ei2FQykqfcPcmd7Dnsc

## 架构
    框架: springboot + springcloud + mybatis
    中间件: seata + nacos + sentinel + feign
    数据库: MySQL

## 项目工程目录
    caet-service: 购物车服务
    hm-gateway: 网关
    item-service: 商品服务
    pay-service: 支付服务
    trade-service: 订单服务
    user-service: 用户服务

    hm-common:  共享功能
    hm-api: feign的开放接口

## 启动
    注意! 本项目采用 jdk11, 版本低了启动会报错,版本高了启动后有几处会异常
    本项目组件都是采用docker
    具体的版本大家可以参考上面的官方文档
