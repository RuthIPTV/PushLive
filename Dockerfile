FROM jasonrivers/nginx-rtmp:latest 

ENV TZ=Asia/Shanghai
# 拷贝配置文件，网页播放器
COPY nginx.conf /opt/nginx/conf/
COPY index.html /www/static/

# 拷贝推流脚本
COPY push.sh /usr/local/bin/push.sh
RUN chmod +x /usr/local/bin/push.sh \
    && rm -rf /media/* && rm -rf /run.sh && mkdir -p /opt/data/hls 
RUN echo "https://mirror.nju.edu.cn/alpine/v3.14/main" > /etc/apk/repositories && \
    echo "https://mirror.nju.edu.cn/alpine/v3.14/community" >> /etc/apk/repositories

RUN apk add --no-cache ffmpeg tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo "$TZ" > /etc/timezone

# 启动脚本，后台启动推流脚本再启动nginx
CMD /bin/sh /usr/local/bin/push.sh & /opt/nginx/sbin/nginx -g "daemon off;"
