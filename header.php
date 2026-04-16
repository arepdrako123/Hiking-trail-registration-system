<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <a href="index.php" class="logo">
                        <img src="assets/images/salji.png" alt="Hiking App" style="height:80px;">
                    </a>
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="index.php" <?php echo ($current_page == 'index.php') ? 'class="active"' : ''; ?>>Home</a></li>
                        <li class="scroll-to-section"><a href="about-us.php" <?php echo ($current_page == 'about-us.php') ? 'class="active"' : ''; ?>>About</a></li>
                        <li><a href="search.php" <?php echo ($current_page == 'search.php') ? 'class="active"' : ''; ?>>Search Location</a></li>
                        <li><a href="event.php" <?php echo ($current_page == 'event.php') ? 'class="active"' : ''; ?>>Events</a></li>
                        <li><a href="contact-us.php" <?php echo ($current_page == 'contact-us.php') ? 'class="active"' : ''; ?>>Contact Us</a></li>
                        <li><a href="admin/index.php" style="background-color: #2ecc71; color: #fff; padding: 8px 20px; border-radius: 20px; font-size: 13px;">Admin Panel</a></li>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
