# Awake - Drowsiness Prevention System
### 1. 프로젝트 소개
#### 1.1. 개발배경 및 필요성

> 전체 운전자의 90% 이상이 졸음운전을 경험했다고 한다. 또한 실제 자차를 운용하고 있는 어웨이크 팀장의 경우에도 졸음운전으로 인해 위험했던 순간이 한두번이 아니었지만, 막상 우리주변에는 졸음운전을 해결할 수 있는 솔루션이 존재하지 않는다는 점에서 졸음운전에 관심을 가지게 되었다.
> 실제 통계결과를 보았을 경우에도 졸음운전으로 인한 고속도로 사망률은 전체의 70% 이상이었으며, 전국 교통사고로 인한 사회적 비용도 27조원 수준이었다. 졸음운전으로 인한 사고율을 1%만 낮추어도 약 1조원의 사회적 비용 절감효과를 가져올 수 있다는 점에서 졸음운전을 문제로 인식하고 해결하고자 하게 되었다.
>
> 하지만, 우리 주변에는 졸음운전을 예방하는 솔루션이 보이지 않는다. 분석결과 대부분 B2B로 판매되어 일반 운전자가 구매하기 어려워 접근성이 떨어진다는 것과 기존의 솔루션은 경고음이나 진동과 같은 단방향 소통방식을 채택하여 졸음예방효과가 크지 않다는 것을 알 수 있었다.
> 그리고 기존 솔루션이 가지고 있는 이러한 한계들은 이용자들이 해당 솔루션을 사용해야만 하는 이유를 찾지 못하게 하여 상용화에 어려움을 겪고 있었다.
#### 1.2. 개발 목표 및 주요 내용
>  어웨이크는 위에서 언급한 두가지 한계를 극복하기 위한 개발목표를 세우게 되었다.
> 첫 번째는 접근성 향상을 위해서 Flutter로 개발하여 Android와 iOS 두 가지 버전으로 build하는 것이다. 해당 방식으로 개발하게 될 경우에는 Android를 주로 사용하는 갤럭시와 iOS를 주로 사용하는 아이폰 두 가지 기종에 모두 배포가 가능하며, HW를 따로 설치하지 않더라도 졸음예방 솔루션을 이용할 수 있기 때문에 접근성이 향상될 것이다.
> 두 번째는 LLM 대화모델을 이용하여 양방향 소통방식을 가진 솔루션을 개발하는 것이다. 최근 GPT와 같은 생성형 AI가 발전하게 되면서 인간의 언어를 AI가 이해하여 소통이 가능하게 되었다. 해당 LLM 대화모델을 활용하여 졸음예방 솔루션을 개발하여 졸음예방 지속시간을 높일 예정이다.
#### 1.3. 세부내용
> 졸음인식과 졸음예방의 매커니즘으로 동작한다. 졸음인식의 경우에는 컴퓨터비전을 이용하며, 라즈베리파이4B 4G의 수준에서 돌아가도록 최적화를 할 예정이다. 따로 HW장비를 만들어서 돌아갈 수 있도록 할 예정이다.
> 대화솔루션을 구현하기 위해서는 GPT와 CLOVA 두 개의 LLM API를 이용하여 간단하게 프로토타입을 제작할 예정이다. 추후에 RAG기술을 이용하여 기존의 LLM이 가지고 있던 한계를 극복하여 개인 맞춤형 대화모델을 개발할 예정이다.
#### 1.4. 기존 서비스 대비 차별성
> 유사 서비스로는 현대 모비스의 ‘엠브레인’, 도요타의 ‘iot 시트 커버’, 크레이티브 모드의 ‘스틸’ 이 있다. 이러한 서비스와 어웨이크의 차이점은 크게 4가지로 들 수 있다. 바로 졸음 예방 방식과 지속적 업데이트 여부, 설치장소의 자유도, 운전자 방해도이다.
> 엠브레인은 경고음, iot 시트 커버는 진동과 음악재생, 스틸은 진동 및 전기적인 충격과 같은 단방향 솔루션을 도입하였다. 하지만, 우리는 대화라는 양방향 서비스를 도입하여 졸음을 예방한다.
> 우리는 어플리케이션으로 제작하여 지속적인 업데이트가 가능하지만, 다른 제품들은 그렇지 않다. 또한, 휴대폰을 자동차 어디에 두어도 쉽게 사용이 가능하지만 다른 제품들은 그렇지 않다. 몸에 부착하여 진동이나 충격을 주는 제품들에 비하면 우리는 몸에 부착을 하지 않기 때문에 핸들과 같은 장치를 조작할 때, 방해도가 다른 제품에 비하면 낮다고 할 수 있다.
#### 1.5. 사회적가치 도입 계획
> 해당 솔루션을 바탕으로 창업하여 고용 창출 및 글로벌 진출을 통한 사회적 가치를 창출할 계획입니다. 졸음운전으로 인한 피해를 경감시키고 경제적 이점을 제공하는 것이 목표입니다.

