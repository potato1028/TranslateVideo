@echo off
echo 1. 가상 환경을 확인 및 설정하는 중입니다...
if not exist venv (
    python -m venv venv
)

echo 2. 가상 환경을 활성화하고 필요한 모듈을 설치합니다...
call venv\Scripts\activate
pip install -r requirements.txt

echo 3. 프로그램을 실행합니다...
uvicorn server:app --reload

pause