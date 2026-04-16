<?php
// Database Configuration
$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "hiking_app";

// Connect to database
$conn = null;
try {
    $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);
    mysqli_set_charset($conn, "utf8mb4");
} catch (mysqli_sql_exception $e) {
    die("Database connection failed. Please try again later.");
}

// Session start (only if not already started)
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

/**
 * Sanitize input to prevent XSS
 */
function sanitize($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    return $data;
}

/**
 * Flash messages helper
 */
function setFlash($type, $message) {
    $_SESSION['flash'] = ['type' => $type, 'message' => $message];
}

function getFlash() {
    if (isset($_SESSION['flash'])) {
        $flash = $_SESSION['flash'];
        unset($_SESSION['flash']);
        return $flash;
    }
    return null;
}

/**
 * Check if admin is logged in
 */
function isLoggedIn() {
    return isset($_SESSION['admin_id']);
}

function requireLogin() {
    if (!isLoggedIn()) {
        header("Location: index.php");
        exit();
    }
}
?>
