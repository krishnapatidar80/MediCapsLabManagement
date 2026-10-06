document.addEventListener("DOMContentLoaded", function () {

    /* =====================================================
       LABORATORY SEARCH + FILTER
       ===================================================== */

    window.filterLaboratories = function () {

        const searchInput =
            document.getElementById("laboratorySearch");

        const statusFilter =
            document.getElementById("statusFilter");

        const buildingFilter =
            document.getElementById("buildingFilter");

        const rows =
            document.querySelectorAll(
                "#laboratoryTableBody tr[data-status]"
            );

        const searchText =
            searchInput
                ? searchInput.value.toLowerCase().trim()
                : "";

        const selectedStatus =
            statusFilter
                ? statusFilter.value.toLowerCase()
                : "";

        const selectedBuilding =
            buildingFilter
                ? buildingFilter.value.toLowerCase()
                : "";

        rows.forEach(function (row) {

            const rowSearch =
                (row.getAttribute("data-search") || "")
                    .toLowerCase();

            const rowStatus =
                (row.getAttribute("data-status") || "")
                    .toLowerCase();

            const rowBuilding =
                (row.getAttribute("data-building") || "")
                    .toLowerCase();

            const searchMatch =
                searchText === "" ||
                rowSearch.includes(searchText);

            const statusMatch =
                selectedStatus === "" ||
                rowStatus === selectedStatus;

            const buildingMatch =
                selectedBuilding === "" ||
                rowBuilding === selectedBuilding;

            if (
                searchMatch &&
                statusMatch &&
                buildingMatch
            ) {

                row.style.display = "";

            } else {

                row.style.display = "none";

            }

        });

    };


    /* =====================================================
       BUILDING FILTER - REMOVE DUPLICATES
       ===================================================== */

    const buildingFilter =
        document.getElementById("buildingFilter");

    if (buildingFilter) {

        const options =
            Array.from(buildingFilter.options);

        const values = new Set();

        options.forEach(function (option, index) {

            if (index === 0) {
                return;
            }

            const value =
                option.value.trim().toLowerCase();

            if (values.has(value)) {

                option.remove();

            } else {

                values.add(value);

            }

        });

    }


    /* =====================================================
       YOUTUBE THUMBNAIL + HOVER PLAY
       ===================================================== */

    const hoverVideos =
        document.querySelectorAll(".hover-video");

    hoverVideos.forEach(function (videoContainer) {

        const originalUrl =
            videoContainer.getAttribute("data-video-url");

        if (!originalUrl) {
            return;
        }

        let iframe = null;


        function getVideoId(url) {

            let videoId = "";

            if (url.includes("watch?v=")) {

                videoId =
                    url.split("watch?v=")[1]
                       .split("&")[0];

            } else if (url.includes("youtu.be/")) {

                videoId =
                    url.split("youtu.be/")[1]
                       .split("?")[0];

            } else if (url.includes("/embed/")) {

                videoId =
                    url.split("/embed/")[1]
                       .split("?")[0];

            }

            return videoId;

        }


        const videoId =
            getVideoId(originalUrl);

        if (!videoId) {
            return;
        }


        const thumbnailUrl =
            "https://img.youtube.com/vi/" +
            videoId +
            "/hqdefault.jpg";


        function showThumbnail() {

            videoContainer.innerHTML =
                '<img ' +
                'src="' + thumbnailUrl + '" ' +
                'alt="Laboratory Video" ' +
                'class="laboratory-card-image">';

        }


        function showVideo() {

            const embedUrl =
                "https://www.youtube.com/embed/" +
                videoId +
                "?autoplay=1&mute=1&controls=1&rel=0";

            iframe =
                document.createElement("iframe");

            iframe.src = embedUrl;

            iframe.title =
                "Laboratory Video";

            iframe.frameBorder = "0";

            iframe.allow =
                "autoplay; encrypted-media; picture-in-picture";

            iframe.allowFullscreen = true;

            iframe.className =
                "hover-youtube-iframe";

            videoContainer.innerHTML = "";

            videoContainer.appendChild(iframe);

        }


        showThumbnail();


        videoContainer.addEventListener(
            "mouseenter",
            function () {

                if (!iframe) {

                    showVideo();

                }

            }
        );


        videoContainer.addEventListener(
            "mouseleave",
            function () {

                if (iframe) {

                    iframe.src = "";

                    iframe.remove();

                    iframe = null;

                }

                showThumbnail();

            }
        );

    });


    /* =====================================================
       LABORATORY MODAL
       ===================================================== */

    const modal =
        document.getElementById("laboratoryModal");


    window.openLaboratoryModal = function () {

        if (modal) {

            modal.classList.add("active");

            document.body.classList.add("modal-open");

        }

    };


    window.closeLaboratoryModal = function () {

        if (modal) {

            modal.classList.remove("active");

            document.body.classList.remove("modal-open");

        }

    };


    if (modal) {

        modal.addEventListener(
            "click",
            function (event) {

                if (event.target === modal) {

                    closeLaboratoryModal();

                }

            }
        );

    }


    /* =====================================================
       ESCAPE KEY - CLOSE MODAL
       ===================================================== */

    document.addEventListener(
        "keydown",
        function (event) {

            if (event.key === "Escape") {

                closeLaboratoryModal();

            }

        }
    );

});