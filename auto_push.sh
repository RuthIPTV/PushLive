#!/bin/sh
STREAM_KEY="${STREAM_KEY:-live}"
VIDEO_DIR="/opt/data/video"
RTMP_URL="rtmp://localhost:1935/hls/$STREAM_KEY"

echo "[INFO] 自动推流脚本启动，监控目录 $VIDEO_DIR"

while true; do
  # 获取当前目录下的所有 mp4 文件
  set -- "$VIDEO_DIR"/*.mp4

  # 如果没有匹配到任何文件
  if [ "$1" = "$VIDEO_DIR/*.mp4" ]; then
    echo "[INFO] 未发现 mp4 文件，5 秒后重新检测"
    sleep 5
    continue
  fi

  # 遍历所有 mp4 文件
  for mp4file in "$@"; do
    echo "[INFO] 正在推流文件: $mp4file"

    ffmpeg -re -i "$mp4file" -c copy -f flv "$RTMP_URL"

    echo "[INFO] 文件 $mp4file 推流完成，3 秒后播放下一个"
    sleep 3
  done

  echo "[INFO] 已完成所有视频文件推流，5 秒后重新开始轮播"
  sleep 5
done
