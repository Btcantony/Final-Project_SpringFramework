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
			                <a href="javascript:void(0);" id="btn_delete" class="btn btn-warning btn-icon-split">                    
			                    <span class="text">회원 추방</span>
			                </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>delete</th>
                                            <th id="date_desc">email</th>
                                            <th>img_url</th>
                                            <th>nick_name</th>
                                            <th>phone_num</th>
                                                                                     
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
var email = <%=request.getParameter("email")%>;

window.onload = function(){
	// 리스트 가지고 와서 렌더링
	// 다중체크를 위함 
	cmm.ajax('/admin/ajax_user_view','',callBackFnc);
	
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

function callBackFnc(res){
	var master = $.parseJSON(res);
	var str = '';
	if(master.code == '0000'){
		var listJoin = master.listJoin;
		for (var i = 0; i < listJoin.length; i++) {
			var o = listJoin[i];
       		var email = o.email;
       		var image_url = o.image_url;
       		var nick_name = o.nick_name;
        	var phone_num = o.phone_num;
        		
        	str+='<tr>';
			str+='    <th>';
			str+='		<div class="custom-control custom-checkbox">';
			str+='    		<input type="checkbox" dataSeq="'+email+'">';				
			str+='		</div>';
			str+='	  </th>';
			str+='    <th>'+email+'</th>';
			str+='    <th><img src="'+image_url+'" style="width:100px;"></th>';
			str+='    <th>'+nick_name+'</th>';
			str+='    <th>'+phone_num+'</th>';
			str+='</tr>';
		}				
		$('tbody').html(str);
		$('#dataTable').DataTable();
		cmm.dataTableDesc();			
	}else{
		cmm.messageModal('error', master.code, master.msg);			
	}
}

$('#btn_delete').click(function(){
	var emails = ''; // 1,4,6,8
	var idx = 0;
	
	// 체크된 체크박스에 dataSeq 값을 1,4,6,8 담는다 
	$('tbody > tr input').each(function(){				
		if($(this).is(":checked")){ // 체크된 상태만 삭제
			var email = $(this).attr('dataSeq');
			if(idx == 0) emails+=email;
			else emails+=','+email;
			idx++;
		}								
	});
	
	$.ajax({
        type : "POST",
        url : "/admin/ajax_user_delete",
        data : 'join.emails='+emails,
        success : function(res){
        	window.location = '/admin/user_view';						            
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });
	
	
});

</script>
