```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        ${laboratory.labName} | Medi-Caps Lab Management
    </title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/common.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/laboratory-details.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<div class="app-layout">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="main-area">

        <jsp:include page="../common/header.jsp" />

        <main class="page-content">


            <div class="breadcrumb">

                <a href="${pageContext.request.contextPath}/dashboard">
                    Dashboard
                </a>

                <i class="fa-solid fa-chevron-right"></i>

                <a href="${pageContext.request.contextPath}/laboratories">
                    Laboratories
                </a>

                <i class="fa-solid fa-chevron-right"></i>

                <span>${laboratory.labCode}</span>

            </div>


            <section class="laboratory-details-hero">


                <div class="details-media">

                    <c:choose>

                        <c:when test="${not empty laboratory.videoUrl}">

                            <div class="details-video-wrapper">

                                <iframe
                                    src="${fn:replace(fn:replace(laboratory.videoUrl, 'https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/'), 'https://youtu.be/', 'https://www.youtube.com/embed/')}"
                                    title="${laboratory.labName} Laboratory Video"
                                    frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                    allowfullscreen>
                                </iframe>

                            </div>

                        </c:when>


                        <c:when test="${not empty laboratory.imageUrl}">

                            <img
                                src="${laboratory.imageUrl}"
                                alt="${laboratory.labName}"
                                class="details-image">

                        </c:when>


                        <c:otherwise>

                            <div class="details-video-placeholder">

                                <i class="fa-solid fa-flask"></i>

                                <span>
                                    No Laboratory Media Available
                                </span>

                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>


                <div class="details-hero-content">

                    <span class="details-lab-code">
                        ${laboratory.labCode}
                    </span>

                    <h1>
                        ${laboratory.labName}
                    </h1>

                    <p class="details-description">

                        ${not empty laboratory.description
                            ? laboratory.description
                            : 'Laboratory information and facilities are available here.'}

                    </p>


                    <div class="details-status-row">

                        <span class="status-badge
                            ${fn:toLowerCase(laboratory.status)}">

                            ${laboratory.status}

                        </span>


                        <span>

                            <i class="fa-solid fa-location-dot"></i>

                            ${laboratory.building},
                            Room ${laboratory.roomNumber}

                        </span>

                    </div>

                </div>

            </section>


            <section class="details-stats">


                <div class="details-stat-card">

                    <div class="details-stat-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>

                    <div>

                        <span>Capacity</span>

                        <strong>
                            ${laboratory.capacity}
                        </strong>

                        <small>
                            Seats
                        </small>

                    </div>

                </div>


                <div class="details-stat-card">

                    <div class="details-stat-icon">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>

                    <div>

                        <span>Floor</span>

                        <strong>
                            ${laboratory.floorNumber}
                        </strong>

                        <small>
                            Floor Number
                        </small>

                    </div>

                </div>


                <div class="details-stat-card">

                    <div class="details-stat-icon">
                        <i class="fa-solid fa-building"></i>
                    </div>

                    <div>

                        <span>Building</span>

                        <strong>
                            ${laboratory.building}
                        </strong>

                        <small>
                            University Building
                        </small>

                    </div>

                </div>


                <div class="details-stat-card">

                    <div class="details-stat-icon">
                        <i class="fa-solid fa-door-open"></i>
                    </div>

                    <div>

                        <span>Room</span>

                        <strong>
                            ${laboratory.roomNumber}
                        </strong>

                        <small>
                            Laboratory Room
                        </small>

                    </div>

                </div>

            </section>


            <section class="details-information-grid">


                <div class="details-card">

                    <div class="details-card-header">

                        <div>

                            <span class="section-label">
                                INFORMATION
                            </span>

                            <h2>Laboratory Overview</h2>

                        </div>

                        <i class="fa-solid fa-circle-info"></i>

                    </div>


                    <p>

                        ${not empty laboratory.description
                            ? laboratory.description
                            : 'No detailed description has been added for this laboratory yet.'}

                    </p>

                </div>


                <div class="details-card">

                    <div class="details-card-header">

                        <div>

                            <span class="section-label">
                                FACILITIES
                            </span>

                            <h2>Laboratory Facilities</h2>

                        </div>

                        <i class="fa-solid fa-screwdriver-wrench"></i>

                    </div>


                    <div class="facility-list">


                        <div class="facility-item">

                            <i class="fa-solid fa-users"></i>

                            <span>
                                Capacity: ${laboratory.capacity} seats
                            </span>

                        </div>


                        <div class="facility-item">

                            <i class="fa-solid fa-location-dot"></i>

                            <span>
                                ${laboratory.building},
                                Room ${laboratory.roomNumber}
                            </span>

                        </div>


                        <div class="facility-item">

                            <i class="fa-solid fa-layer-group"></i>

                            <span>
                                Floor ${laboratory.floorNumber}
                            </span>

                        </div>


                        <div class="facility-item">

                            <i class="fa-solid fa-circle-check"></i>

                            <span>
                                Status: ${laboratory.status}
                            </span>

                        </div>

                    </div>

                </div>


                <div class="details-card">

                    <div class="details-card-header">

                        <div>

                            <span class="section-label">
                                RESPONSIBILITY
                            </span>

                            <h2>Lab In-Charge</h2>

                        </div>

                        <i class="fa-solid fa-user-tie"></i>

                    </div>


                    <div class="in-charge-box">

                        <div class="in-charge-icon">

                            <i class="fa-solid fa-user"></i>

                        </div>


                        <div>

                            <strong>

                                ${not empty laboratory.labInCharge
                                    ? laboratory.labInCharge
                                    : 'Not Assigned'}

                            </strong>

                            <span>
                                Laboratory In-Charge
                            </span>

                        </div>

                    </div>

                </div>


                <div class="details-card">

                    <div class="details-card-header">

                        <div>

                            <span class="section-label">
                                LOCATION
                            </span>

                            <h2>Location Details</h2>

                        </div>

                        <i class="fa-solid fa-map-location-dot"></i>

                    </div>


                    <div class="location-details">


                        <div>

                            <span>Building</span>

                            <strong>
                                ${laboratory.building}
                            </strong>

                        </div>


                        <div>

                            <span>Room Number</span>

                            <strong>
                                ${laboratory.roomNumber}
                            </strong>

                        </div>


                        <div>

                            <span>Floor</span>

                            <strong>
                                ${laboratory.floorNumber}
                            </strong>

                        </div>

                    </div>

                </div>

            </section>


            <section class="details-actions-section">


                <a
                    href="${pageContext.request.contextPath}/laboratories"
                    class="secondary-button">

                    <i class="fa-solid fa-arrow-left"></i>

                    Back to Laboratories

                </a>


                <div class="details-action-buttons">


                    <button
                        type="button"
                        class="secondary-button">

                        <i class="fa-solid fa-pen"></i>

                        Edit Laboratory

                    </button>


                    <button
                        type="button"
                        class="primary-button">

                        <i class="fa-solid fa-calendar-plus"></i>

                        Book Laboratory

                    </button>

                </div>

            </section>

        </main>


        <jsp:include page="../common/footer.jsp" />

    </div>

</div>


<script
    src="${pageContext.request.contextPath}/js/common.js">
</script>

</body>

</html>
```
