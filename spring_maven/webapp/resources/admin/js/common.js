var Common = function()
{	
	this.ajax = function(_url, _data, callBackFnc)
    {
		$.LoadingOverlay("show");
		$.ajax({
            type : "POST",
            url : _url,
            data : _data,
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
            	$.LoadingOverlay("hide"); 
            	callBackFnc(res);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
                $.LoadingOverlay("hide");
            }
        });
    }
	
	this.messageModal = function(_type, _code, _msg)
    {	
		if(_type == 'error') $('#commonModal .modal-footer').hide();		
		else if(_type == 'confirm') $('#commonModal .modal-footer').show();
		else if(_type == 'success'){
			$('#commonModal .modal-footer').hide();
			$('#commonModal .close').click(function(){
				history.back();
			});
		}else if(_type == 'info'){
			$('#commonModal .modal-footer').hide();
			$('#commonModal .close').click(function(){
				location.reload();
			});
		}  
		
		$('.modal-title').text(_code);
		$('.modal-body').text(_msg);
		
		$('#triggerCommonModal').trigger('click');
    }
	
	this.dataTableDesc = function()
    {		
		setTimeout(function() {
			$('#date_desc').trigger('click');
		}, 500);		
    }

	this.fileUpload = function(inputId, successFunction)
    {
		if($('#'+inputId)[0].files[0] == undefined){
			successFunction(null);
		}else{
			// 파일 이름 적용
			$('#progressbarModal > .mb-1.small').text($('#'+inputId)[0].files[0].name);
			var size = $('#'+inputId)[0].files[0].size;
			
			var formData = new FormData();					
			formData.append('file',$('#'+inputId)[0].files[0]);	
			
	    	$.ajax({
	    		url : '/admin/fileUpload',
	    		processData: false,
	    		contentType: false,
	    		data: formData,
	    		type: 'POST',	
	    		beforeSend:function(){
	    			$.LoadingOverlay("show");
	    		},
	    		complete:function(){	    			
	    			$.LoadingOverlay("hide");
	    					
	    		},
	    		success : function(data){			    			
	    			successFunction(data);			
	    		},
	    		error : function(request,status,error){
	    			alert(error);
	    			if(errorFunction!=undefined){
	    				errorFunction(request,status,error);
	    			}			
	    		},
	    		fail : function() {
	    			alert("인터넷 연결 상태를 확인해주세요.");
	    		}
	    	});
		}		
    }
	
	this.fileUploadUI = function(inputId, successFunction)
    {
		if($('#'+inputId)[0].files[0] == undefined){
			successFunction(null);
		}else{
			// 파일 이름 적용
			$('#progressbarModal > .mb-1.small').text($('#'+inputId)[0].files[0].name);
			var size = $('#'+inputId)[0].files[0].size;
			
			var formData = new FormData();					
			formData.append('file',$('#'+inputId)[0].files[0]);	
			
	    	$.ajax({
	    		url : '/admin/fileUpload',
	    		processData: false,
	    		contentType: false,
	    		data: formData,
	    		type: 'POST',	
	    		beforeSend:function(){
	    			//$.LoadingOverlay("show");
	    		},
	    		complete:function(){	    			
	    			//$.LoadingOverlay("hide");
	    					
	    		},
	    		success : function(data){			    			
	    			successFunction(data);			
	    		},
	    		error : function(request,status,error){
	    			alert(error);
	    			if(errorFunction!=undefined){
	    				errorFunction(request,status,error);
	    			}			
	    		},
	    		fail : function() {
	    			alert("인터넷 연결 상태를 확인해주세요.");
	    		}
	    	});
		}		
    }
	
	this.drawChart = function(_type, _labels, _data)
    {
		if(_type == 'line'){
			drawChartLine(_labels, _data);
		}else if(_type == 'doughnut'){
			drawChartDoughnut(_labels, _data);
		}				
    }	
}

var cmm = new Common();

// ------------------------ CHART START ------------------------ //
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// 라인 차트
function drawChartLine(_labels, _data){
	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: _labels, //["1월", "6월"],
	    datasets: [{
	      label: "Earnings",
	      lineTension: 0.3,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: _data, //[5000, 10000],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return '$' + number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
	        }
	      }
	    }
	  }
	});
}

// 도넛 차트
function drawChartDoughnut(_labels, _data){
	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: _labels,
	    datasets: [{
	      data: _data,
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
}
