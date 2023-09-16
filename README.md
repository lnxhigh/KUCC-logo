# KUCC-logo
KUCC 동아리 로고 그리기

## KUCC-logo with Bezier curve

### kucc-data.R
베지어 커브를 구성하기 위한 컨트롤 포인트의 정보를 담고 있다.

컨트롤 포인트를 구하기 위해 Desmos라는 그래핑 사이트를 이용했다.

![image](https://github.com/lnxhigh/KUCC-logo/assets/86676746/12d37150-b640-42ba-979a-eeca5e2dd4b5)

이를 바탕으로 베지어 커브를 구성하여 로고의 엣지를 샘플링했다.

이렇게 얻은 데이터를 kucc.dat에 저장한다.

### kucc-desmos.R
kucc.dat을 바탕으로 polygon 함수를 이용해서 색칠을 한다.

### kucc-desmos-sketch.R
kucc.dat을 바탕으로 베지어 커브를 그리며 컨트롤 포인트를 표시한다.

### kucc-desmos-sketch-anim.R
animation 패키지를 이용해서 베지어 커브로 로그를 그리는 애니메이션을 만든다.  
[ImageMagick을 설치](https://blog.naver.com/plasticcode/221424529774)하여 mp4 비디오를 만들 수 있다.

https://github.com/lnxhigh/KUCC-logo/assets/86676746/f82d1319-337a-4aa7-a6a2-22a20425385a

## KUCC-logo with Fourier Series

### kucc-fourier.R
[3B1B의 영상](https://youtu.be/r6sGWTCMz2k?si=IDiebitnsrnJhN5e)을 참조하여 푸리에 급수로 로고를 그리는 애니메이션을 만든다.  

먼저 kucc.dat을 불러온다.  
t의 값은 0에서 1 사이로 설정한다.  

f(t)는 데이터의 (N-1)*t + 1 번째 행을 이용해서 결정이 된다.  
두 행을 선형 보간하는 것 없이 간단하게 (N-1)*t + 1 를 반올림해서 나온 값을 사용해서 인덱싱했다.

R에서는 복소수 자료형을 사용할 수 있으므로 이를 이용해서 작업했다.  

푸리에 급수에 의해 f(t)는 c\*exp(n\*2\*pi\*i\*t) 의 합으로 분해된다.  
이때 c\*exp(n\*2\*pi\*i\*t) 는 단위원을 나타내게 되므로 여러 원들을 그려 표현하는 것이 가능하다.

계수 c는 numerical하게 계산하였다. n의 순서는 0 -> -1 -> 1 -> -2 -> 2 -> -3 -> 3 -> ... 과 같이 진행하였다.
원의 중심과 반지름은 해당 t 값과 계수들의 값을 이용해서 도출이 된다.

t = 0 부근에서는 약간의 불안정함이 존재하여 t = 0.005 부터 시작을 했다.

https://github.com/lnxhigh/KUCC-logo/assets/86676746/a2a262be-ec44-4ca2-aacb-39862e22cb6c

## KUCC-logo with Image

### kucc-sampling.R
kucc 로고 이미지에서 픽셀을 샘플링해서 새로운 이미지를 그린다.

이미지 처리를 위해 imager 패키지를 사용했다.  
컬러는 ```rainbow```를 사용했다.

![KUCC_R](https://github.com/lnxhigh/KUCC-logo/assets/86676746/d6dc17d4-045c-4e59-a86d-0c1d98858ee1)

또한 plotly를 사용해서 html로 만든 버전도 있다.  
밀도 기반 클러스터링 알고리즘을 사용해서 눈과 몸체를 분리했다.

![kucc-sampling-plotly](https://github.com/lnxhigh/KUCC-logo/assets/86676746/36ed510d-0451-409f-bdef-dc31cef6fd6c)
