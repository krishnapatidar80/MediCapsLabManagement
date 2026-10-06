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

    <title>Laboratories | Medi-Caps Lab Management</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/common.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/laboratories.css">

</head>

<body>

<div class="app-layout">

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <div class="main-area">

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <main class="page-content">

            <div class="page-heading">

                <div>

                    <div class="breadcrumb">

                        <a href="${pageContext.request.contextPath}/dashboard">
                            Dashboard
                        </a>

                        <i class="fa-solid fa-chevron-right"></i>

                        <span>Laboratories</span>

                    </div>

                    <h1>
                        Laboratories
                    </h1>

                    <p>
                        Manage university laboratories, facilities and availability.
                    </p>

                </div>

                <button
                    type="button"
                    class="primary-button"
                    onclick="openLaboratoryModal()">

                    <i class="fa-solid fa-plus"></i>

                    Add Laboratory

                </button>

            </div>


            <!-- =========================
                 SUCCESS MESSAGE
                 ========================= -->

            <c:if test="${not empty successMessage}">

                <div class="alert-message success-message">

                    <i class="fa-solid fa-circle-check"></i>

                    <span>
                        ${successMessage}
                    </span>

                </div>

            </c:if>


            <!-- =========================
                 ERROR MESSAGE
                 ========================= -->

            <c:if test="${not empty errorMessage}">

                <div class="alert-message error-message">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    <span>
                        ${errorMessage}
                    </span>

                </div>

            </c:if>


            <!-- =========================
                 VALIDATION ERROR
                 ========================= -->

            <c:if test="${not empty validationError}">

                <div class="alert-message error-message">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    <span>
                        ${validationError}
                    </span>

                </div>

            </c:if>


            <!-- =========================
                 DUPLICATE CODE ERROR
                 ========================= -->

            <c:if test="${not empty duplicateCodeError}">

                <div class="alert-message error-message">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    <span>
                        ${duplicateCodeError}
                    </span>

                </div>

            </c:if>


            <!-- =========================
                 SUMMARY
                 ========================= -->

            <div class="laboratory-summary">

                <div class="summary-card">

                    <div class="summary-icon blue">

                        <i class="fa-solid fa-flask"></i>

                    </div>

                    <div>

                        <span class="summary-label">
                            Total Laboratories
                        </span>

                        <strong>
                            ${fn:length(laboratories)}
                        </strong>

                    </div>

                </div>


                <div class="summary-card">

                    <div class="summary-icon green">

                        <i class="fa-solid fa-circle-check"></i>

                    </div>

                    <div>

                        <span class="summary-label">
                            Active Laboratories
                        </span>

                        <strong>

                            <c:set var="activeCount" value="0" />

                            <c:forEach
                                var="lab"
                                items="${laboratories}">

                                <c:if test="${lab.status == 'Active'}">

                                    <c:set
                                        var="activeCount"
                                        value="${activeCount + 1}" />

                                </c:if>

                            </c:forEach>

                            ${activeCount}

                        </strong>

                    </div>

                </div>


                <div class="summary-card">

                    <div class="summary-icon orange">

                        <i class="fa-solid fa-screwdriver-wrench"></i>

                    </div>

                    <div>

                        <span class="summary-label">
                            Under Maintenance
                        </span>

                        <strong>

                            <c:set var="maintenanceCount" value="0" />

                            <c:forEach
                                var="lab"
                                items="${laboratories}">

                                <c:if test="${lab.status == 'Maintenance'}">

                                    <c:set
                                        var="maintenanceCount"
                                        value="${maintenanceCount + 1}" />

                                </c:if>

                            </c:forEach>

                            ${maintenanceCount}

                        </strong>

                    </div>

                </div>


                <div class="summary-card">

                    <div class="summary-icon purple">

                        <i class="fa-solid fa-users"></i>

                    </div>

                    <div>

                        <span class="summary-label">
                            Total Capacity
                        </span>

                        <strong>

                            <c:set var="totalCapacity" value="0" />

                            <c:forEach
                                var="lab"
                                items="${laboratories}">

                                <c:set
                                    var="totalCapacity"
                                    value="${totalCapacity + lab.capacity}" />

                            </c:forEach>

                            ${totalCapacity}

                        </strong>

                    </div>

                </div>

            </div>


            <!-- =========================
                 LABORATORY EXPLORER
                 ========================= -->

            <section class="laboratory-video-section">

                <div class="section-header">

                    <div>

                        <h2>
                            Laboratory Explorer
                        </h2>

                        <p>
                            Explore laboratory facilities and resources.
                        </p>

                    </div>

                </div>


                <div class="laboratory-video-grid">

                    <c:choose>

                        <c:when test="${not empty laboratories}">

                            <c:forEach
                                var="lab"
                                items="${laboratories}">

                                <div class="laboratory-video-card">

                                    <c:choose>

                                        <c:when test="${not empty lab.videoUrl}">

                                            <div
                                                class="laboratory-video-wrapper hover-video"
                                                data-video-url="${lab.videoUrl}">
                                            </div>

                                        </c:when>


                                        <c:when test="${not empty lab.imageUrl}">

                                            <div class="laboratory-video-wrapper">

                                                <img
                                                    src="${lab.imageUrl}"
                                                    alt="${lab.labName}"
                                                    class="laboratory-card-image">

                                            </div>

                                        </c:when>


                                        <c:otherwise>

                                            <div class="laboratory-video-placeholder">

                                                <i class="fa-solid fa-flask"></i>

                                                <span>
                                                    No Media Available
                                                </span>

                                            </div>

                                        </c:otherwise>

                                    </c:choose>


                                    <div class="laboratory-video-info">

                                        <div>

                                            <span class="lab-code">
                                                ${lab.labCode}
                                            </span>

                                            <h3>
                                                ${lab.labName}
                                            </h3>

                                            <p>

                                                <i class="fa-solid fa-location-dot"></i>

                                                ${lab.building},
                                                Room ${lab.roomNumber}

                                            </p>

                                        </div>


                                        <a
                                            href="${pageContext.request.contextPath}/laboratories/${lab.id}"
                                            class="video-view-button">

                                            View Details

                                            <i class="fa-solid fa-arrow-right"></i>

                                        </a>

                                    </div>

                                </div>

                            </c:forEach>

                        </c:when>


                        <c:otherwise>

                            <div class="empty-state">

                                <i class="fa-solid fa-flask"></i>

                                <h3>
                                    No Laboratories Found
                                </h3>

                                <p>
                                    Add your first laboratory to get started.
                                </p>

                                <button
                                    type="button"
                                    class="primary-button"
                                    onclick="openLaboratoryModal()">

                                    <i class="fa-solid fa-plus"></i>

                                    Add Laboratory

                                </button>

                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>

            </section>


            <!-- =========================
                 LABORATORY MANAGEMENT
                 ========================= -->

            <section class="laboratory-management-section">

                <div class="section-header">

                    <div>

                        <h2>
                            Laboratory Management
                        </h2>

                        <p>
                            View and manage all registered laboratories.
                        </p>

                    </div>

                </div>


                <div class="laboratory-toolbar">

                    <div class="search-box">

                        <i class="fa-solid fa-magnifying-glass"></i>

                        <input
                            type="text"
                            id="laboratorySearch"
                            placeholder="Search laboratory..."
                            onkeyup="filterLaboratories()">

                    </div>


                    <div class="filter-group">

                        <select
                            id="statusFilter"
                            onchange="filterLaboratories()">

                            <option value="">
                                All Status
                            </option>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Maintenance">
                                Maintenance
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>


                        <select
                            id="buildingFilter"
                            onchange="filterLaboratories()">

                            <option value="">
                                All Buildings
                            </option>

                            <c:forEach
                                var="lab"
                                items="${laboratories}">

                                <option value="${lab.building}">
                                    ${lab.building}
                                </option>

                            </c:forEach>

                        </select>

                    </div>

                </div>


                <div class="table-container">

                    <table class="laboratory-table">

                        <thead>

                            <tr>

                                <th>Code</th>

                                <th>Laboratory</th>

                                <th>Location</th>

                                <th>Capacity</th>

                                <th>In-Charge</th>

                                <th>Status</th>

                                <th>Actions</th>

                            </tr>

                        </thead>


                        <tbody id="laboratoryTableBody">

                            <c:choose>

                                <c:when test="${not empty laboratories}">

                                    <c:forEach
                                        var="lab"
                                        items="${laboratories}">

                                        <tr
                                            data-status="${lab.status}"
                                            data-building="${lab.building}"
                                            data-search="${fn:toLowerCase(lab.labCode)} ${fn:toLowerCase(lab.labName)} ${fn:toLowerCase(lab.building)} ${fn:toLowerCase(lab.roomNumber)} ${fn:toLowerCase(lab.labInCharge)}">

                                            <td>

                                                <span class="lab-code-badge">
                                                    ${lab.labCode}
                                                </span>

                                            </td>


                                            <td>

                                                <div class="lab-name-cell">

                                                    <div class="lab-table-icon">

                                                        <i class="fa-solid fa-flask"></i>

                                                    </div>

                                                    <div>

                                                        <strong>
                                                            ${lab.labName}
                                                        </strong>

                                                        <span>
                                                            ${lab.description}
                                                        </span>

                                                    </div>

                                                </div>

                                            </td>


                                            <td>

                                                <div class="location-cell">

                                                    <strong>
                                                        ${lab.building}
                                                    </strong>

                                                    <span>
                                                        Room ${lab.roomNumber}
                                                    </span>

                                                </div>

                                            </td>


                                            <td>

                                                <span class="capacity-cell">

                                                    <i class="fa-solid fa-users"></i>

                                                    ${lab.capacity}

                                                </span>

                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty lab.labInCharge}">

                                                        ${lab.labInCharge}

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="not-assigned">
                                                            Not Assigned
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when test="${lab.status == 'Active'}">

                                                        <span class="status-badge status-active">

                                                            <span class="status-dot"></span>

                                                            Active

                                                        </span>

                                                    </c:when>


                                                    <c:when test="${lab.status == 'Maintenance'}">

                                                        <span class="status-badge status-maintenance">

                                                            <span class="status-dot"></span>

                                                            Maintenance

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="status-badge status-inactive">

                                                            <span class="status-dot"></span>

                                                            ${lab.status}

                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <td>

                                                <div class="table-actions">

                                                    <a
                                                        href="${pageContext.request.contextPath}/laboratories/${lab.id}"
                                                        class="table-action view-action"
                                                        title="View Laboratory">

                                                        <i class="fa-solid fa-eye"></i>

                                                    </a>


                                                    <a
                                                        href="${pageContext.request.contextPath}/laboratories/edit/${lab.id}"
                                                        class="table-action edit-action"
                                                        title="Edit Laboratory">

                                                        <i class="fa-solid fa-pen"></i>

                                                    </a>


                                                    <form
                                                        action="${pageContext.request.contextPath}/laboratories/delete/${lab.id}"
                                                        method="post"
                                                        class="delete-form"
                                                        onsubmit="return confirm('Are you sure you want to delete this laboratory?');">

                                                        <button
                                                            type="submit"
                                                            class="table-action delete-action"
                                                            title="Delete Laboratory">

                                                            <i class="fa-solid fa-trash"></i>

                                                        </button>

                                                    </form>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td
                                            colspan="7"
                                            class="table-empty">

                                            No laboratories available.

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

                </div>

            </section>

        </main>


        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </div>

