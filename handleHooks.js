const http = require('http');
const fs = require('fs');
const createHandler = require('gitee-webhook-handler');
const { spawn, exec } = require('child_process');
const handler = createHandler({ path: '/', secret: 'dcweb' })

http.createServer(function (req, res) {
    handler(req, res, function (err) {
        res.statusCode = 200
        res.end('hooks page')
    })
}).listen(9000)

const handleError = (err) => {
    fs.writeFile('./error.log', `${new Date()}： git 日志写入失败 ${err}`, { flag: 'a+' }); 
};

handler.on('Push Hook', function (event) {
    try {
        fs.writeFile(
            './git.log', 
            `${event.payload.head_commit.author.name}  
            ${event.payload.head_commit.timestamp}  
            ${event.payload.head_commit.message}`, 
            { flag: 'a+' }, 
            err => {
                handleError(err); 
            }
        );
        // 执行hooks脚本
        spawn('sh', ['./build.sh'], {})
    }
    catch (err) {
        handleError(err); 
    }
});