### 2. 상세설계
#### 2.1. 시스템 구성도
> 본 프로젝트는 운전 중 졸음을 인식하고 이를 예방하기 위한 시스템을 개발하는 것을 목표로 한다. 시스템은 졸음 인식 모듈과 졸음 예방 모듈로 구성된다.
> (1) 졸음 인식
> - 졸음 인식은 사용자의 얼굴을 인식하고, 안면 랜드마크를 기반으로 눈동자 부근을 추적하여 졸음 상태를 감지하는 기능이다. 이 과정에서 하드웨어의 카메라를 통해 실시간으로 얼굴 데이터를 받아오고, 시스템은 EAR 알고리즘을 바탕으로 이를 분석하여 눈의 깜빡임 빈도와 눈의 크기를 측정한다. 데이터를 통해 Short-NAP(정상), Normal-NAP(위험), Power-NAP(감지)과 같은 졸음 상태를 분류한다.
> (2) 졸음 예방
> - 졸음 상태가 감지되면, 시스템은 즉각적으로 대화형 AI와 콘텐츠 제공 모듈을 활성화한다. 졸음 예방 단계에서는 양방향 솔루션으로 LLM 대화 모델을 통해 운전자를 깨우기 위한 대화가 자동으로 시작된다. 또한, 감지된 졸음 상태에 맞춰 사용자의 관심을 환기시킬 수 있는 다양한 콘텐츠(예: 음악, 퀴즈, 뉴스 등)가 제공된다. 이러한 구성은 졸음으로 인한 위험을 최소화하고 사용자의 집중력을 높이는 데 중점을 둔다.
#### 2.2. 사용 기술
> 시스템 구현에 사용된 기술은 다음과 같습니다:
>
> - **Frontend**: Flutter
> - **Backend**: Python (OpenCV, Dlib)
> - **AI**: GPT, CLOVA TTS, LangChain
>
>1. 컴퓨터 비전
>(1) OpenCV
> : 이미지 처리 및 컴퓨터 비전 라이브러리로, 얼굴 인식, 눈 감김 감지 등의 기능을 수행한다. 실시간 이미지 스트리밍 및 처리 기능을 제공하여 졸음 상태를 즉각적으로 인식할 수 있도록 한다.
>(2) Dlib
> : 얼굴 랜드마크를 추출하는 데 유용하며, 눈의 상태를 정확하게 분석할 수 있도록 지원한다. 68개 랜드마크 모델을 사용하여 눈의 깜빡임 여부를 판단하고 졸음 상태를 감지한다. 
>2. 음성 인식 및 합성
>(1) STT (Speech-to-Text)
> : 사용자의 음성을 텍스트로 변환하는 기술로, 대화형 인터페이스에서 사용된다. 운전자가 질문이나 응답을 할 때 음성 인식을 위해 사용된다. 
>(2) TTS (Text-to-Speech):
> : 시스템이 텍스트를 음성으로 변환하여 사용자에게 정보를 전달할 수 있도록 한다. 졸음 인식 후 운전자를 깨우기 위한 대화 내용을 음성으로 제공한다.
>3. 대화형 생성 모델 (RAG)
>(1) RAG (Retrieval-Augmented Generation):
> : 사용자와의 대화에서 필요한 정보를 검색하고 생성하는 모델로, 운전자의 흥미를 끌 수 있는 질문이나 콘텐츠를 제공한다. 사용자의 응답에 기반하여 적절한 콘텐츠를 제공하여 졸음을 예방하는 데 도움을 준다.

