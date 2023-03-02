<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a id="triggerCommonModal" href="#" data-toggle="modal" data-target="#commonModal" style="display: none;"></a>   
<div class="modal fade" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>








<a id="triggerProgressbarModal" href="#" data-toggle="modal" data-target="#progressbarModal" style="display: none;"></a>
<div class="modal fade" id="progressbarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
	    <div class="card mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">이미지 업로드 중입니다......</h6>
	        </div>
	        <div class="card-body">
	            <div class="mb-1 small">testFile.zip</div>
	            <div class="progress mb-4">
	                <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
	            </div>	            
	        </div>
	    </div>
	</div>
</div>