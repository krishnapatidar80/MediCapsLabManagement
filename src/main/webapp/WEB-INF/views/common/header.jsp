<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- =====================================================
     COMMON HEADER / TOPBAR
     ===================================================== -->

<header class="top-header">


    <!-- =================================================
         LEFT SIDE
         ================================================= -->

    <div class="header-left">


        <!-- Mobile Menu -->

        <button type="button"
                class="mobile-menu-btn"
                id="mobileMenuBtn"
                aria-label="Open navigation menu">

            <i class="fa-solid fa-bars"></i>

        </button>



        <!-- Page Information -->

        <div class="page-information">


            <!-- Breadcrumb -->

            <div class="breadcrumb">

                <span class="breadcrumb-home">
                    <i class="fa-solid fa-house"></i>
                </span>

                <span class="breadcrumb-arrow">
                    <i class="fa-solid fa-chevron-right"></i>
                </span>

                <span class="breadcrumb-current">
                    Dashboard
                </span>

            </div>


            <!-- Page Title -->

            <h1 class="page-title">
                Laboratory Dashboard
            </h1>


            <!-- Subtitle -->

            <p class="page-subtitle">
                Overview of Medi-Caps University laboratory operations
            </p>

        </div>

    </div>



    <!-- =================================================
         RIGHT SIDE
         ================================================= -->

    <div class="header-right">


        <!-- Search -->

        <div class="header-search">

            <i class="fa-solid fa-magnifying-glass"></i>

            <input type="text"
                   placeholder="Search..."
                   aria-label="Search">

            <span class="search-shortcut">
                Ctrl K
            </span>

        </div>



        <!-- Notification -->

        <button type="button"
                class="header-icon-btn"
                title="Notifications">

            <i class="fa-regular fa-bell"></i>

            <span class="notification-badge">
                3
            </span>

        </button>



        <!-- User -->

        <div class="user-profile">


            <div class="user-avatar">
                AD
            </div>


            <div class="user-information">

                <strong>
                    Administrator
                </strong>

                <span>
                    System Admin
                </span>

            </div>


            <i class="fa-solid fa-chevron-down user-dropdown-icon"></i>

        </div>

    </div>

</header>