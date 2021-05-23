!t-tem
=========
프로젝트 목적
-----------
![녹화_2021_05_23_19_55_27_92](https://user-images.githubusercontent.com/63712295/119259320-ad688300-bc08-11eb-8582-3593359f4d93.gif)

    머신러닝을 활용한 옷 검색사이트. 궁금했던 옷을 검색하고 관련의상을 피팅해볼 수 있다.

개발환경
-----------
- 운영체제 : Window OS
- 개발도구 : Eclipse, Github
-DBMS : Oracle DB -sqldeveloper
-Server : Apache Tomcat 8.5
-Language : Java, HTML5, CSS3, Javascript, JQuery, SpringMVC, tensorflow.js

DB erd
----------
![3조 _](https://user-images.githubusercontent.com/63712295/119259616-02f15f80-bc0a-11eb-83bc-f354fc00f41d.png)

구현기능 설명
--------------
![그림1](https://user-images.githubusercontent.com/63712295/119259493-8cecf880-bc09-11eb-92ed-10bf8b054775.png)

    > Tensorflow.js 라이브러리를 연결한 후 javascript코드를 이용하여 학습시켜둔 모델을 불러오고 웹캠을 연결해준다.
    > 이미지가 인식되면 모델을 통해 이미지를 인식하고 결과와 정확도를 javascript를 통해 오른편에 출력하고 정확도가 
    > 50% 이상인 라벨 중 가장 정확도가 높은 결과를 출력해주고 해당 clothesCode를 찾아Fitting 페이지로 전달해준다. 
    

![그림2](https://user-images.githubusercontent.com/63712295/119259496-8d858f00-bc09-11eb-91e9-97a5e9933aa7.png)

    > 이미지 첨부 시 해당 이미지의 미리 보기를 Javascript를 통해 띄워준다.
    > Jstl을 사용하여 Session에 회원정보가 담겨있는지 확인한다. 로그인되어있는 
    > 회원의 경우 fitting페이지로 연결하고 아닐 시 경고창을 띄우고 로그인 페이지로 연결해준다.
