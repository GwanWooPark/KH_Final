<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>machine learning fruits</title>
<!--  ctl + shft + f : 누르지 말 것!  async 코드 분리됨.-->
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
	// More API functions here:
	// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image
	// the link to your model provided by Teachable Machine export panel
	const URL = "https://teachablemachine.withgoogle.com/models/hB4_pq6pp/";

	let model, webcam, labelContainer, maxPredictions; //재선언 불가, 재할당 가능.변수 hoisting불가, block level scope.

	// Load the image model and setup the webcam
	//async function():  await 키워드가 비동기 코드를 호출할 수 있게 해주는 함수
	// javascript는 동기식 언어니까 비동기식으로 해서 계속 화면을 확인하면서 %를 알려주도록
	async function init() {
		const modelURL = URL + "model.json"; //train 한 모델파일. 
		const metadataURL = URL + "metadata.json";

		// load the model and metadata
		// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
		// or files from your local hard drive
		// Note: the pose library adds "tmImage" object to your window (window.tmImage)
		//변수 앞에 var 생략된듯
		model = await
		tmImage.load(modelURL, metadataURL); // model 파일과 metadata 파일을 가지고 와서 비동기식으로 load한다.
		maxPredictions = model.getTotalClasses(); //maxPredictions는 모든 class들을 가져온다. 

		//캠 세팅 
		// Convenience function to setup a webcam
		const flip = true; // whether to flip the webcam              //캠을 on 하면, 
		webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
		await
		webcam.setup(); // request access to the webcam //캠에 접근 허용을 요청.
		await
		webcam.play(); //사용자가 허용하면
		window.requestAnimationFrame(loop); //loop라는 함수 호출  

		// append elements to the DOM(문서객체모델)
		document.getElementById("webcam-container").appendChild(webcam.canvas); //webcam container 아래에 webcam.canvas를 자식요소로추가.

		//class만큼 div만들기 
		labelContainer = document.getElementById("label-container");
		for (let i = 0; i < maxPredictions; i++) { // and class labels      // 클래스 전체를 하나하나씩 반복 
			labelContainer.appendChild(document.createElement("div")); ///div요소를 생성해서  labelContainer 의 자식요소로 추가하면서 반복 
		}
	}

	//loop 함수 
	async function loop() {
		webcam.update(); // update the webcam frame
		await
		predict(); //  predict 함수 호출해서 비동기식으로 예측작업을 하고 
		window.requestAnimationFrame(loop); // 다시 loop 호출 하면서 반복 
	}

	//predict함수 
	// run the webcam image through the image model 
	async function predict() {
		// predict can take in an image, video or canvas html element (html의 canvas요소 : html문서 내부에 그림을 그릴 수 있는 일종의 '컨테이너')
		const prediction = await
		model.predict(webcam.canvas); // 사과,바나나 
		for (let i = 0; i < maxPredictions; i++) { // 모든 클래스를 돌때까지 반복 
			//사과: 1.00
			//바나나: 0.00
			const classPrediction = prediction[i].className + " : "
					+ prediction[i].probability.toFixed(2); // [클래스이름: 확률 ] 형태로 예측의 확률을 나타내고 소숫점 자리수를 2개로 제한한다.
			labelContainer.childNodes[i].innerHTML = classPrediction; //labelContainer 자식요소들을 바꿔서 출력   (innerHTML: html요소를 바꿔서 출력 )              

			/* 
			 //console.log(prediction[1].probability);
			 if(prediction[0].probability > 0.5){
			   document.querySelector('p').eq(0).style.backgroundColor = 'skyblue';
			   document.querySelector('p').eq(0).style.color = 'black';
			}else{
			 document.querySelector('p').eq(1).style.backgroundColor = 'orange';
			  document.querySelector('p').eq(1).style.color = 'yellow'; 
			}*/

		}
		console.log(prediction[0].probability);

		//모든 과일의 설명들을 display:none으로 함.
		var fruits = document.getElementsByClassName('fruits');
		for (i = 0; i < fruits.length; i++) {
			fruits[i].style.display = 'none';
		}

		if (prediction[0].probability > 0.5) {
			document.getElementById("apple").style.display = 'inline';
		} else if (prediction[1].probability > 0.5) {
			document.getElementById("banana").style.display = 'inline';
		} else if (prediction[2].probability > 0.5) {
			document.getElementById("blueberry").style.display = 'inline';
		} else if (prediction[3].probability > 0.5) {
			document.getElementById("broccoli").style.display = 'inline';
		} else if (prediction[4].probability > 0.5) {
			document.getElementById("cabbage").style.display = 'inline';
		} else if (prediction[4].probability > 0.5) {
			document.getElementById("carrot").style.display = 'inline';
		} else if (prediction[4].probability > 0.5) {
			document.getElementById("garlic").style.display = 'inline';
		} else if (prediction[4].probability > 0.5) {
			document.getElementById("onion").style.display = 'inline';
		}else if(prediction[4].probability > 0.5){
      	  document.getElementById("peach").style.display = 'inline';
  	  }else if(prediction[4].probability > 0.5){
    	  document.getElementById("potato").style.display = 'inline';
	  }else if(prediction[4].probability > 0.5){
    	  document.getElementById("sweetpotato").style.display = 'inline';
	  }else if(prediction[4].probability > 0.5){
    	  document.getElementById("sweetpumpkin").style.display = 'inline';
	  }else if(prediction[4].probability > 0.5){
    	  document.getElementById("watermelon").style.display = 'inline';
	  }

	} //predict function } 

	//맨저음 식재료 정보들 없애주는 함수 
	window.onload = function() {
		var fruits = document.getElementsByClassName('fruits');
		for (i = 0; i < fruits.length; i++) {
			fruits[i].style.display = 'none';
		}
	}
