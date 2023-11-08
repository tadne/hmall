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
    在hm-common的resources目录中,有对应nacos配置文件和数据库配置文件
    spring-configuration-metadata.json文件可以配置需要的默认ip和端口等信息
    不过我在每个模块的配置中都写了实际的ip...,懒的改hhh,不过是私网ip
    你只要把每个地方的ip都改掉,改成你部署的组件的ip即可

    注意! 本项目采用 jdk11, 版本低了启动会报错,版本高了启动后有几处会运行时异常
    本项目外部组件除了sentinel,其他都采用docker部署,当然,你可以怎么高兴怎么来
    具体的版本大家可以参考上面的官方文档

    每个可启动工程有四个yaml文件,其中bootstrap文件是用来负责引入nacos配置,
    dev和local可以任选或不配置,使用时需指定,
    application.yaml可以配置数据库名,其他的看个人

        可以注意到项目没有官方文档的Redis和ElasticSearch,就是没写hh,不过最近不打算搞,过段时间补上
