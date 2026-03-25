@echo off
chcp 65001 >nul

echo 1. 가상 환경을 확인 및 설정하는 중입니다...
if not exist venv (
    python -m venv venv
)

echo 2. 가상 환경을 활성화하고 필요한 모듈을 설치합니다...
call venv\Scripts\activate
pip install -r requirements.txt

echo 3. 🧹 혹시 켜져있는 8080(화면) 서버가 있다면 깔끔하게 정리합니다...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8080" ^| find "LISTENING"') do taskkill /f /pid %%a 2>nul

echo 4. 🌐 로컬 웹 서버를 HTTP 프로토콜로 백그라운드에서 실행합니다...
start /B python -m http.server 8080 >nul 2>&1

timeout /t 2 >nul

echo 5. 🖥️ 브라우저에서 웹사이트를 안전한 HTTP로 엽니다...
start chrome http://127.0.0.1:8080

echo 6. 🧠 백엔드 프로그램을 실행합니다...
echo 🛑 (모든 서비스를 완전히 종료하려면, 이 검은색 터미널 창의 우측 상단 [X] 버튼을 눌러서 끄세요!)
echo.
uvicorn server:app --reload