</script>
<style>
#fruits {
	display: none;
}
</style>
<body>
	<jsp:include page="header.jsp" />
	<div class="main-banner wow fadeIn">
	<div class='row'>
	<div class='col-sm-6' style="padding-left: 30%">
	<h1>식재료 정보 확인</h1><br><br>
	<button type="button" class="btn btn-outline-success" onclick="init()">내 식재료 정보 확인</button>
	
	<br>
	<br>
	<br>
	<div id="webcam-container"></div>
	</div>
	<!--  style="visibility:hidden;  position:absolute;" -->
	<div id="label-container" style="visibility:hidden;  position:absolute;" style="padding-left: 30%" ></div>
	<div class='col-sm-6' style="padding-right: 10%">
		<div class="fruits" id="apple">
			<h1>사과</h1>
			[ apple , 沙果,砂果 ]<br> 쌍떡잎식물 장미목 장미과 낙엽교목 식물인 사과나무의 열매.<br>
			사과나무의 열매로, 세계적으로 널리 재배되는 열매 가운데 하나이다. 평과(苹果), 빈파(頻婆)라고도 한다.<br> <br>
			사과열매는 가을에 익는데, 보통 지름이 5~9센티미터이다. 극히 드물지만 15센티에 이르기도 한다.<br> 씨앗에는
			미량의 사이안화물이 함유되어 있다. 샐러드, 주스 등의 재료로 쓰인다. <br>
			<br>
			<h2>역사</h2>
			사과나무의 원산지는 발칸반도로 알려져 있으며 B.C. 20세기 경의 스위스 토굴 주거지에서 탄화된 사과가 발굴된 것으로 보아
			서양사과는 4,000년 이상의 재배 역사를 가진 것으로 추정된다. 그리스 시대에는 재배종, 야생종을 구분한 기록이 있고 접목
			번식법이 이미 소개 되어 있을 정도로 재배 기술이 진보되었다. 로마시대에는 Malus 또는 Malum이란 명칭으로 재배가
			성향하였고 그 후 16-17세기에 걸쳐 유럽각지에 전파되었다. 17세기에는 미국에 전파되었고 20세기에는 칠레 등 남미 각국에
			전파되었다. <br>
			<br>
			<h2>품종</h2>
			세계적으로 재배되고 있는 품종은 700여 종이 되지만, 대한민국에서 유실수로 재배되고 있는 품종은 10여 종이다. 사과의
			품종은 수확기에 따라 조생종·중생종·만생종으로 나뉘고, 색깔에 따라 홍색사과·황색사과·녹색사과로 구분한다. 현재 널리 재배되고
			있는 품종에는 스타킹·골든딜리셔스·축 등이 있고, 근래에는 조나골드·부사 등이 있다. 대한민국에서는 홍옥이 오랫동안
			재배되었으나 현재는 적은 수가 재배되고 있다.
	</div>

	<div class="fruits" id="banana">
		<h1>바나나</h1>
		열대 아시아가 원산지다. 상록 여러해살이풀로 높이가 3∼10m이다. 땅속 깊이 들어가 지지작용을 하는 뿌리와, 땅 밑
		30cm까지 들어가 옆으로 퍼지고 뿌리털이 달려 흡수작용을 하는 뿌리가 있다. <br>열대 아시아가 원산지다. 상록
		여러해살이풀로 높이가 3∼10m이다. 땅속 깊이 들어가 지지작용을 하는 뿌리와, 땅 밑 30cm까지 들어가 옆으로 퍼지고
		뿌리털이 달려 흡수작용을 하는 뿌리가 있다. <br>
		<br> 줄기는 잎집이 서로 어긋나게 싸서 생긴 헛줄기다. 헛줄기는 원기둥 모양이고 윗부분에 잎이 사방으로 달린다.
		잎은 긴 타원 모양이고 길이가 2.5m, 폭이 60cm이며, 굵은 가운데 맥이 있다. 엽총(葉叢) 밑 부분에서 나온 꽃줄기는
		자라면서 밑으로 처지고, 그 끝에 짙은 자주색의 포가 있다. <br>
		<br> 꽃은 7∼8월에 황색을 띤 흰색으로 피고, 각 포 겨드랑이에 2단으로 병렬하며, 포가 꽃 전체를 감싼다.
		꽃줄기의 밑 부분에는 암꽃, 끝 부분에는 수꽃이 달린다. 수술은 5개, 암술은 1개다. 씨방은 하위(下位)이며, 3실로
		갈라지고, 밑씨의 수가 많다. 종자가 있는 품종과 없는 품종이 있다. <br>
		<br> 열매는 장과에 속하며, 과방(果房)에 계단 모양으로 달린다. 날 것을 그대로 먹는 품종(common
		banana)은 길이가 6∼20cm, 지름이 3.5∼5cm이다. 요리용 바나나(plantain banana)는 길이가
		30cm, 지름이 7cm이다. 열매의 색깔은 잿빛을 띤 흰색·노란색·귤색 등이 있고, 향기와 단맛 등에도 변화가 많다. 종자는
		짙은 갈색이고, 편평한 둥근 모양이며, 지름이 5mm이다.

	</div>
	<div class="fruits" id="blueberry">
		<h1>블뤠베리</h1>

		월귤나무의 일종인 블루베리(blueberry)는 세계적으로 북반구를 중심으로 150∼200종이 분포되어 있으며,
		로부시(lowbush) 블루베리, 하이부시(highbush) 블루베리, 래비트아이(rabbiteye) 블루베리 등 세 품종이
		주종을 이루고 있다. 블루베리에는 푸른색으로 상징되는 안토시안 색소, 새콤달콤한 당분, 점성이 있는 펙틴, 은은한 향기 등이
		있다. 또한 블루베리는 100g당 식이섬유가 4.5g이 들어 있으며 칼슘, 철, 망간 등이 많이 함유되어 있다. <br>
		<br> 세계적으로 블루베리 관련 제품으로 캔디, 껌, 잼, 드링크류 등이 생산되고 있으며, 최근에는 눈의 기능성에
		착안한 기능성식품과 의약품 개발이 활발하게 추진되고 있다. 블루베리의 재배 및 관련 산업은 미국, 캐나다, 일본, 독일,
		뉴질랜드 등에서 활발히 전개되고 있다.
		<h2>효용성</h2>
		북미 대륙의 인디언들은 옛날부터 블루베리를 식품으로 사용하였으며, 열매와 잎의 엑기스는 괴혈병, 당뇨병, 비뇨기 질환 등의
		치료에 사용하였다.<br> '눈에 좋다'는 이야기가 나온 유래는 제2차 세계대전 중에 영국 공군의 조종사가 빵에
		블루베리를 빵 두께만큼 발라 먹은 결과 “희미한 빛 속에서도 물체가 잘 보였다”라고 증언하였다. 이것이 실마리가 되어 학자들이
		연구한 결과, 시력 개선 효과가 있다는 것이 판명되었다.
	</div>
	<div class="fruits" id="broccoli">
		<h1>복숭아</h1>
		도자(桃子)라고도 한다. 맛은 달고 시며 성질은 따뜻하다. 과육이 흰 백도와 노란 황도로 나뉘는데, 생과일로는 수분이 많고
		부드러운 백도를 쓰고, 통조림 등 가공용으로는 단단한 황도를 쓴다. 중국 원산으로 실크로드를 통하여 서양으로 전해졌으며,
		17세기에는 아메리카 대륙까지 퍼져 나갔다. 한국에서도 예로부터 재배하였으나 상품용으로는 1906년 원예모범장을 설립한 뒤부터
		개량종을 위주로 재배하였다. 전세계에 약 3,000종의 품종이 있으며 한국에서는 주로 창방조생·백도·천홍·대구보·백봉 등을
		재배한다. <br>
		<br> 주성분은 수분과 당분이며 타타르산·사과산·시트르산 등의 유기산이 1% 가량 들어 있고, 비타민 A와
		폼산·아세트산·발레르산 등의 에스터와 알코올류·알데하이드류·펙틴 등도 풍부하다. 과육에는 유리 아미노산이 많이 들어 있는데,
		특히 아스파라진산이 많다. 특유의 향은 에스터·알코올류·알데하이드가 어울려서 낸다. <br>
		<br> 알칼리성 식품으로서 면역력을 키워 주고 식욕을 돋운다. 발육 불량과 야맹증에 좋으며 장을 부드럽게 하여
		변비를 없애고 어혈을 풀어 준다. 껍질은 해독작용을 하고 유기산은 니코틴을 제거하며 독성을 없애 주기도 한다. 발암물질인
		나이트로소아민의 생성을 억제하는 성분도 들어 있다. 단, 장어와 같이 먹으면 설사를 하고, 자라와 먹으면 가슴통증을 일으키므로
		주의해야 한다.
	</div>
	<div class="fruits" id="caggage">
	<h1>양배추</h1>
	동그란 공 모양의 양배추는 샐러드, 쌈 채소, 볶음요리 등에 널리 쓰이고 있다. 양배추의 비타민U는 위장병에 특효가 있으며 식이섬유가 많아 장운동을 활발히 한다. 시설재배가 이루어져 사시사철 언제든지 맛볼 수 있다.<br>
