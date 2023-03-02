<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="main.java.com.web.dto.upbit.UpbitUser"%>
<%@ page import="main.java.com.web.dto.upbit.UpbitUserAccount"%>   
<%@ page import="main.java.com.web.dto.upbit.UpbitMarket"%>  

<%@ page import="java.util.List"%>   
<html lang="en">

<head>
    <jsp:include page="nav/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
</head>

<body id="page-top" class="sidebar-toggled">    
    <div id="wrapper">    	
    	<jsp:include page="nav/left.jsp">
			<jsp:param name="test" value="" />
		</jsp:include>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
				<jsp:include page="nav/top.jsp">
					<jsp:param name="test" value="" />
				</jsp:include>
				
				<!-- Begin Page Content -->
                <div class="container-fluid">
                	<!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800" id="result">Dashboard</h1>                        
                    </div>                        
                    <!-- Content Row -->
                    <div class="row" id="accounts">    
                    	<div class="col-xl-3 col-md-6 mb-4 item" id="account_KRW-KRW">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1 title">
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 content"></div>
                                        </div>	                                        
                                    </div>
                                </div>
                            </div>
                        </div>               	
                        <%
                        	List<UpbitMarket> upbitMarkets = (List<UpbitMarket>)request.getAttribute("upbitMarkets");
	                        for(UpbitMarket upbitMarket : upbitMarkets){	                        		                    	  
                        %>
                        	<div class="col-xl-3 col-md-6 mb-4 item" id="account_<%=upbitMarket.getMarket()%>">
	                            <div class="card border-left-primary shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1 title">
	                                            </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800 content"></div>
	                                        </div>	                                        
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        <%} %>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2021</span>
                    </div>
                </div>
            </footer>
        </div>       
    </div>

    <jsp:include page="modal/modal.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
    
    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/js/chart.js"></script>
    
    <jsp:include page="nav/js.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
	
    
</body></html>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	var sock = new SockJS('http://localhost:8080/chatting');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage() {
		sock.send($("#msg").val());
	}
	//서버에서 메시지를 받았을 때
	function onMessage(evt) {
		console.log('receive......');
		var data = evt.data;
		var upbit = $.parseJSON(data);
		var s = '';
		if(upbit.code == '0000'){
			// 사용자
			var upbitUser = upbit.upbitUser;
			
			// 코인정보
			var upbitTickers = upbit.upbitTickers
			var tics = jQuery.grep(upbitTickers, function( a ) {
		          if(a.market == 'KRW-XRP')    		
		        	  return a;
		    	});
			//console.log(tics[0].trade_price);
			// 사용자 자산
			var accounts = upbit.upbitUser.upbitUserAccounts;
			var total_up_buy = 0;
			var total_up_cur = 0;
			$('#accounts > .item').hide();
			$('#account_KRW-KRW').show();
			for (var i = 0; i < accounts.length; i++) {
				var account = accounts[i];
				var avg_buy_price = Number(account.avg_buy_price);
				var avg_buy_price_modified = account.avg_buy_price_modified;
				var balance = Number(account.balance);
				var currency = account.currency;
				var locked = account.locked;
				var market = account.market;
				var unit_currency = account.unit_currency;
				var buy_total = avg_buy_price * balance;
				var trade_price = 0;
				
				// 현재가
				var tics = jQuery.grep(upbitTickers, function( a ) {
			          if(a.market == market)    		
			        	  return a;
			    	});
				if(tics.length == 1) trade_price = Number(tics[0].trade_price);
				var now_total = trade_price * balance;
				if(market == 'KRW-KRW'){
					buy_total = balance;
					now_total = balance;
				} 
				$('#account_'+market).find('.title').text(market+'('+avg_buy_price+'/'+trade_price+')['+balance+']');
				$('#account_'+market).find('.content').text(buy_total+'/'+now_total);
				total_up_buy += buy_total;
				total_up_cur += now_total;
				$('#account_'+market).show();
			}
			// 전체 금액
			$('#result').text(Math.ceil(total_up_buy)+'<=>'+Math.ceil(total_up_cur));
			
			// 마켓
			var upbitMarkets = upbit.upbitMarkets;
		}
	}
	//채팅창에서 나갔을 때
	function onClose(evt) {		
		console.log('onClose : '+evt);		
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {		
		console.log('onOpen : '+evt);
	}
	 
	var upbitUserJson = '<%=request.getAttribute("upbitUserJson")%>';  
	window.onload = function(){
		var upbitUser = $.parseJSON(upbitUserJson)
		var access_key = upbitUser.access_key;
		var secret_key = upbitUser.secret_key;
		var img_url = upbitUser.img_url;
		var name = upbitUser.name;
		var reg_date = upbitUser.reg_date;
		var run_code = upbitUser.run_code;
		var status_code = upbitUser.status_code;
		
		setInterval(function() {
			sock.send('{"tp":"call","access_key":"'+access_key+'","secret_key":"'+secret_key+'"}');
		}, 1000);
	}		
</script>