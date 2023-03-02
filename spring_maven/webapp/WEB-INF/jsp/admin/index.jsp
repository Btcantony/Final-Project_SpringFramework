<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
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
                	<div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the area chart can be found in the
                                    <code>/js/demo/chart-area-demo.js</code> file.
                                </div>
                            </div>

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the bar chart can be found in the
                                    <code>/js/demo/chart-bar-demo.js</code> file.
                                </div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the donut chart can be found in the
                                    <code>/js/demo/chart-pie-demo.js</code> file.
                                </div>
                            </div>
                        </div>
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
<script>
	window.onload = function(){
		cmm.ajax('/admin/ajax_order_statistics', '', callOrderStatisticsBackFnc);	
	}
	
	function callOrderStatisticsBackFnc(res){
		var master = $.parseJSON(res);
		if(master.code == '0000'){
			// 라인차트 (최근 일주일 날짜별 주문금액)	
			var lst = master.listOrderStatistics;
			var _labels = [];
			var _data = [];
			for (var i = 0; i < lst.length; i++) {
				var itm = lst[i];
				_labels.push(itm.dt);
				_data.push(itm.total_price);
			}
			cmm.drawChart('line',_labels,_data);
			
			// 도넛차트 (MAIN_JUST 카테고리별 개수)	
			var lst = master.listCateStatistics;
			var _labels = [];
			var _data = [];
			for (var i = 0; i < lst.length; i++) {
				var itm = lst[i];
				_labels.push(itm.dt);
				_data.push(itm.total_price);
			}
			cmm.drawChart('doughnut',_labels,_data);
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}			
	}
</script>