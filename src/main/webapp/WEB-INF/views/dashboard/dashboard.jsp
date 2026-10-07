<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Medi-Caps | Laboratory Dashboard</title>

    <!-- Google Font -->

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Common CSS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/common.css">

    <!-- Dashboard CSS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

</head>


<body>

<div class="app-layout">

    <!-- =========================
         SIDEBAR
         ========================= -->

    <%@ include file="../common/sidebar.jsp" %>


    <!-- =========================
         MAIN CONTENT
         ========================= -->

    <main class="main-content">

        <!-- Header -->

        <%@ include file="../common/header.jsp" %>


        <!-- =========================
             DASHBOARD CONTENT
             ========================= -->

        <div class="page-content dashboard-page">


            <!-- Welcome -->

            <section class="dashboard-welcome">

                <div class="welcome-content">

                    <h2>
                        Welcome back, Administrator 👋
                    </h2>

                    <p>
                        Here's what's happening across the university laboratories today.
                    </p>

                </div>


                <div class="dashboard-date">

                    <i class="fa-regular fa-calendar"></i>

                    <span>
                        Monday, 23 September 2026
                    </span>

                </div>

            </section>


            <!-- =========================
                 STATISTICS
                 ========================= -->

            <section class="stats-grid">


                <!-- Total Labs -->

                <div class="stat-card">

                    <div class="stat-card-top">

                        <div class="stat-icon blue">

                            <i class="fa-solid fa-flask"></i>

                        </div>

                        <i class="fa-solid fa-ellipsis stat-menu"></i>

                    </div>

                    <p class="stat-label">

                        Total Laboratories

                    </p>

                    <h3 class="stat-value">

                        ${totalLaboratories}

                    </h3>

                    <div class="stat-bottom">

                        <span class="stat-change up">

                            <i class="fa-solid fa-arrow-up"></i>

                            Database

                        </span>

                        <span class="stat-description">

                            registered laboratories

                        </span>

                    </div>

                </div>


                <!-- Available Labs -->

                <div class="stat-card">

                    <div class="stat-card-top">

                        <div class="stat-icon green">

                            <i class="fa-solid fa-circle-check"></i>

                        </div>

                        <i class="fa-solid fa-ellipsis stat-menu"></i>

                    </div>

                    <p class="stat-label">

                        Available Labs

                    </p>

                    <h3 class="stat-value">

                        ${activeLaboratories}

                    </h3>

                    <div class="stat-bottom">

                        <span class="stat-change up">

                            <i class="fa-solid fa-circle-check"></i>

                            Active

                        </span>

                        <span class="stat-description">

                            currently available

                        </span>

                    </div>

                </div>


                <!-- Occupied Labs -->

                <div class="stat-card">

                    <div class="stat-card-top">

                        <div class="stat-icon orange">

                            <i class="fa-solid fa-users"></i>

                        </div>

                        <i class="fa-solid fa-ellipsis stat-menu"></i>

                    </div>

                    <p class="stat-label">

                        Total Capacity

                    </p>

                    <h3 class="stat-value">

                        ${totalCapacity}

                    </h3>

                    <div class="stat-bottom">

                        <span class="stat-change warning">

                            <i class="fa-solid fa-users"></i>

                            Capacity

                        </span>

                        <span class="stat-description">

                            total available seats

                        </span>

                    </div>

                </div>


                <!-- Maintenance -->

                <div class="stat-card">

                    <div class="stat-card-top">

                        <div class="stat-icon red">

                            <i class="fa-solid fa-screwdriver-wrench"></i>

                        </div>

                        <i class="fa-solid fa-ellipsis stat-menu"></i>

                    </div>

                    <p class="stat-label">

                        Under Maintenance

                    </p>

                    <h3 class="stat-value">

                        ${maintenanceLaboratories}

                    </h3>

                    <div class="stat-bottom">

                        <span class="stat-change danger">

                            <i class="fa-solid fa-triangle-exclamation"></i>

                            Attention

                        </span>

                        <span class="stat-description">

                            requires action

                        </span>

                    </div>

                </div>

            </section>


            <!-- =========================
                 MAIN DASHBOARD GRID
                 ========================= -->

            <section class="dashboard-grid">


                <!-- =========================
                     LABORATORY OVERVIEW
                     ========================= -->

                <div class="dashboard-card">

                    <div class="card-header">

                        <div class="card-title-area">

                            <h3>
                                Laboratory Overview
                            </h3>

                            <p>
                                Current laboratory availability
                            </p>

                        </div>

                        <a href="${pageContext.request.contextPath}/laboratories"
                           class="card-action">

                            View All

                            <i class="fa-solid fa-arrow-right"></i>

                        </a>

                    </div>


                    <div class="lab-list">


                        <!-- Lab 1 -->

                        <div class="lab-row">

                            <div class="lab-icon">

                                <i class="fa-solid fa-computer"></i>

                            </div>

                            <div class="lab-info">

                                <h4>
                                    Computer Laboratory 01
                                </h4>

                                <span>
                                    Academic Block
                                </span>

                            </div>

                            <div class="lab-capacity">

                                60 Seats

                            </div>

                            <span class="status-badge available">

                                Available

                            </span>

                        </div>


                        <!-- Lab 2 -->

                        <div class="lab-row">

                            <div class="lab-icon">

                                <i class="fa-solid fa-network-wired"></i>

                            </div>

                            <div class="lab-info">

                                <h4>
                                    Networking Laboratory
                                </h4>

                                <span>
                                    Engineering Block
                                </span>

                            </div>

                            <div class="lab-capacity">

                                45 Seats

                            </div>

                            <span class="status-badge occupied">

                                Occupied

                            </span>

                        </div>


                        <!-- Lab 3 -->

                        <div class="lab-row">

                            <div class="lab-icon">

                                <i class="fa-solid fa-microchip"></i>

                            </div>

                            <div class="lab-info">

                                <h4>
                                    IoT Laboratory
                                </h4>

                                <span>
                                    Research Block
                                </span>

                            </div>

                            <div class="lab-capacity">

                                40 Seats

                            </div>

                            <span class="status-badge available">

                                Available

                            </span>

                        </div>


                        <!-- Lab 4 -->

                        <div class="lab-row">

                            <div class="lab-icon">

                                <i class="fa-solid fa-robot"></i>

                            </div>

                            <div class="lab-info">

                                <h4>
                                    AI &amp; Robotics Laboratory
                                </h4>

                                <span>
                                    Innovation Block
                                </span>

                            </div>

                            <div class="lab-capacity">

                                35 Seats

                            </div>

                            <span class="status-badge maintenance">

                                Maintenance

                            </span>

                        </div>


                    </div>

                </div>


                <!-- =========================
                     TODAY'S SCHEDULE
                     ========================= -->

                <div class="dashboard-card">

                    <div class="card-header">

                        <div class="card-title-area">

                            <h3>
                                Today's Schedule
                            </h3>

                            <p>
                                Laboratory activities
                            </p>

                        </div>

                        <a href="${pageContext.request.contextPath}/schedule"
                           class="card-action">

                            View Schedule

                        </a>

                    </div>


                    <div class="schedule-list">


                        <!-- Schedule 1 -->

                        <div class="schedule-item">

                            <div class="schedule-time">

                                <strong>
                                    09:00
                                </strong>

                                <span>
                                    AM
                                </span>

                            </div>

                            <div class="schedule-line"></div>

                            <div class="schedule-details">

                                <h4>
                                    Java Programming Lab
                                </h4>

                                <p>
                                    Computer Laboratory 01
                                </p>

                            </div>

                        </div>


                        <!-- Schedule 2 -->

                        <div class="schedule-item">

                            <div class="schedule-time">

                                <strong>
                                    11:00
                                </strong>

                                <span>
                                    AM
                                </span>

                            </div>

                            <div class="schedule-line"></div>

                            <div class="schedule-details">

                                <h4>
                                    Computer Networks
                                </h4>

                                <p>
                                    Networking Laboratory
                                </p>

                            </div>

                        </div>


                        <!-- Schedule 3 -->

                        <div class="schedule-item">

                            <div class="schedule-time">

                                <strong>
                                    02:00
                                </strong>

                                <span>
                                    PM
                                </span>

                            </div>

                            <div class="schedule-line"></div>

                            <div class="schedule-details">

                                <h4>
                                    IoT Practical Session
                                </h4>

                                <p>
                                    IoT Laboratory
                                </p>

                            </div>

                        </div>


                        <!-- Schedule 4 -->

                        <div class="schedule-item">

                            <div class="schedule-time">

                                <strong>
                                    04:00
                                </strong>

                                <span>
                                    PM
                                </span>

                            </div>

                            <div class="schedule-line"></div>

                            <div class="schedule-details">

                                <h4>
                                    AI &amp; Machine Learning
                                </h4>

                                <p>
                                    AI Laboratory
                                </p>

                            </div>

                        </div>


                    </div>

                </div>

            </section>


            <!-- =========================
                 BOTTOM GRID
                 ========================= -->

            <section class="bottom-grid">


                <!-- =========================
                     AI ASSISTANT
                     ========================= -->

                <div class="ai-card">

                    <div class="ai-content">

                        <div class="ai-icon">

                            <i class="fa-solid fa-robot"></i>

                        </div>

                        <h3>
                            AI Lab Assistant
                        </h3>

                        <p>
                            Find laboratories, check availability,
                            understand schedules and get intelligent
                            laboratory-related assistance using AI.
                        </p>

                        <a href="${pageContext.request.contextPath}/ai-assistant"
                           class="ai-button">

                            Open AI Assistant

                            <i class="fa-solid fa-arrow-right"></i>

                        </a>

                    </div>

                </div>


                <!-- =========================
                     QUICK ACTIONS
                     ========================= -->

                <div class="dashboard-card quick-actions">

                    <div class="card-title-area">

                        <h3>
                            Quick Actions
                        </h3>

                        <p>
                            Frequently used operations
                        </p>

                    </div>


                    <div class="quick-action-grid">


                        <a href="${pageContext.request.contextPath}/laboratories"
                           class="quick-action">

                            <div class="quick-action-icon">

                                <i class="fa-solid fa-flask"></i>

                            </div>

                            <span>
                                Manage Laboratories
                            </span>

                        </a>


                        <a href="${pageContext.request.contextPath}/bookings"
                           class="quick-action">

                            <div class="quick-action-icon">

                                <i class="fa-solid fa-calendar-check"></i>

                            </div>

                            <span>
                                New Booking
                            </span>

                        </a>


                        <a href="${pageContext.request.contextPath}/equipment"
                           class="quick-action">

                            <div class="quick-action-icon">

                                <i class="fa-solid fa-computer"></i>

                            </div>

                            <span>
                                Equipment
                            </span>

                        </a>


                        <a href="${pageContext.request.contextPath}/maintenance"
                           class="quick-action">

                            <div class="quick-action-icon">

                                <i class="fa-solid fa-screwdriver-wrench"></i>

                            </div>

                            <span>
                                Maintenance
                            </span>

                        </a>


                    </div>

                </div>

            </section>


        </div>


        <!-- Footer -->

        <%@ include file="../common/footer.jsp" %>

    </main>

</div>


<!-- Common JS -->

<script src="${pageContext.request.contextPath}/js/common.js"></script>

</body>

</html>

