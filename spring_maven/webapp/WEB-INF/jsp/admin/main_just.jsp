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
				<div class="container-fluid">
					<div class="card shadow mb-4">
                        <div class="card-header py-3">                            
                            <a href="/admin/detail_main_just" class="btn btn-primary btn-icon-split">                    
			                    <span class="text">등록</span>
			                </a>			                
			                <a href="#" id="btn_delete" class="btn btn-warning btn-icon-split">                    
			                    <span class="text">삭제</span>
			                </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>
                                        		<a href="#" id="btn_all_delete" class="btn btn-warning btn-icon-split">                    
			                    					<span class="text">선택</span>
			                					</a>
			                				</th>
                                            <th id="date_desc">seq</th>
                                            <th>url</th>
                                            <th>brand</th>
                                            <th>name</th>
                                            <th>color</th>
                                            <th>category</th>
                                            <th>price_sale</th>
                                            <th>date</th>
                                            <th>edit</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>                                        
                                        
                                    </tbody>
                                </table>
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
    
    <jsp:include page="nav/js.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
</body></html>
<script>
	var isCheckedAll = false;
	
	window.onload = function(){
		// 리스트 가지고 와서 렌더링
		// 다중체크를 위함 
		cmm.ajax('/admin/ajax_main_just','',callBackFnc);
		$('#btn_delete').click(function(){
			var seqs = ''; // 1,4,6,8
			var idx = 0;
			$('tbody > tr input').each(function(){				
				if($(this).is(":checked")){ // 체크된 상태만 삭제
					var seq = $(this).attr('dataSeq');
					if(idx == 0) seqs+=seq;
					else seqs+=','+seq;
					idx++;
				}								
			});
			if(seqs != ''){
				cmm.ajax('/admin/ajax_ins_upd_del_main_just','mainJust.seqs='+seqs+'&mainJust.cmd=delete',callBackSuccessFnc);
			}
		});
		
		$('#btn_all_delete').click(function(){
			$('tbody > tr input').each(function(){				
				// 체크 상태로 변경
				if(isCheckedAll == true) $(this).prop("checked", false);
				if(isCheckedAll == false) $(this).prop("checked", true);								
			});
			isCheckedAll = !isCheckedAll;
			/* if(isCheckedAll == true) isCheckedAll = false;
			else if(isCheckedAll == false) isCheckedAll = true; */
		});		
	}	
	
	function callBackSuccessFnc(res){
		var master = $.parseJSON(res);  
		var str = '';
		if(master.code == '0000'){
			cmm.messageModal('info','0000','수정 되었습니다.');			
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
	
	//게시글 수정 담아온거 뿌리기 준현  
	function callBackFnc(res){
		var master = $.parseJSON(res);
		var str = '';
		if(master.code == '0000'){
			var listMainJust = master.listMainJust;
			for (var i = 0; i < listMainJust.length; i++) {
				var o = listMainJust[i];
				var brand =o.brand; //: "Jordan"
				var category =o.category; //: ""
				var color =o.color; //: "BLACK"
				var date =o.date; //: "2022-08-18"								
				var name =o.name; //: "Jordan 1 Retro High OG Black Mocha"				
				var price =o.price; //: 604000
				var price_public =o.price_public; //: 2000
				var price_recent =o.price_recent; //: 1000
				var price_sale =o.price_sale; //: 1100
				var seq =o.seq; //: 1				
				var url =o.url; //: "https://kre
				
				str+='<tr>';
				str+='    <th>';
				str+='		<div class="custom-control custom-checkbox">';
				str+='    		<input type="checkbox" dataSeq="'+seq+'">';				
				str+='		</div>';
				str+='	  </th>';
				str+='    <th>'+seq+'</th>';
				str+='    <th><img src="'+url+'" style="width:100px;"></th>';
				str+='    <th>'+brand+'</th>';
				str+='    <th>'+name+'</th>';
				str+='    <th>'+color+'</th>';
				str+='    <th>'+category+'</th>';
				str+='    <th>'+price_sale+'</th>';
				str+='    <th>'+date+'</th>';
				str+='    <th>';
				//게시글 수정 버튼
				str+='    	  <a href="/admin/detail_main_just?seq='+seq+'" class="btn btn-warning btn-circle btn-lg">';
				str+='    	  	<i class="fas fa-exclamation-triangle"></i>';
				str+='		  </a>';
				str+='	  </th>';
				str+='</tr>';
			}				
			$('tbody').html(str);
			$('#dataTable').DataTable();
			cmm.dataTableDesc();			
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
</script>