@echo off
echo 1. 가상 환경을 확인 및 설정하는 중입니다... [cite: 1]
if not exist venv (
    python -m venv venv
) [cite: 1]

echo 2. 가상 환경을 활성화하고 필요한 모듈을 설치합니다... [cite: 1]
call venv\Scripts\activate [cite: 1]
pip install -r requirements.txt [cite: 1]

echo 3. 로컬 웹 서버와 브라우저를 실행합니다...
# 프론트엔드 서버를 별도 창으로 띄우고 브라우저를 엽니다.
start python -m http.server 8080
start http://localhost:8080

echo 4. 백엔드 프로그램을 실행합니다...
uvicorn server:app --reload [cite: 1]

pause [cite: 1]