### 3. 개발결과
#### 3.1. 전체시스템 흐름도
> 시스템의 흐름도는 다음과 같습니다. 앱 시작, 대화 유형 및 목소리 선택, 카메라 활성화 및 졸음 모니터링, 대화 시작, 졸음 감지, 대화 종료, 앱 종료의 순서로 진행됩니다.



#### 3.2. 기능설명
> **졸음 인식**:
> - 스마트폰 카메라를 사용하여 사용자의 눈 깜빡임 및 눈 감김 상태를 실시간으로 모니터링합니다. 졸음 상태로 판단되면 즉시 대화가 시작됩니다.
>
> **졸음 예방 (대화 및 콘텐츠)**:
> - LLM을 사용하여 사용자가 선택한 대화 유형에 따라 대화를 제공합니다. 졸음이 인식되면 자동으로 활성화되어 졸음을 예방합니다. 사용자는 대화 유형과 목소리를 선택할 수 있습니다.
> - 졸음 예방 기능은 LLM(대형 언어 모델)을 사용하여 사용자가 혼자 운전할 때 마치 상대방과 대화하는 듯한 경험을 제공합니다. 앱 사용자는 대화를 시작하기 전에 아재개그나 퀴즈와 같은 대화 유형을 선택할 수 있으며, 선호하는 목소리를 고를 수도 있습니다.대화는 사용자가 원하는 컨텐츠로 유도되며, 졸음이 인식되면 자동으로 활성화되어 졸음 상태를 효과적으로 예방합니다.
#### 3.3. 기능명세서
>  1. 대화 생성 (LLM과 LangChain 이용)
>
>사용된 패키지 및 기술: LLM (Large Language Model), LangChain
>
>이 앱의 핵심 기능 중 하나로, 사용자는 "아재개그" 또는 "퀴즈"와 같은 다양한 대화 유형을 선택할 수 있습니다. 선택된 대화 유형에 따라, 대화 내용을 생성합니다. 이를 통해 사용자는 혼자 운전할 때에도 마치 실제 사람과 대화하는 듯한 경험을 할 수 있습니다.
>
>LangChain의 활용으로 대화 시나리오의 설계와 관리가 용이해지며, 코드 유지보수가 간편해집니다. 이를 통해 대화 로직을 더 쉽게 업데이트하거나 새로운 대화 유형을 추가할 수 있어, 지속적인 기능 개선과 확장이 가능해집니다.
>
>또한, PIP (Picture-in-Picture) 모드를 지원하여 네비게이션 앱을 사용하면서도 대화 기능을 동시에 사용할 수 있습니다. 운전 중 네비게이션 화면을 유지하면서, 작은 PIP 창에서 대화를 이어나갈 수 있어 편리성과 안전성을 함께 제공합니다.
>
> 2. 음성 합성 (클로바 TTS 사용)
>
>사용된 패키지 및 기술: 클로바 TTS (Text-to-Speech)
>
>생성된 텍스트 대화는 클로바 TTS를 사용하여 음성으로 변환됩니다. 사용자는 다양한 목소리 옵션 중에서 선택할 수 있으며, 이를 통해 사용자에게 더 맞춤화된 경험을 제공합니다. 
>
>여기에 비동기 방식을 도입하여 음성 생성 및 처리 속도를 개선하여 더 빠르고 자연스러운 대화 경험을 제공합니다.
>
> 3. 음성 인식 (Flutter의 Speech-to-Text 사용)
>
>사용된 패키지 및 기술: Flutter Speech-to-Text
>
>사용자의 음성 입력을 실시간으로 인식하여 대화에 반영합니다. Speech-to-Text 기능을 통해 사용자는 운전 중 손을 사용하지 않고도 대화에 참여할 수 있으며, 인식된 음성은 즉시 텍스트로 변환되어 LLM과 상호작용합니다. 한국어와 영어 등 다양한 언어를 지원하며, 인식된 텍스트는 대화 생성에 활용됩니다.
>
> 4. 졸음 인식 (Python 기반)
>
>사용된 패키지 및 기술: Python, OpenCV, Dlib 
>
>카메라를 사용해 사용자의 눈 깜빡임과 눈 감김 상태를 모니터링하여 졸음을 인식합니다. Python의 OpenCV와 Dlib을 사용해 얼굴 인식과 눈 깜빡임 감지를 수행합니다. 일정 시간 이상 눈이 감긴 상태가 지속되면 졸음 상태로 판단하여 즉시 대화를 시작합니다. 이 기능은 운전 중 졸음으로 인한 사고를 방지하기 위해 설계되었습니다.
>
> 5. 사용자 인터페이스 및 경험 관리 (Flutter 사용)
>
>사용된 패키지 및 기술: Flutter
>
>전체 앱의 사용자 인터페이스(UI)를 관리합니다. Flutter를 사용해 안드로이드와 iOS 환경 모두에서 최적화된 성능을 제공하며, 음성 인식, 졸음 인식 등 다양한 기능을 통합하여 제공합니다.

