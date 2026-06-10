-- ============================================
-- SOCIAL MEDIA MINI PROJECT - DATABASE SCHEMA
-- ============================================

CREATE DATABASE IF NOT EXISTS social_media_mini;
USE social_media_mini;

-- ============================================
-- 1. USERS
-- ============================================
CREATE TABLE USERS (
    user_id     INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    email       VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    full_name   VARCHAR(100),
    dob         DATE,
    gender      ENUM('male', 'female', 'other'),
    phone       VARCHAR(20),
    city        VARCHAR(100),
    bio         VARCHAR(300),
    profile_pic LONGTEXT,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- 2. POSTS
-- ============================================
CREATE TABLE POSTS (
    post_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT  NOT NULL,
    content    TEXT NOT NULL,
    image_url  LONGTEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_post_content CHECK (CHAR_LENGTH(content) > 0)
);

-- ============================================
-- 3. COMMENTS
-- ============================================
CREATE TABLE COMMENTS (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id    INT          NOT NULL,
    user_id    INT          NOT NULL,
    text       VARCHAR(500) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES POSTS(post_id)  ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)  ON DELETE CASCADE,
    CONSTRAINT chk_comment_text CHECK (CHAR_LENGTH(text) > 0)
);

-- ============================================
-- 4. LIKES
-- ============================================
CREATE TABLE LIKES (
    like_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    post_id    INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_like (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES POSTS(post_id) ON DELETE CASCADE
);

-- ============================================
-- 5. FOLLOWS
-- ============================================
CREATE TABLE FOLLOWS (
    follower_id  INT NOT NULL,
    following_id INT NOT NULL,
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id)  REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_no_self_follow CHECK (follower_id != following_id)
);

-- ============================================
-- 6. ALBUMS
-- ============================================
CREATE TABLE ALBUMS (
    album_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT          NOT NULL,
    title       VARCHAR(100) NOT NULL,
    description VARCHAR(300),
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_album_title CHECK (CHAR_LENGTH(title) > 0)
);

-- ============================================
-- 7. ALBUM_POSTS
-- ============================================
CREATE TABLE ALBUM_POSTS (
    album_id INT NOT NULL,
    post_id  INT NOT NULL,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (album_id, post_id),
    FOREIGN KEY (album_id) REFERENCES ALBUMS(album_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id)  REFERENCES POSTS(post_id)   ON DELETE CASCADE
);

-- ============================================
-- 8. ADMINS
-- ============================================
CREATE TABLE ADMINS (
    admin_id   INT AUTO_INCREMENT PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- ============================================
-- 9. REACTIONS
-- ============================================
CREATE TABLE REACTIONS (
    reaction_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id       INT NOT NULL,
    post_id       INT NOT NULL,
    reaction_type ENUM('like', 'love', 'haha', 'wow') NOT NULL,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_reaction (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES POSTS(post_id) ON DELETE CASCADE
);