<h2>양배추의 영양 및 효능</h2>
양배추는 부위별로 영양소 함유량이 다른데, 겉잎에는 비타민 A와 철분, 칼슘이 풍부하고 하얀 속잎에는 비타민 B군과 비타민 C 함량이 높다. 양배추의 비타민U 성분은 위궤양 치료의 효과가 있고 위장관 내 세포의 재생을 도와주는 역할을 한다. 실제 쥐를 통한 실험 결과 양배추를 먹였을 때 위 점막 회복률이 46% 향상되었으며 출혈, 상처 등의 염증이 완화되는 것으로 나타났다. 양배추는 또한 암 예방에도 효과가 있는데, 미국 미시간주립대의 조사에서 주 3회 이상 양배추를 먹는 여성은 그렇지 않은 여성에 비해 유방암에 걸릴 확률이 72%나 낮은 것으로 확인되었다. 양배추의 영양성분은 양배추의 속으로 들어갈수록 높아지며, 심지 부위에는 특히 위장에 좋은 비타민 U 성분이 가장 많은 것으로 밝혀졌다. 다만 양배추의 심지는 단단하고 질겨 대부분 버리고 있는데, 심지를 살짝 찐 후 분쇄기에 갈아서 주스로 마시면 좋다. 주스로 갈아 마실 경우 사과나 오렌지를 함께 넣으면 양배추의 비린 맛을 완화할 수 있다.
<br><br>
<h2>양배추 고르는 법</h2>
모양이 동글동글하고 겉잎이 연한 녹색을 띠는 것이 좋다. 묵직하고 양손으로 눌렀을 때 쉽게 들어가는 느낌 없이 단단한 것을 고른다. 잎이 시들거나 상처가 있고 벌레가 먹은 것은 피해야 한다. 또한 양배추를 쪼갰을 때 추대(꽃대가 올라와 꽃이 피는 현상)가 올라오거나 노란색으로 변한 부위가 많은 것은 좋지 않다.
<br><br>
<h2>양배추 손질법</h2>
양배추는 병충해에 약한 채소로 재배할 때 농약을 많이 사용하기 때문에 세척 과정이 매우 중요하다. 먼저 겉잎을 제거한 후 베이킹소다를 푼 물에 1차로 세척하고, 식초를 탄 물에 1~2분 정도 담근 다음 흐르는 물에 2차 세척하면 잔류 농약을 제거할 수 있다.
양배추에 함유된 대부분의 영양소는 열에 취약하기 때문에 생식으로 즙이나 주스를 만들어 먹는 것이 좋고, 가열 조리를 해야 할 때는 살짝 볶거나 데쳐서 사용하는 것이 좋다.
	</div>
	
	<div class="fruits" id="carrot">
