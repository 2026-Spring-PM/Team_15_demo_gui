# 301동 탈출하기 — Farm Village Simulator

> Team 15 | Programming Methodology Spring 2026

---

## 게임 소개

**301동 탈출하기**는 서울대학교 301동에 갇힌 플레이어가 **졸업 요건을 달성해 탈출**하는 2D 탑-다운 농장 시뮬레이터입니다.

농사·채집·요리·제작·동물 포획·상점 등 다양한 활동을 통해 아이템과 골드를 모으고, 레벨을 올려 졸업 조건을 충족시키세요. 도중에는 재해·NPC 등 무작위 이벤트가 발생해 플레이어를 방해합니다.

### 핵심 기능

| 분류 | 내용 |
|------|------|
| **농업** | 씨앗 구매 → 파종(삽) → 물주기(물병) → 수확 / 산에서 나무 벌목·채집 |
| **축산** | 동물 포획 후 우리 배치, 먹이 주기, 알 수집 |
| **요리** | 조리대에서 재료 조합, 체력 회복 음식 제작 |
| **제작/강화** | 조합대(Crafting)·용광로(Forge)·숫돌(Whetstone)로 도구·무기 제작 및 강화 |
| **상점** | 도구 상점·씨앗 상점·식료품 상점·도서관(버프 북) 이용 |
| **레벨 시스템** | EXP 획득 → 레벨업 → 졸업 요건 달성 시 클리어 |
| **랜덤 이벤트** | 재해(DisasterSystem), NPC 침입, 슬롯머신(지하실) |
| **3개 구역** | 1층(메인 농장), 산(벌목·채집), 지하실(슬롯머신·감옥) |

---

## 조작법

| 키 | 동작 |
|----|------|
| `W / A / S / D` | 상/좌/하/우 이동 |
| `Space` | 농사 작업 (파종·수확·물주기 등) |
| `E` (근처 오브젝트) | 상점·침대·우리·조리대·제작대 등 상호작용 |
| `I` | 인벤토리 열기 |
| `R` | 도전과제 확인 |
| `1 ~ 9` | 핫바 슬롯 선택 |
| `ESC` | UI 닫기 / 일시정지 |

---

## 실행 방법 (Docker 사용)

### 요구사항
- Docker가 설치된 **Linux** 환경 (WSL2 포함)
- X11 디스플레이 서버 (Linux 기본 제공 / Windows: WSLg 또는 VcXsrv)

### 1단계 — 저장소 클론

```bash
git clone https://github.com/2026-Spring-PM/Team_15_demo.git
cd Team_15_demo
```

### 2단계 — Docker 이미지 빌드 (처음 한 번만)

```bash
bash docker/docker_build.sh
```

> 인터넷 연결 필요. 약 1~2분 소요.

### 3단계 — 게임 실행

```bash
bash scripts/run.sh
```

`run.sh`가 Docker 컨테이너를 자동으로 시작하고 게임을 실행합니다.

---

## 실행 방법 (Docker 없이 — Linux에서 직접 빌드)

```bash
# SFML 설치
sudo apt-get install libsfml-dev

# 실행
./build/main
```

---

## 디렉토리 구조

```
Team_15_demo/
├── build/
│   └── main          # 컴파일된 실행 파일
├── assets/           # 이미지·폰트 리소스
├── docker/
│   ├── Dockerfile
│   └── docker_build.sh
├── scripts/
│   └── run.sh
└── README.md
```

---

## 트러블슈팅

**화면이 열리지 않는 경우 (WSL2)**
```bash
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
bash scripts/run.sh
```

**`xhost` 관련 오류**
```bash
xhost +local:docker
bash scripts/run.sh
```
