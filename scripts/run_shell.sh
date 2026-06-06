#!/bin/bash
set -e
IMAGE_NAME="whalswo/team15_project:0.2.0"
cd "$(dirname "$0")/.."
echo "============================================"
echo "  Farm Village Simulator — Dev Shell (VNC)"
echo "============================================"
echo "브라우저로 접속: http://localhost:6080/vnc.html"
echo "쉘에서 게임 실행: /workspace/build/main"
echo "============================================"
echo ""
docker run -it --rm \
  --platform linux/amd64 \
  -p 5900:5900 \
  -p 6080:6080 \
  -v "$(pwd)":/workspace \
  --name farm-sim-container \
  "$IMAGE_NAME" \
  bash -c "
    Xvfb :1 -screen 0 1920x1080x24 &
    sleep 1
    x11vnc -display :1 -forever -nopw -rfbport 5900 -quiet &
    sleep 1
    websockify --web=/usr/share/novnc 6080 localhost:5900 &
    sleep 1
    export DISPLAY=:1
    export LIBGL_ALWAYS_SOFTWARE=1
    export LD_LIBRARY_PATH=/usr/local/lib:\$LD_LIBRARY_PATH
    echo '[브라우저] http://localhost:6080/vnc.html 로 접속하세요'
    exec bash
  "
