<?php
include("hikingdatabase.php");

if (isset($_POST["contact"])) {
    $name = sanitize($_POST["name"] ?? '');
    $email = sanitize($_POST["email"] ?? '');
    $tel_no = sanitize($_POST["tel_no"] ?? '');
    $message = sanitize($_POST["message"] ?? '');
    $msg_type = sanitize($_POST["msg_type"] ?? '');

    if (empty($name) || empty($email) || empty($message) || empty($msg_type)) {
        echo "<script>alert('Please fill in all required fields!'); window.history.back();</script>";
        exit();
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "<script>alert('Please enter a valid email address.'); window.history.back();</script>";
        exit();
    }

    $stmt = mysqli_prepare($conn, "INSERT INTO contact_us (name, email, tel_no, message, msg_type) VALUES (?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "sssss", $name, $email, $tel_no, $message, $msg_type);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Thank you! Your message has been sent successfully.'); window.location.href='index.php';</script>";
    } else {
        echo "<script>alert('Sorry, something went wrong. Please try again.'); window.history.back();</script>";
    }
    mysqli_stmt_close($stmt);
}
mysqli_close($conn);
?>
