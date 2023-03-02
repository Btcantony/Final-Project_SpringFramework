<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="author"content="Copyright © it-partner Corporation. All Rights Reserved.">
	<meta name="description" content="설명">
	<meta name="robots" content="all">
	<title>테스트</title>
	<meta property="og:title" content="테스트">
	<meta property="og:site_name" content="테스트">
	<meta property="og:type" content="website">
	<meta property="og:url" content="https://it-partner.co.kr">
	<link rel="canonical" href="https://it-partner.co.kr">
	<link rel="alternate" href="https://it-partner.co.kr">
	
	<!-- CSS -->
	<link href="/resources/_nuxt/css/1381ce9.css" rel="stylesheet" />
	<link href="/resources/_nuxt/css/734fa9a.css" rel="stylesheet" />
	<link href="/resources/_nuxt/css/9c5ecb4.css" rel="stylesheet" />
	<link href="/resources/_nuxt/css/549cef8.css" rel="stylesheet" />
	
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>		
</head>

<!-- CHAT CSS -->
<link href="/resources/_nuxt/css/chat.css" rel="stylesheet" />

<!-- CHAT JS -->					
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<div class="header_top" style="display:;" data-v-5875f283="">
						<div class="top_inner" data-v-5875f283="">
							<ul class="top_list" data-v-5875f283="">
								<li class="top_item" data-v-5875f283="">
									<a href="/notice" class="top_link" data-v-5875f283=""> 고객센터 </a>
								</li>
								<li class="top_item" data-v-5875f283="">
									<a href="/my/wish" class="top_link" data-v-5875f283=""> 관심상품 </a>
								</li>
								<li class="top_item" data-v-5875f283="">
									<a href="/my" class="top_link" data-v-5875f283=""> 마이페이지 </a>
								</li>
								<li class="top_item" data-v-5875f283="">
									<a href="/login" class="top_link" data-v-5875f283=""> 로그인 </a>
								</li>
								<li class="top_item" data-v-5875f283="">
									<a href="/" class="top_link" data-v-5875f283=""> 로그아웃 </a>
								</li>
							</ul>
						</div>
					</div>
					<div class="header_main" data-v-5875f283="">
						<div class="main_inner" data-v-5875f283="">
							<h1 data-v-5875f283="">
								<a href="/" aria-label="홈" class="logo" data-v-5875f283="">
									<img alt="" src="/resources/_nuxt/img/logo.png">
								</a>
							</h1>
							<div class="gnb_area" data-v-5875f283="">
								<nav class="gnb" data-v-5875f283="">
									<ul class="gnb_list" data-v-5875f283="">
										<li class="gnb_item" data-v-5875f283="">
											<a href="/social/trending" class="gnb_link" data-v-5875f283=""> STYLE </a>
										</li>
										<li class="gnb_item" data-v-5875f283="">
											<a href="#" class="gnb_link" data-v-5875f283=""> SHOP </a>
										</li>
										<li class="gnb_item" data-v-5875f283="">
											<a href="/about" target="_blank" class="gnb_link" data-v-5875f283=""> ABOUT </a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="container" data-v-1e7cdca6 data-v-3007c576>
					<!--
					Inspired by https://dribbble.com/supahfunk
					-->
					<section class="avenue-messenger" style="display: none;">
					  <div class="menu">
					   <div class="items"><span>
					     <a href="#" title="Minimize">&mdash;</a><br>
					<!--     
					     <a href="">enter email</a><br>
					     <a href="">email transcript</a><br>-->
					     <a href="#" title="End Chat">&#10005;</a>
					     
					     </span></div>
					    <div class="button">...</div>
					  </div>
					  <div class="agent-face">
					    <div class="half">
					     <img class="agent circle" src="http://askavenue.com/img/17.jpg" alt="Jesse Tino"></div>
					  </div>
					<div class="chat">
					  <div class="chat-title">
					    <h1>Jesse Tino</h1>
					    <h2>RE/MAX</h2>
					  <!--  <figure class="avatar">
					      <img src="http://askavenue.com/img/17.jpg" /></figure>-->
					  </div>
					  <div class="messages">
					    <div class="messages-content">
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg"></figure>Hi there, I'm Jesse and you?<div class="timestamp">17:9</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    	
					    	<div class="message message-personal new">dsadsa<div class="timestamp">17:10</div><div class="checkmark-sent-delivered">✓</div><div class="checkmark-read">✓</div></div>
					    </div>
					  </div>
					  <div class="message-box">
					    <input type="text" class="message-input" placeholder="Type message...">
					    <button type="submit" class="message-submit">Send</button>
					  </div>
					</div>
					  </div>
					<!--<div class="bg"></div>-->						   
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(window).load(function() {
		
	});
</script>
<script type="text/javascript">

//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	sendMessage();
	$('#msg').val('')
});

var sock = new SockJS('http://localhost:8080/chatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	sock.send($("#msg").val());
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	var user = '${pr.username}';
	var str = user + " 님이 퇴장하셨습니다.";
	
	$("#msgArea").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
	var user = '${pr.username}';
	var str = user + "님이 입장하셨습니다.";
	
	$("#msgArea").append(str);
}

</script>
<script src="/resources/_nuxt/js/chat.js"></script>
</html>
