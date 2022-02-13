# 自动部署

## 安装项目依赖

    npm install

## 安装pm2

    npm install pm2 -g

## 首次启动

    # 启动开发模式
    pm2 start npm --name dev -- run dev

    # 启动hooks服务
    pm2 start handleHooks.js --name="hooks"

## 访问地址
    [项目地址](http://0.0.0.0:3000/#/home)
    [hooks地址](http://0.0.0.0:9000)
