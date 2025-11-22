FROM alfg/nginx-rtmp

# 拷贝配置文件，网页播放器
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/static/

# 拷贝推流脚本
COPY auto_push.sh /usr/local/bin/auto_push.sh
RUN chmod +x /usr/local/bin/auto_push.sh

# 启动脚本，后台启动推流脚本再启动nginx
CMD /bin/sh /usr/local/bin/auto_push.sh & nginx -g "daemon off;"
