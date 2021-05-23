let classifier;
// 모델 불러오기
const URL = "/resources/model/";
let btnName = document.querySelector('#btn_name');
const modelURL = URL + "model.json";
const metadataURL = URL + "metadata.json";
let result = "";
let newRes;
async function init() {

	if (btnName.value == 'on') {

		if (document.querySelector("#webcam-container>canvas")) {

					document.querySelector("#webcam-container").removeChild(webcam.canvas);
		}
		btnName.innerHTML = "Stop";	//버튼 클릭시 Stop로 변경
		btnName.value = "off";
		
		model = await tmImage.load(modelURL, metadataURL);	//모델불러오기
		maxPredictions = model.getTotalClasses();

		// Convenience function to setup a webcam(웹캠 설정)
		const flip = true; // whether to flip the webcam
		webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
		await webcam.setup(); // request access to the webcam
		await webcam.play();
		window.requestAnimationFrame(loop);

		// append elements to the DOM
		document.getElementById("webcam-container").appendChild(webcam.canvas);
		labelContainer = document.getElementById("label-container");
		for (let i = 0; i < maxPredictions; i++) { // and class labels
			//console.log(maxPredictions); 정확도 확인용
			labelContainer.appendChild(document.createElement("div"));
		}
	} else {

		document.querySelector('.result-btn').innerHTML = newRes;	//인식결과버튼
		document.querySelector('.result-btn').setAttribute('value', result);
		
		end();
		if(document.querySelector('#fitting2 input')){
			
		document.querySelector('#fitting2 input').setAttribute('value', newRes);
		}

		capture();
	}
}

async function loop() {
	webcam.update(); // update the webcam frame
	await predict();
	window.requestAnimationFrame(loop);

}


// 이미지 예측
async function predict() {
	// predict can take in an image, video or canvas html element
	const prediction = await model.predict(webcam.canvas);


	let predictArr = [];
	let newLabeles = [7, 4, 2, 5, 3, 1, 8, 6];

	for (let i = 0; i < maxPredictions; i++) {
		const classPrediction =
			prediction[i].className + ": " + prediction[i].probability.toFixed(2);
		labelContainer.childNodes[i].innerHTML = classPrediction;

		predictArr.push(prediction[i].probability.toFixed(2));
		//console.log(predictArr);

		//결과 확인용
		if (prediction[i].probability.toFixed(2) > 0.5) {


			//console.log("예측값 : " + classPrediction);
			result = prediction[i].className;
			newRes = newLabeles[i];
			console.log("new label : " + newRes);
		}
		//캡쳐랑 라벨 보내기 : avatar/fitting 로 데이터 넘기기

	}
	//result = predictArr.indexOf(Math.max(...predictArr));
	//console.log("높은 예측값 predictArr: " + result);
	//인덱스 구하기

}






async function end() {

	btnName.innerHTML = "Start";
	btnName.value = 'on';


	labelContainer.innerHTML = "";

}

//미사용
/*function capture() {
	html2canvas(document.querySelector("#webcam-container"), {
		onrendered: function(canvas) {
			var img = canvas.toDataURL("image/png");
			console.log(img);
			document.querySelector("#label-container").append('<img src=' + img + '>'); // capture 내용이 보여짐
			window.open(img); // 이미지를 윈도우 팝업으로..

		}
	});
}
*/
