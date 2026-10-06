document.addEventListener("DOMContentLoaded", function () {

    /* =====================================================
       MOBILE SIDEBAR
       ===================================================== */

    const mobileMenuBtn = document.getElementById("mobileMenuBtn");
    const sidebar = document.getElementById("sidebar");

    if (mobileMenuBtn && sidebar) {

        mobileMenuBtn.addEventListener("click", function () {

            sidebar.classList.toggle("mobile-open");

        });
    }


    /* =====================================================
       CLOSE SIDEBAR WHEN NAVIGATION ITEM IS CLICKED
       ON MOBILE
       ===================================================== */

    const navItems = document.querySelectorAll(".nav-item");

    navItems.forEach(function (item) {

        item.addEventListener("click", function () {

            if (window.innerWidth <= 768 && sidebar) {

                sidebar.classList.remove("mobile-open");

            }

        });

    });


    /* =====================================================
       USER PROFILE DROPDOWN
       ===================================================== */

    const userProfile = document.querySelector(".user-profile");

    if (userProfile) {

        userProfile.addEventListener("click", function (event) {

            event.stopPropagation();

            userProfile.classList.toggle("profile-open");

        });

    }


    /* =====================================================
       CLOSE PROFILE DROPDOWN WHEN CLICKING OUTSIDE
       ===================================================== */

    document.addEventListener("click", function () {

        if (userProfile) {

            userProfile.classList.remove("profile-open");

        }

    });


    /* =====================================================
       SEARCH SHORTCUT - CTRL + K
       ===================================================== */

    const searchInput = document.querySelector(".header-search input");

    document.addEventListener("keydown", function (event) {

        if ((event.ctrlKey || event.metaKey) &&
            event.key.toLowerCase() === "k") {

            event.preventDefault();

            if (searchInput) {

                searchInput.focus();

            }

        }

    });


    /* =====================================================
       SEARCH INPUT
       ===================================================== */

    if (searchInput) {

        searchInput.addEventListener("keydown", function (event) {

            if (event.key === "Enter") {

                const searchValue =
                    searchInput.value.trim();

                if (searchValue !== "") {

                    console.log(
                        "Search requested:",
                        searchValue
                    );

                }

            }

        });

    }


    /* =====================================================
       WINDOW RESIZE
       ===================================================== */

    window.addEventListener("resize", function () {

        if (window.innerWidth > 768 && sidebar) {

            sidebar.classList.remove("mobile-open");

        }

    });


    /* =====================================================
       ACTIVE NAVIGATION ITEM
       ===================================================== */

    const currentPath =
        window.location.pathname;

    navItems.forEach(function (item) {

        const href = item.getAttribute("href");

        if (!href || href === "#") {
            return;
        }

        if (currentPath.endsWith(href) ||
            (href !== "/" && currentPath.includes(href))) {

            navItems.forEach(function (nav) {
                nav.classList.remove("active");
            });

            item.classList.add("active");

        }

    });


    /* =====================================================
       NOTIFICATION BUTTON
       ===================================================== */

    const notificationButton =
        document.querySelector(".header-icon-btn");

    if (notificationButton) {

        notificationButton.addEventListener(
            "click",
            function () {

                console.log(
                    "Notification button clicked."
                );

            }
        );

    }


    /* =====================================================
       PREVENT EMPTY # LINKS FROM JUMPING
       ===================================================== */

    const emptyLinks =
        document.querySelectorAll('a[href="#"]');

    emptyLinks.forEach(function (link) {

        link.addEventListener("click", function (event) {

            event.preventDefault();

        });

    });

});