<h1>당근</h1>	
	주홍빛 색을 가진 당근은 식재료로써 다양한 쓰임새는 물론 캐릭터로도 활용될 정도로 친숙한 채소이다. ‘비타민 A의 황제’라고 불리는 당근은 다양한 영양소를 함유하고 있고, 특유의 향과 색으로 널리 활용된다.
특유의 향과 주홍빛 색깔이 특징인 당근은 가장 친숙한 채소 중의 하나로 다양한 요리에 이용되고 있다. 계절에 따라 주 생산지가 달라지는 작물로 겨울에는 제주 구좌에서, 여름에는 경남지방, 가을에는 평창 고랭지에서 많이 생산된다. 생산량으로는 제주산이 전체의 68%로 가장 많다. 저장성이 뛰어난 작물로 적정 저장조건이 유지될 경우 6~8개월까지 품질이 유지되어 사시사철 언제나 쉽게 구할 수 있다. 당근에는 녹황색 식품에 함유된 베타카로틴 성분이 풍부해서 면역력을 높여주고 각종 질환 예방에도 도움을 주는 건강식품으로 꼽는다. 
<h2>당근의 영양 및 효능</h2>
당근은 녹황색 채소 중 베타카로틴의 함량이 가장 높다. 이 베타카로틴은 체내 흡수되면 비타민 A로 전환되는데 이는 특히 눈 건강에 좋으며, 이외에도 항산화 작용으로 노화 방지 및 암 예방에 도움을 준다. 또한 당근에는 루테인, 리코펜 성분이 풍부하여 눈 건강과 시력 형성에 효과가 있으며, 면역력 향상, 고혈압, 동맥경화를 예방하는 역할을 한다. 비타민 A는 지용성 비타민으로 기름과 함께 섭취하면 흡수율이 훨씬 높아지기 때문에, 껍질째 기름과 함께 요리하는 것이 당근의 영양을 온전히 즐길 수 있는 조리법이다. 기름에 살짝 볶아 볶음요리를 만들거나, 얇은 튀김옷을 입혀 튀겨먹어도 좋다.  
당근에는 비타민 C를 산화시키는 아스코르비나아제라는 성분이 들어있어 비타민 C가 풍부한 다른 채소와 함께 섭취할 경우 흡수를 저해할 수 있다. 단, 아스코르비나아제는 열과 산성에 약하기 때문에 식초를 첨가하거나 가열 조리를 하면 다른 채소의 비타민 C를 온전히 흡수할 수 있다.

