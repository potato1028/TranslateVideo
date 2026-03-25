#!/bin/bash

echo "1. 가상 환경을 확인 및 설정하는 중입니다..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

echo "2. 가상 환경을 활성화하고 필요한 모듈을 설치합니다..."
source venv/bin/activate
pip install -r requirements.txt

echo "3. 🌐 로컬 웹 서버를 HTTP 프로토콜로 실행합니다..."
python3 -m http.server 8080 &
FRONTEND_PID=$!

trap "echo -e '\n🛑 모든 서버를 완전히 종료합니다...'; kill $FRONTEND_PID 2>/dev/null; exit" INT TERM EXIT

sleep 2

echo "4. 🖥️ 브라우저에서 웹사이트를 안전한 HTTP로 엽니다..."
open -a "Google Chrome" http://127.0.0.1:8080

echo "5. 🧠 백엔드 프로그램을 실행합니다..."
uvicorn server:app --reload