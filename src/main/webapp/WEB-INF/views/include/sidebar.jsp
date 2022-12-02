<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Sidebar Start -->
        
                <a href="index.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Jhon Doe</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="./" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="button.jsp" class="dropdown-item">Buttons</a>
                            <a href="typography.jsp" class="dropdown-item">Typography</a>
                            <a href="element.jsp" class="dropdown-item">Other Elements</a>
                        </div>
                    </div>
                    
                    <a href="form" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>글쓰기</a>
                    <a href="qnaPageAll?qnaNum=1" class="nav-item nav-link"><i class="fa fa-table me-2"></i>전체글</a>
                    <a href="./" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                    <a href="map_s1" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">맵S1</a>
                    <a href="map_s2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">맵S2</a>
                    <a href="map_s3" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">맵S3</a>
                          
                </div>
          
        <!-- Sidebar End -->