<h2>당근 고르는 법</h2>
당근을 고를 때에는 색깔과 모양, 그리고 얼마나 단단한가를 살펴봐야 한다. 먼저 색깔은 주황색이 선명하고 진할수록 영양소가 풍부한 것이다. 표면이 매끈한 것이 단맛이 강하며, 모양은 단단하면서 휘지 않은 것을 고르는데, 간혹 머리 부분이 푸른빛이 난다면 햇볕에 오래 노출되어 쓴맛이 날 수 있으므로 피하는 것이 좋다. 머리 부분에 꽃이 피었거나 물렁물렁한 것, 검은 테두리가 있는 것 역시 오래된 것이므로 피하도록 한다. 또 세척 당근은 오랫동안 물에 담가두기 때문에 미끈미끈한 경우도 있으니 되도록 흙 당근을 구입하는 것이 좋다.
<h2>당근 손질법</h2>
당근을 흐르는 물에 깨끗이 씻어내 흙과 불순물을 제거한다. 껍질은 필러로 벗겨서 사용할 수 있지만, 베타카로틴이 풍부하기 때문에 껍질째 먹는 것이 더 좋다. 당근의 줄기가 붙어있던 윗부분을 칼로 제거해준 후 채소 세척용 솔로 껍질을 문질러가면서 씻으면 껍질을 먹을 수 있을 만큼 깨끗하게 손질할 수 있다. 당근은 오래 가열하면 조직이 물러지기 때문에 찜이나 조림 요리를 할 때는 당근의 모서리를 둥글게 깎아서 부서지지 않도록 하는 것이 좋다. 

<h2>당근 보관방법</h2>
당근은 다른 채소에 비해 장기 보관이 가능하다. 표면의 흙을 깨끗이 씻어서 물기를 제거한 후 밀봉하여 냉장 보관하거나, 흙이 묻은 채로 신문지에 싸서 그늘지고 서늘한 곳에 보관하면 좋다. 당근을 잘라서 쓰고 나머지를 다시 보관해야 할 때는 자른 단면에 물을 뿌린 후 랩으로 잘 밀봉하여 냉장고에 보관하면 시들지 않아 다시 사용하기 좋다.
[네이버 지식백과] 당근 (우수 식재료 디렉토리)


</div>
	<div class="fruits" id="garlic">
	<h1>마늘</h1>
	마늘(garlic)은 중앙아시아가 원산인 백합과(白合科) 중 가장 매운 식물이며, 우리나라를 비롯하여 중국, 일본 등 극동(極東)에서 많이 재배되고 있다.<br><br>

마늘은 강한 냄새를 제외하고는 100가지 이로움이 있다고 하여 일해백리(一害百利)라고 부른다. 오늘날에는 마늘의 효능이 과학적으로 밝혀져 웰빙 식품으로 인정받고 있다. 2002년 미국 『타임(Time)』지는 마늘을 세계 10대 건강식품으로 선정하였으며, 마늘은 그 자체로 먹어도 좋고 다양한 음식의 재료로 사용해도 좋은 기능성 식품이라 예찬하였다.
미국암연구소(NCI)가 1992년에 발표한 건강한 몸을 유지하는 'Designer food(좋은 식품을 적극적으로 섭취함으로써 70세에 질병을 반으로 줄일 수 있다는 프로그램)' 피라미드의 최상위에 마늘이 위치하고 있다.
<br><br>
마늘은 우리나라의 거의 모든 요리에 쓰인다. 마늘의 강한 향이 비린내를 없애고 음식의 맛을 좋게 하며 식욕 증진 효과가 있기 때문에 향신료(양념)로도 사랑받는다.
마늘의 주성분은 탄수화물 20%, 단백질 3.3%, 지방 0.4%, 섬유질 0.92%, 회분 13.4%을 위시하여 비타민 B1, 비타민 B2, 비타민 C, 글루탐산(glutamic acid), 칼슘, 철, 인, 아연, 셀레늄, 알리신 등 다양한 영양소가 함유되어 있다.


	
	
	</div>
	<div class="fruits" id="onion">
	<h1>양파</h1>
	매운맛을 내는 성분인 ‘알리신’을 함유하고 있어 맵고 단 맛이 나고, 항산화 작용과 혈중 콜레스테롤 수치를 낮춰주는 효능을 가지고 있다.
	<h2>양파의 영양 및 효능</h2>
    양파는 수분이 전체의 90%를 차지하지만 단백질, 탄수화물, 비타민 C, 칼슘, 인, 철 등의 영양소가 다량 함유되어 있다. 양파의 퀘르세틴이라는 성분은 지방과 콜레스테롤이 혈관에 축적되는 것을 억제하여 고혈압 예방에 도움을 준다. 또한 퀘르세틴은 활성산소와 과산화지질로부터 세포가 공격당하는 것을 막아주는 역할을 하며 세포의 염증 및 상처를 회복하는 데 효과가 있다. 양파에는 크롬이 풍부하게 들어있는데, 크롬은 포도당 대사의 항상성을 유지하는 미량 무기질이며, 인슐린 작용을 촉진해주므로 혈당 조절에 도움이 된다. 양파에 들어있는 알리신 성분이 신경안정제 역할을 하므로, 잠을 잘 때 머리맡에 양파를 두면 신경을 안정시켜서 잠을 한결 편안하게 자는데 도움을 준다. 또한 알리신은 일산화질소를 배출해 혈관의 강직성을 떨어뜨려 혈압을 낮추는 효과가 있으며, 혈소판이 엉기는 것을 방지하고 혈관 내의 섬유소 용해 작용을 도와주기 때문에 혈전이나, 뇌졸중 위험을 감소시켜주기도 한다. 그 외에도 양파에는 술을 마실 경우 소모되는 비타민 B1의 흡수를 돕고 간의 지방분해를 돕는 글루타싸이온이라는 물질이 다량 함유되어 있어 숙취를 해소하는 데에도 효과적이다.

