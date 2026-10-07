<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="sidebar" id="sidebar">

    <!-- BRAND -->
    <div class="sidebar-brand medicaps-brand">
        <img src="${pageContext.request.contextPath}/images/medicaps-logo.png"
             alt="Medi-Caps University"
             class="medicaps-university-logo">
    </div>


    <!-- NAVIGATION -->
    <nav class="sidebar-nav">

        <!-- MAIN -->
        <div class="nav-section-title">
            MAIN
        </div>

        <a href="${pageContext.request.contextPath}/dashboard"
           class="nav-item active">
            <i class="fa-solid fa-chart-pie"></i>
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/laboratories"
           class="nav-item">
            <i class="fa-solid fa-flask"></i>
            <span>Laboratories</span>
        </a>

        <a href="${pageContext.request.contextPath}/schedule"
           class="nav-item">
            <i class="fa-solid fa-calendar-days"></i>
            <span>Schedule</span>
        </a>

        <a href="${pageContext.request.contextPath}/bookings"
           class="nav-item">
            <i class="fa-solid fa-calendar-check"></i>
            <span>Bookings</span>
        </a>


        <!-- MANAGEMENT -->
        <div class="nav-section-title">
            MANAGEMENT
        </div>

        <a href="${pageContext.request.contextPath}/equipment"
           class="nav-item">
            <i class="fa-solid fa-computer"></i>
            <span>Equipment</span>
        </a>

        <a href="${pageContext.request.contextPath}/maintenance"
           class="nav-item">
            <i class="fa-solid fa-screwdriver-wrench"></i>
            <span>Maintenance</span>
        </a>

        <a href="${pageContext.request.contextPath}/reports"
           class="nav-item">
            <i class="fa-solid fa-chart-column"></i>
            <span>Reports</span>
        </a>


        <!-- INTELLIGENCE -->
        <div class="nav-section-title">
            INTELLIGENCE
        </div>

        <a href="${pageContext.request.contextPath}/ai-assistant"
           class="nav-item ai-nav-item">

            <i class="fa-solid fa-robot"></i>

            <span>AI Lab Assistant</span>

            <span class="ai-badge">AI</span>

        </a>


        <!-- SYSTEM -->
        <div class="nav-section-title">
            SYSTEM
        </div>

        <a href="${pageContext.request.contextPath}/settings"
           class="nav-item">

            <i class="fa-solid fa-gear"></i>

            <span>Settings</span>

        </a>

    </nav>


    <!-- SIDEBAR BOTTOM -->
    <div class="sidebar-bottom">

        <div class="sidebar-help">

            <div class="help-icon">
                <i class="fa-regular fa-circle-question"></i>
            </div>

            <div class="help-content">
                <strong>Need Help?</strong>
                <span>Contact system administrator</span>
            </div>

        </div>


        <a href="${pageContext.request.contextPath}/logout"
           class="logout-item">

            <i class="fa-solid fa-right-from-bracket"></i>

            <span>Logout</span>

        </a>

    </div>

</aside>

