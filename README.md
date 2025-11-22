# PushLive

PushLive 是一个基于 Docker 的局域网 RTMP 推流服务，支持将本地视频推流到 Nginx-RTMP，并提供简单的网页界面（默认端口 8080）用于查看效果。通过附带的脚本可实现一键构建与运行，非常适合在局域网中快速搭建推流环境。

## 使用方式

### 1. 下载源码
可以直接下载压缩包并解压，或使用 Git 克隆：
```bash
git clone https://github.com/RuthIPTV/PushLive.git
---
cd PushLive
构建
sudo docker build -t pushlive:latest .
启动 -v 映射视频文件目录
sudo docker run -d \
  --name pushlive\
  -p 8080:8080 \
  -e STREAM_KEY=live \
  -v /opt/docker/pushlive/video:/opt/data/video \
  --restart unless-stopped \
  pushlive:latest
目前h264编码的视频占用小，才用其他方式会导致CPU高占用
浏览器访问
http://<你的IP>:8080
