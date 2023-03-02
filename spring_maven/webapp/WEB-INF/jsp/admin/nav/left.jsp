<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar">
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">BBW-Admin</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

		<li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                        
                        <h6 class="collapse-header">메인 + 상품 등록 * 삭제</h6>
                        <a class="collapse-item" href="/admin/main_just">Main Just</a>
                        <a class="collapse-item" href="/admin/main_swiper">MainSwiperImg</a>
                        <a class="collapse-item" href="/admin/main_best">MainBestBrand</a>
                        
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">주문</h6>
                        <a class="collapse-item" href="/admin/order">Order</a>
                        
                         <h6 class="collapse-header">회원 관리</h6>
                        <a class="collapse-item" href="/admin/user_view">User View</a>
                        
                        <h6 class="collapse-header">공지사항 게시판</h6>
                        <a class="collapse-item" href="/admin/board_list/">Board List</a>
                        <a class="collapse-item" href="/admin/board_regist">Board Regist</a>
                        
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>
            
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    