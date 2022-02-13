# 停止服务
pm2 stop dev
# 进入项目
cd ../dc-web
# 拉取代码
output=`git pull`
# 删除依赖
rm -rf node_modules
# 安装依赖
output=`npm install`
# 打包
# npm run build
# 启动服务
pm2 start dev

# 首次启动
# 启动开发模式
# pm2 start npm --name dev -- run dev
# 启动hooks服务
# pm2 start handleHooks.js --name="hooks"