<h2>양파 고르는 법</h2>
좋은 양파는 무르지 않고 단단하며, 껍질이 선명하고 잘 마른 것이다. 또 들었을 때 무거운 느낌이 들고, 크기가 균일한 것이 좋다. 싹이 나 있는 양파는 푸석거리거나 속이 빈 경우가 있고, 보관을 잘못하면 악취가 나기 때문에 냄새로 좋은 양파를 구분하는 것도 하나의 방법이다. 싹이 보이지 않고 어두운색을 띠지 않으면서 껍질이 얇지만 잘 벗겨지지 않는 것을 고르도록 한다.
국산 양파와 중국산 양파의 구별방법은 다음과 같다.

	</div>
	<div class="fruits" id="peach">
	<h1>복숭아</h1>
	도자(桃子)라고도 한다. 맛은 달고 시며 성질은 따뜻하다. 과육이 흰 백도와 노란 황도로 나뉘는데, 생과일로는 수분이 많고 부드러운 백도를 쓰고, 통조림 등 가공용으로는 단단한 황도를 쓴다. 중국 원산으로 실크로드를 통하여 서양으로 전해졌으며, 17세기에는 아메리카 대륙까지 퍼져 나갔다. 한국에서도 예로부터 재배하였으나 상품용으로는 1906년 원예모범장을 설립한 뒤부터 개량종을 위주로 재배하였다. 전세계에 약 3,000종의 품종이 있으며 한국에서는 주로 창방조생·백도·천홍·대구보·백봉 등을 재배한다.
<br><br>
주성분은 수분과 당분이며 타타르산·사과산·시트르산 등의 유기산이 1% 가량 들어 있고, 비타민 A와 폼산·아세트산·발레르산 등의 에스터와 알코올류·알데하이드류·펙틴 등도 풍부하다. 과육에는 유리 아미노산이 많이 들어 있는데, 특히 아스파라진산이 많다. 특유의 향은 에스터·알코올류·알데하이드가 어울려서 낸다.
<br><br>
알칼리성 식품으로서 면역력을 키워 주고 식욕을 돋운다. 발육 불량과 야맹증에 좋으며 장을 부드럽게 하여 변비를 없애고 어혈을 풀어 준다. 껍질은 해독작용을 하고 유기산은 니코틴을 제거하며 독성을 없애 주기도 한다. 발암물질인 나이트로소아민의 생성을 억제하는 성분도 들어 있다. 단, 장어와 같이 먹으면 설사를 하고, 자라와 먹으면 가슴통증을 일으키므로 주의해야 한다.
<br><br>
6~8월 사이에 수확한다. 날로 먹거나 통조림·병조림·주스·잼 등으로 가공하여 먹는다. 종자는 한방에서 도인(桃仁)이라고 하여 약재로 쓴다.

</div>
	<div class="fruits" id="potato">
	<h1>감자</h1>
	감자는 마령서(馬鈴薯)·하지감자·북감저(北甘藷)라고도 한다. 페루·칠레 등의 안데스 산맥 원산으로 온대지방에서 널리 재배한다. 높이는 60∼100 cm이고 독특한 냄새가 난다. 땅속에 있는 줄기 마디로부터 기는줄기가 나와 그 끝이 비대해져 덩이줄기를 형성한다.
