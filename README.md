# AI 유튜브 자막 생성기 (AI YouTube Subtitle Generator)

사용자가 입력한 유튜브 URL의 오디오를 분석하여, **Gemini 2.5 Flash API**를 통해 맞춤형 한국어 자막을 생성하고 영상 위에 실시간으로 동기화하여 띄워주는 로컬 웹 서비스입니다.

### 데모 영상
<div align="center">
  <a href="https://youtu.be/OVYMIWnl-uA">
    <img src="https://img.youtube.com/vi/OVYMIWnl-uA/maxresdefault.jpg" alt="AI 유튜브 자막 생성기 데모 영상" width="800">
  </a>
  <br>
  <sup>이미지를 클릭하면 데모 영상이 재생됩니다.</sup>
</div>

## 주요 기능 (Key Features)

* **유튜브 영상 실시간 자막 오버레이**
  * YouTube IFrame API를 활용하여, 영상의 현재 재생 시간(currentTime)에 맞춰 AI가 생성한 자막을 화면 하단에 정확하게 동기화합니다.
* **Gemini 2.5 Flash 기반 문맥 맞춤형 번역**
  * `yt-dlp`를 이용해 영상의 오디오를 추출하고, Gemini API를 호출하여 높은 퀄리티의 한국어 번역 및 요약 자막을 생성합니다.
* **사용자 맞춤형 '번역 테마' 시스템**
  * 사용자가 "2D 플랫포머 게임 개발", "IT 기기 리뷰" 등 특정 테마를 입력하면, 백엔드에서 프롬프트를 동적으로 조작하여 해당 도메인에 맞는 자연스러운 전문 용어와 문맥으로 번역을 수행합니다.
* **서버 리소스 및 파일 최적화**
  * 보안 및 스토리지 최적화를 위해, 오디오 추출 및 API 전송이 완료된 즉시 로컬 임시 파일과 구글 스토리지의 파일을 자동 삭제하도록 설계했습니다.
* **pip 모드**
  * pip모드에서도 자막을 볼 수 있게끔 Document PIP API를 사용하여 pip모드에서도 자막을 볼 수 있습니다.

## 기술 스택 (Tech Stack)

* **Backend:** Python 3, FastAPI, yt-dlp, Google GenAI SDK
* **Frontend:** HTML5, CSS3, Vanilla JavaScript, YouTube IFrame API
* **Environment:** macOS, Uvicorn, Local HTTP Server

## 실행 방법 (Getting Started)

본 프로젝트는 사용자의 편의를 위해 복잡한 환경 설정 없이 **스크립트 실행 한 번으로 가상 환경 세팅, 필수 모듈 설치, 서버 구동이 자동으로 진행**되도록 구성되어 있습니다.

### 1. 프로젝트 다운로드 (Clone)
먼저 프로젝트를 로컬 컴퓨터로 다운로드하고 해당 폴더로 이동합니다.
```bash
git clone [https://github.com/potato1028/TranslateVideo.git](https://github.com/potato1028/TranslateVideo.git)
cd TranslateVideo
🪟 Windows 사용자

프로젝트 폴더 내에 있는 run.bat 파일을 더블 클릭하여 실행합니다.

또는 터미널(명령 프롬프트)에서 아래 명령어를 입력합니다.
run.bat

🍎 Mac / 🐧 Linux 사용자

터미널을 열고 아래 명령어를 입력하여 스크립트에 실행 권한을 부여한 뒤 실행합니다.
chmod +x run.sh
./run.sh

2. 프론트엔드 접속
백엔드 서버가 정상적으로 실행된 상태에서, 브라우저를 열고 프로젝트 폴더 내의 index.html 파일을 열거나 로컬 웹 서버를 통해 접속하여 서비스를 이용할 수 있습니다.
```
