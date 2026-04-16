-- ============================================
-- Hiking App Database Setup
-- ============================================

CREATE DATABASE IF NOT EXISTS hiking_app;
USE hiking_app;

-- ============================================
-- Admin Table
-- ============================================
CREATE TABLE IF NOT EXISTS admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Default admin: admin@hiking.com / admin123
INSERT INTO admin (name, email, password) VALUES
('Admin', 'admin@hiking.com', '$2b$12$Z9WA61wR0pTC3blgy65iWuf9LPK8JE/Tl.UTBHmTcKe14MQyHekCu');

-- ============================================
-- Event Table (enhanced)
-- ============================================
CREATE TABLE IF NOT EXISTS event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_organizer VARCHAR(150) NOT NULL,
    event_location VARCHAR(255) NOT NULL,
    event_name VARCHAR(200) NOT NULL,
    event_description TEXT,
    event_date DATE,
    event_image VARCHAR(500),
    max_hikers INT NOT NULL DEFAULT 50,
    current_hikers INT NOT NULL DEFAULT 0,
    difficulty ENUM('Easy','Moderate','Hard','Expert') DEFAULT 'Moderate',
    status ENUM('Pending','Approve','Cancelled') DEFAULT 'Pending',
    approved_by VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO event (event_organizer, event_location, event_name, event_description, event_date, event_image, max_hikers, difficulty, status, approved_by) VALUES
('Hiking Malaysia', 'Pahang', 'Bukit Panorama', 'Bukit Panorama is a hill located in Sungai Lembing, 45km northwest of Kuantan. The summit offers a panorama view of the area.', '2026-06-20', 'https://images.pexels.com/photos/2606532/pexels-photo-2606532.jpeg?auto=compress&cs=tinysrgb&w=600', 30, 'Moderate', 'Approve', 'Admin'),
('Trail Blazers KL', 'Perak', 'Bukit Larut', 'Bukit Larut is a hill resort in Malaysia located in the state of Perak, 10 kilometres southwest from Taiping.', '2026-07-15', 'https://images.pexels.com/photos/6005031/pexels-photo-6005031.jpeg?auto=compress&cs=tinysrgb&w=600', 25, 'Hard', 'Approve', 'Admin'),
('Nature Walks MY', 'Kuala Lumpur', 'KL Forest Eco Park', 'One of Malaysia oldest permanent forest reserves, gazetted in 1906.', '2026-08-10', 'https://images.pexels.com/photos/4940760/pexels-photo-4940760.jpeg?auto=compress&cs=tinysrgb&w=600', 40, 'Easy', 'Pending', 'Admin'),
('Peak Seekers', 'Selangor', 'Bukit Gasing', 'Gasing Hill is the green lung between Kuala Lumpur and Petaling Jaya, a secondary forest stretching more than 100 hectares.', '2026-09-05', 'https://images.pexels.com/photos/77551/pexels-photo-77551.jpeg?auto=compress&cs=tinysrgb&w=600', 35, 'Easy', 'Approve', 'Admin');

-- ============================================
-- Hikers Table (enhanced)
-- ============================================
CREATE TABLE IF NOT EXISTS hikers (
    hikers_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    tel_no VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male','Female') NOT NULL,
    experience VARCHAR(100),
    email VARCHAR(150) NOT NULL,
    event_option VARCHAR(100),
    emergency_contact VARCHAR(20),
    medical_notes TEXT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ============================================
-- Contact Us Table
-- ============================================
CREATE TABLE IF NOT EXISTS contact_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    tel_no VARCHAR(20),
    message TEXT NOT NULL,
    msg_type ENUM('Feedback','Report') DEFAULT 'Feedback',
    is_read TINYINT(1) DEFAULT 0,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