<br><br>
덩이줄기에는 오목하게 팬 눈 자국이 나 있고, 그 자국에서는 작고 어린 싹이 돋아난다. 땅위줄기의 단면은 둥글게 모가 져 있다. 잎은 줄기의 각 마디에서 나오는데 대개 3∼4쌍의 작은잎으로 된 겹잎이고 작은 잎 사이에는 다시 작은 조각잎이 붙는다.
<br><br>
6월경에 잎겨드랑이에서 긴 꽃대가 나와 취산꽃차례를 이루고 지름 2∼3 cm 되는 별 모양의 5갈래로 얕게 갈라진 엷은 자주색 또는 흰색의 꽃이 핀다. 꽃이 진 뒤에 토마토 비슷한 작은 열매가 달린다.
<br><br>
삶아서 주식 또는 간식으로 하고, 굽거나 기름에 튀겨 먹기도 한다. 소주의 원료와 알코올의 원료로 사용되고, 감자 녹말은 당면, 공업용 원료로 이용하는 외에 좋은 사료도 된다.
<br><br>
성분은 덩이줄기에 수분 75 %, 녹말 13∼20 %, 단백질 1.5∼2.6 %, 무기질 0.6∼1 %, 환원당 0.03 mg, 비타민 C 10~30 mg이 들어 있다. 질소화합물의 절반을 차지하는 아미노산 중에는 밀가루보다 더 많은 필수 아미노산이 함유되어 있다. 그리고 날감자 100 g은 열량 80 kcal에 해당한다.

</div>
	<div class="fruits" id="sweetpotato">
	<h1>고구마</h1>
	감서·단고구마라고도 한다. 한국 전역에서 널리 재배한다. 길이는 약 3m이며 줄기는 길게 땅바닥을 따라 뻗으면서 뿌리를 내린다. 잎은 어긋나고 잎몸은 심장 모양으로 얕게 갈라지며 잎과 줄기를 자르면 즙이 나온다. 줄기 밑쪽의 잎자루 기부에서 뿌리를 내는데, 그 일부는 땅속에서 커져 덩이뿌리인 고구마가 된다. 모양은 양쪽이 뾰족한 원기둥꼴에서 공 모양까지 여러 가지이고 빛깔도 흰색·노란색·연한 붉은색·붉은색·연한 자주색으로 다양하다.
<br><br>
꽃은 7∼8월에 잎겨드랑이에서 나온 꽃자루에 연한 홍색의 나팔꽃 모양으로 몇 개씩 달린다. 꽃받침은 5개로 갈라진다. 화관은 깔때기 모양이고 수술 5개와 암술 1개가 있다. 열매는 공 모양 삭과로 2∼4개의 흑갈색 종자가 여문다.
<br><br>
가을에 서리가 내리면 잎과 줄기는 시드는데, 이때 고구마를 캐어 보온저장하였다가 이듬해 봄 묘상(苗床)에 심으면 싹이 나온다. 싹을 잘라 밭에 심으면 뿌리를 내린다. 아열대·열대 지방에서는 1년 내내 시들지 않으므로 적당한 시기에 줄기를 잘라 번식한다. 재배할 때는 종자를 쓰지 않는다.
<br><br>
<h2>역사</h2>
고구마의 원산지는 멕시코에서 남아메리카 북부에 이르는 지역으로 추정되며 원종(原種)도 명백히 밝혀지지 않았다. 일반적으로 약 2000년 전부터 중·남아메리카에서 재배한 것으로 추측하고 있다. 신대륙을 발견한 당시에는 원주민들이 널리 재배하였는데, 크리스토퍼 콜럼버스에 의해서 에스파냐에 전해졌고 그 뒤 필리핀, 중국의 푸젠성[福建省]에 전해졌으며 차차 아시아 각국에 퍼졌다. 주로 아시아·아프리카에서 재배하며 서양에서는 생산량이 적다. 나라로는 중국·인도네시아·한국·브라질 등지에서 많이 재배한다.
<br><br>
<h2>재배</h2>
발효열 또는 전열(電熱)을 이용하는 묘상이나 비닐 묘상에 좋은 씨고구마를 눕혀서 묻으면 많은 싹이 나온다. 30∼40일이 지나서 싹이 30cm 정도 자라면 잘라서 60∼75cm의 높은 이랑을 만들고 그루 사이를 40cm 정도로 하여 심는다. 싹은 3∼4회 잘라낼 수 있다. 심은 싹이 뿌리를 내리려면 땅속의 온도가 18∼20℃ 이상 되어야 하므로 5월 하순∼6월 하순이 적기이며 보리 이랑 사이에 심기도 한다. 비료는 10아르(1000㎡)당 질소 6kg, 인산 5kg, 칼륨 15kg을 표준으로 하여 밑거름으로 준다. 특히 칼륨은 고구마가 커지는 데 매우 중요한 양분이다.
<br><br>
<h2>품종</h2>
전세계적으로 많은 품종이 있다. 외관과 맛, 자라는 속도, 흰색·노란색·붉은색·자주색 등의 속 빛깔, 점도 등에 따라 품종이 다양하다. 공업용으로는 녹말 함량이 많고 수확량이 많은 것이 좋고, 사료용으로는 고구마와 덩굴을 모두 수확할 수 있는 것을 선정한다. 한국에서는 충승 100호·수원 147호·신미(新美)·황미(黃美) 등의 품종을 재배한다.
<br><br>
<h2>용도</h2>
성분은 수분 69.39%, 당질 27.7%, 단백질 1.3% 등이며 주성분은 녹말이다. 제2차 세계대전 이전에는 대부분 식용으로 소비하였으나, 최근에는 식용이 40% 안팎에 그쳐 예전처럼 주식을 보조하는 식품이 아니라 주로 부식 또는 간식으로 이용한다.
<br><br>
공업용으로는 녹말용으로 30% 정도 사용하고 엿·포도당·과자류·식용가공품·의약품·화장품·알코올·위스키·소주 등의 원료로 많이 쓴다. 돼지 등의 가축 사료용으로도 쓰며 잎과 줄기는 땅의 생산력을 유지하는 풋거름으로 사용한다.




	</div>
	<div class="fruits" id="sweetpumpkin">
	<h1>단호박</h1>
	호박 가운데 전분과 미네랄·비타민 등의 함량이 많고 맛도 좋아 식용으로 재배하는 호박.<br>
	호박은 멕시코 남부 열대 아메리카 원산의 동양계 호박(C. moschata), 라틴아메리카 원산의 서양계 호박(C. maxima), 멕시코 북부와 북아메리카 원산의 페포계 호박(C. pepo) 3종류로 나뉜다. 단호박은 이 가운데 쪄서 먹거나 건강식으로 먹는 서양계 호박을 일컫는다. 맛이 밤처럼 달아 밤호박이라고도 한다.
