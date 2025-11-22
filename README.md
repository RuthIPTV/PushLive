# PushLive

PushLive 是一个基于 Docker 的局域网 RTMP 推流服务，支持将本地视频推流到 Nginx-RTMP，并提供简单的网页界面（默认端口 8080）用于查看效果。通过附带的脚本可实现一键构建与运行，非常适合在局域网中快速搭建推流环境。

## 使用方式

### 1. 下载源码
可以直接下载压缩包并解压，或使用 Git 克隆：
```bash
git clone https://github.com/RuthIPTV/PushLive.git
---
赋予脚本执行权限
```bash
chmod +x test.sh
构建并启动，脚本会自动停止旧容器、删除旧镜像、重新构建镜像并启动新的 PushLive 服务
```bash
sudo ./test.sh
在浏览器打开： 即可查看网页界面效果
```bash
http://<你的IP>:8080
### 已知问题
由于是镜像里的ffmpeg是精简版本，无法调用硬件来编码，所有推流的视频最好是h264编码的视频，否则CPU占用极高