#### 3.4. 디렉토리 구조
> 프로젝트의 디렉토리 구조는 다음과 같습니다:
>
> ```
> lib/
>  ├── constants/colors    // 앱에서 사용하는 색상 값 정의
>  ├── screens/
>  │    ├── components/    // UI 컴포넌트
>  │    └── llm/           // LLM 관련 프론트 구성 요소
>  ├── util/
>  │    ├── tts/           // 텍스트 음성 변환 기능
>  │    └── lang_chain/    // 랭체인 관련 기능
> ```
### 4. 설치 및 사용 방법
> **설치 방법**:

> - Android 사용자는 제공된 QR 코드를 통해 앱을 다운로드할 수 있습니다. 설치 시 출처를 알 수 없는 앱으로 표시될 수 있으므로, 설치를 허용해야 합니다.
>
> **사용 방법**:
> - 앱을 실행한 후, 메인 페이지에서 대화 주제와 목소리를 설정합니다. 설정이 완료되면 AI 가비 버튼을 눌러 대화 페이지로 이동할 수 있습니다. 졸음이 감지되면 선택된 주제에 맞춰 대화가 자동으로 시작됩니다.


### 5. 소개 및 시연 영상
> 
### 6. 팀 소개
> **팀명**: Awake
>
> **팀장**:
> - **정주영(wjdwndud0001@naver.com)**: 전기공학과 / 기획 및 발표 / 졸음인식서비스 개발
> 
> **팀원**:
> - **정윤성(jys0972@pusan.ac.kr)**: 컴퓨터공학과 / 프론트, 백엔드 갭라 / LLM대화서비스 개발 / TTS 개발
> - **차지원(wona825@naver.com)**: 의생명융합 데이터사이언스전공 / 프론트, 백엔드 개발 / LLM대화서비스 개발
> - **우준석(wminsoo1@naver.com)**: IT응용공학과 / 프론트, 백엔드 개발 / STT 개발
> - **문서진(tjwls0108@naver.com)**: 전자공학과 / 프론트 개발 / 하드웨어 구성품 제작
### 7. 해커톤 참여 후기
> **정윤성**: Langchain을 이용한 나름 도전적인 구현을 통해 많이 배울 수 있었습니다.
> **문서진**: 일회성으로 끝나지 않고, 장기적으로 여러 교육과 멘토링을 받을 수 있어 창업에 대한 시야를 넓히는 기회가 되었습니다.
### 8. 참고문헌 및 출처
1. 민지홍, 김정철, 홍기천, 「눈 검출 및 눈동자 추적 기반을 통한 졸음운전 경보 시스템 구현」, 한국지능시스템학회, 2005, p.249-252
2. 김민수, 김윤년, 허윤석, 「운전자 졸음 및 각성 상태 시 ECG 신호처리를 통한 심장박동 신호 특성」, 한국자동차공학회, 2014, p.136-142
3. 최진혁, 송혁, 박상현 외 1명, 「운전자 졸음 인식 시스템 구현」, 한국통신학회, p.711-720
![image](https://github.com/user-attachments/assets/324b1826-ad1b-4429-b281-616ed797c836)
