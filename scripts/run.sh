#!/bin/bash
set -e

IMAGE_NAME="whalswo/team15_project:0.1.0"

cd "$(dirname "$0")/.."

echo "============================================"
echo "  Farm Village Simulator — VNC Mode"
echo "============================================"
echo "VNC 서버가 시작됩니다. 아래 방법으로 접속하세요:"
echo ""
echo "  Mac:   Finder → 이동 → 서버에 연결 → vnc://localhost:5900"
echo "  Linux: vncviewer localhost:5900"
echo "  기타:  VNC 클라이언트에서 localhost:5900 입력"
echo ""
echo "게임이 종료되면 컨테이너도 자동으로 종료됩니다."
echo "============================================"
echo ""

docker run -it --rm \
  --platform linux/amd64 \
  -p 5900:5900 \
  -v "$(pwd)":/workspace \
  --name farm-sim-container \
  "$IMAGE_NAME" \
  bash -c "
    Xvfb :1 -screen 0 1280x720x24 &
    sleep 1
    x11vnc -display :1 -forever -nopw -rfbport 5900 -quiet &
    sleep 1
    echo '[VNC] 서버 준비 완료. vnc://localhost:5900 으로 접속하세요.'
    DISPLAY=:1 LIBGL_ALWAYS_SOFTWARE=1 /workspace/build/main
  "
