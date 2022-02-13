# 停止服务
# pm2 stop dev
# 进入项目
cd ../dc-web
# 拉取代码
output=`git pull`
# 删除依赖
rm -rf node_modules
# 安装依赖
output=`npm install`
# 打包项目
output=`npm run build`
# 拷贝文件 
# TODO: 改为动态变量，源路径和目标路径
/bin/cp -rf /home/centos/dev/dc-web/dist/* /www/wwwroot/rinkeby.reex.io/
# 启动服务
pm2 start dev

# 首次启动
# 启动开发模式
# pm2 start npm --name dev -- run dev
# 启动hooks服务
# pm2 start handleHooks.js --name="hooks"