<br><br>
녹말과 무기염류가 풍부하고, 비타민 B·C가 많이 들어 있어 주식 대용으로 먹기도 한다. 일본에서는 1800년대 중반부터 미국에서 도입해 재배하기 시작하였고, 한국에서는 1990년대부터 도입해 널리 재배하고 있다. 품종 개량도 활발하게 이루어져 여러 종류의 단호박이 재배되고 있는데, 대표적인 품종은 다음과 같다.
<br><br>
<h2>단호박의 종류</h2>
1.단비스는 가장 많이 재배되는 단호박으로, 무게는 1.7~1.9㎏이다. 겉은 짙은 녹색 바탕에 옅은 녹색 반점이 있다. 과육은 녹황색이며, 육질은 약간 끈적끈적한 전분질로, 맛이 좋다. 낮은 온도에서도 잘 자라며, 변형이 적어 상품률이 높다. 꽃이 핀 뒤 32일 정도 지나면 수확기에 접어드는 조생종이자 다수확 품종이다.

2. 슈퍼금비스의 평균 무게는 1.8㎏ 정도이다. 겉은 짙은 녹색이고, 줄무늬가 거의 보이지 않는다. 단호박 가운데 크기가 가장 크고, 저장력도 뛰어나다. 잘 재배하면 3㎏의 대형도 수확할 수 있다.

3. 슈퍼홍비스는 가장 늦게 개발된 품종으로, 무게는 1.5㎏ 안팎이다. 겉은 짙고 밝은 선홍색이며, 과육은 짙은 노란색이다. 육질은 두껍고, 고분질이며, 맛이 뛰어나다.


	</div>
	<div class="fruits" id="watermelon">
<h1>수박</h1>
	쌍떡잎식물 박목 박과의 덩굴성 한해살이풀.<br>
	서과(西瓜)·수과(水瓜)·한과(寒瓜)·시과(時瓜)라고도 한다. 줄기는 길게 자라서 땅 위를 기며 가지가 갈라진다. 잎은 잎자루가 있고 달걀 모양 또는 달걀 모양 긴 타원형이며 길이 10∼18cm이고 깃꼴로 깊게 갈라진다. 갈래조각은 3∼4쌍이고, 녹색빛을 띤 흰색이며 불규칙한 톱니가 있다.
<br><br>
암수한그루이다. 꽃은 5∼6월에 연한 노란색으로 피고 잎겨드랑이에 1개씩 달리며 화관은 5개로 갈래진다. 열매는 5∼6kg까지 비대하는 것이 보통이다. 종자는 달걀 모양이고 검은 갈색이다.
<br><br>
아프리카 원산으로 고대 이집트 시대부터 재배되었다고 하며, 각지에 분포된 것은 약 500년 전이라고 한다. 한국에는 조선시대 《연산군일기》(1507)에 수박의 재배에 대한 기록이 나타난 것으로 보아 그 이전에 들어온 것이 분명하다. 오늘날에는 일반재배는 물론 시설원예를 통한 연중재배가 이루어지고 있으며 우수한 품종은 물론 씨없는 수박도 생산되고 있다. 한방과 민간에서는 구창·방광염·보혈·강장 등에 쓴다. 꽃말은 '큰 마음'이다.
	</div>
	</div>
</div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>