</div>


<!-- =========================
     ADD LABORATORY MODAL
     ========================= -->

<div
    class="modal-overlay"
    id="laboratoryModal">

    <div class="laboratory-modal">

        <div class="modal-header">

            <div>

                <h2>
                    Add Laboratory
                </h2>

                <p>
                    Enter laboratory information below.
                </p>

            </div>


            <button
                type="button"
                class="modal-close"
                onclick="closeLaboratoryModal()">

                <i class="fa-solid fa-xmark"></i>

            </button>

        </div>


        <form
            action="${pageContext.request.contextPath}/laboratories/save"
            method="post"
            class="laboratory-form">

            <div class="modal-body">

                <div class="form-grid">


                    <!-- Laboratory Code -->

                    <div class="form-group">

                        <label for="labCode">

                            Laboratory Code

                            <span>*</span>

                        </label>

                        <input
                            type="text"
                            id="labCode"
                            name="labCode"
                            placeholder="LAB-001"
                            required>

                    </div>


                    <!-- Laboratory Name -->

                    <div class="form-group">

                        <label for="labName">

                            Laboratory Name

                            <span>*</span>

                        </label>

                        <input
                            type="text"
                            id="labName"
                            name="labName"
                            placeholder="Computer Science Lab"
                            required>

                    </div>


                    <!-- Building -->

                    <div class="form-group">

                        <label for="building">

                            Building

                            <span>*</span>

                        </label>

                        <input
                            type="text"
                            id="building"
                            name="building"
                            placeholder="AB-1"
                            required>

                    </div>


                    <!-- Room Number -->

                    <div class="form-group">

                        <label for="roomNumber">

                            Room Number

                            <span>*</span>

                        </label>

                        <input
                            type="text"
                            id="roomNumber"
                            name="roomNumber"
                            placeholder="101"
                            required>

                    </div>


                    <!-- Floor Number -->

                    <div class="form-group">

                        <label for="floorNumber">

                            Floor Number

                        </label>

                        <input
                            type="number"
                            id="floorNumber"
                            name="floorNumber"
                            placeholder="1"
                            min="0">

                    </div>


                    <!-- Capacity -->

                    <div class="form-group">

                        <label for="capacity">

                            Capacity

                            <span>*</span>

                        </label>

                        <input
                            type="number"
                            id="capacity"
                            name="capacity"
                            placeholder="60"
                            min="1"
                            required>

                    </div>


                    <!-- Lab In-Charge -->

                    <div class="form-group">

                        <label for="labInCharge">

                            Lab In-Charge

                        </label>

                        <input
                            type="text"
                            id="labInCharge"
                            name="labInCharge"
                            placeholder="Faculty Name">

                    </div>


                    <!-- Status -->

                    <div class="form-group">

                        <label for="status">

                            Status

                            <span>*</span>

                        </label>

                        <select
                            id="status"
                            name="status"
                            required>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Maintenance">
                                Maintenance
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>


                    <!-- Image URL -->

                    <div class="form-group full-width">

                        <label for="imageUrl">

                            Image URL

                        </label>

                        <input
                            type="url"
                            id="imageUrl"
                            name="imageUrl"
                            placeholder="https://example.com/laboratory.jpg">

                    </div>


                    <!-- Video URL -->

                    <div class="form-group full-width">

                        <label for="videoUrl">

                            YouTube Video URL

                        </label>

                        <input
                            type="url"
                            id="videoUrl"
                            name="videoUrl"
                            placeholder="https://www.youtube.com/watch?v=...">

                    </div>


                    <!-- Description -->

                    <div class="form-group full-width">

                        <label for="description">

                            Description

                        </label>

                        <textarea
                            id="description"
                            name="description"
                            rows="4"
                            placeholder="Enter laboratory description..."></textarea>

                    </div>

                </div>

            </div>


            <div class="modal-footer">

                <button
                    type="button"
                    class="secondary-button"
                    onclick="closeLaboratoryModal()">

                    Cancel

                </button>


                <button
                    type="submit"
                    class="primary-button">

                    <i class="fa-solid fa-floppy-disk"></i>

                    Save Laboratory

                </button>

            </div>

        </form>

    </div>

</div>


<script src="${pageContext.request.contextPath}/js/common.js"></script>

<script src="${pageContext.request.contextPath}/js/laboratories.js"></script>

</body>

</html>
```
