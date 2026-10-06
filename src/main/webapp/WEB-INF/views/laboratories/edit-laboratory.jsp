<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Laboratory | Medi-Caps Lab Management</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/common.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/edit-laboratory.css">

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

                        <a href="${pageContext.request.contextPath}/laboratories">
                            Laboratories
                        </a>

                        <i class="fa-solid fa-chevron-right"></i>

                        <span>Edit Laboratory</span>

                    </div>

                    <h1>
                        Edit Laboratory
                    </h1>

                    <p>
                        Update laboratory information and configuration.
                    </p>

                </div>

            </div>


            <div class="edit-container">

                <form
                    action="${pageContext.request.contextPath}/laboratories/update"
                    method="post"
                    class="laboratory-form">

                    <input
                        type="hidden"
                        name="id"
                        value="${laboratory.id}">


                    <div class="form-section">

                        <div class="section-heading">

                            <div class="section-icon">
                                <i class="fa-solid fa-flask"></i>
                            </div>

                            <div>
                                <h2>Basic Information</h2>

                                <p>
                                    Update the laboratory identification details.
                                </p>
                            </div>

                        </div>


                        <div class="form-grid">

                            <div class="form-group">

                                <label for="labCode">
                                    Laboratory Code
                                    <span>*</span>
                                </label>

                                <input
                                    type="text"
                                    id="labCode"
                                    name="labCode"
                                    value="${laboratory.labCode}"
                                    required>

                            </div>


                            <div class="form-group">

                                <label for="labName">
                                    Laboratory Name
                                    <span>*</span>
                                </label>

                                <input
                                    type="text"
                                    id="labName"
                                    name="labName"
                                    value="${laboratory.labName}"
                                    required>

                            </div>


                            <div class="form-group">

                                <label for="building">
                                    Building
                                    <span>*</span>
                                </label>

                                <input
                                    type="text"
                                    id="building"
                                    name="building"
                                    value="${laboratory.building}"
                                    required>

                            </div>


                            <div class="form-group">

                                <label for="roomNumber">
                                    Room Number
                                    <span>*</span>
                                </label>

                                <input
                                    type="text"
                                    id="roomNumber"
                                    name="roomNumber"
                                    value="${laboratory.roomNumber}"
                                    required>

                            </div>


                            <div class="form-group">

                                <label for="floorNumber">
                                    Floor Number
                                </label>

                                <input
                                    type="number"
                                    id="floorNumber"
                                    name="floorNumber"
                                    value="${laboratory.floorNumber}"
                                    min="0">

                            </div>


                            <div class="form-group">

                                <label for="capacity">
                                    Capacity
                                    <span>*</span>
                                </label>

                                <input
                                    type="number"
                                    id="capacity"
                                    name="capacity"
                                    value="${laboratory.capacity}"
                                    min="1"
                                    required>

                            </div>


                            <div class="form-group">

                                <label for="labInCharge">
                                    Lab In-Charge
                                </label>

                                <input
                                    type="text"
                                    id="labInCharge"
                                    name="labInCharge"
                                    value="${laboratory.labInCharge}">

                            </div>


                            <div class="form-group">

                                <label for="status">
                                    Status
                                    <span>*</span>
                                </label>

                                <select
                                    id="status"
                                    name="status"
                                    required>

                                    <option
                                        value="Active"
                                        ${laboratory.status == 'Active' ? 'selected' : ''}>
                                        Active
                                    </option>

                                    <option
                                        value="Maintenance"
                                        ${laboratory.status == 'Maintenance' ? 'selected' : ''}>
                                        Maintenance
                                    </option>

                                    <option
                                        value="Inactive"
                                        ${laboratory.status == 'Inactive' ? 'selected' : ''}>
                                        Inactive
                                    </option>

                                </select>

                            </div>

                        </div>

                    </div>


                    <div class="form-section">

                        <div class="section-heading">

                            <div class="section-icon">
                                <i class="fa-solid fa-photo-film"></i>
                            </div>

                            <div>

                                <h2>Media & Resources</h2>

                                <p>
                                    Update laboratory image and YouTube video.
                                </p>

                            </div>

                        </div>


                        <div class="form-grid">


                            <div class="form-group full-width">

                                <label for="imageUrl">
                                    Image URL
                                </label>

                                <input
                                    type="url"
                                    id="imageUrl"
                                    name="imageUrl"
                                    value="${laboratory.imageUrl}"
                                    placeholder="https://example.com/laboratory.jpg">

                                <small>
                                    Add a valid image URL for the laboratory.
                                </small>

                            </div>


                            <div class="form-group full-width">

                                <label for="videoUrl">
                                    YouTube Video URL
                                </label>

                                <input
                                    type="url"
                                    id="videoUrl"
                                    name="videoUrl"
                                    value="${laboratory.videoUrl}"
                                    placeholder="https://www.youtube.com/watch?v=...">

                                <small>
                                    YouTube thumbnail and hover video will use this URL.
                                </small>

                            </div>

                        </div>

                    </div>


                    <div class="form-section">

                        <div class="section-heading">

                            <div class="section-icon">
                                <i class="fa-solid fa-align-left"></i>
                            </div>

                            <div>

                                <h2>Description</h2>

                                <p>
                                    Update the laboratory overview.
                                </p>

                            </div>

                        </div>


                        <div class="form-group full-width">

                            <label for="description">
                                Laboratory Description
                            </label>

                            <textarea
                                id="description"
                                name="description"
                                rows="6"
                                placeholder="Enter laboratory description...">${laboratory.description}</textarea>

                        </div>

                    </div>


                    <div class="form-actions">

                        <a
                            href="${pageContext.request.contextPath}/laboratories"
                            class="btn btn-secondary">

                            <i class="fa-solid fa-arrow-left"></i>

                            Cancel

                        </a>


                        <button
                            type="submit"
                            class="btn btn-primary">

                            <i class="fa-solid fa-floppy-disk"></i>

                            Update Laboratory

                        </button>

                    </div>

                </form>

            </div>

        </main>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </div>

</div>


<script src="${pageContext.request.contextPath}/js/common.js"></script>

</body>

</html>