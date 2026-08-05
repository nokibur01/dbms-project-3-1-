# 🌐 Social Media Management Platform

A full-stack social media platform developed to provide users with features for profile management, posts, comments, likes, reactions, following, albums, and administrative management.

The project focuses heavily on **relational database design and SQL implementation**, demonstrating practical use of CRUD operations, JOINs, aggregate functions, views, stored functions, triggers, constraints, and foreign-key relationships.

---

## ✨ Features

### 👤 User Management

* User registration and login
* Profile management
* Profile picture and bio updates
* User search by username, name, and city
* User suggestions
* Admin user management

### 📝 Post Management

* Create, edit, and delete posts
* Personalized feed based on followed users
* Search posts by keywords
* Post statistics
* Dynamic post labels such as Hot, Popular, Active, and New

### 💬 Comments

* Add comments to posts
* View comments with author information
* Delete comments

### ❤️ Likes & Reactions

* Like and unlike posts
* Emoji-based reactions
* Change or remove reactions
* Display reaction counts and summaries
* Duplicate likes prevented through database constraints and triggers

### 👥 Follow System

* Follow and unfollow users
* View followers and following lists
* Check follow relationships
* Prevent users from following themselves

### 🖼️ Albums

* Create albums
* Add posts to albums
* View album posts
* Remove posts from albums
* Delete albums

### 🛡️ Admin Management

* Separate admin authentication
* Manage users and posts
* View user and post statistics
* Monitor platform activity

---

## 🛠️ Technologies Used

* **Frontend:** HTML5, CSS3, JavaScript
* **Backend:** Node.js, Express.js
* **Database:** MySQL
* **Database Management:** phpMyAdmin
* **API Communication:** Fetch API

---

## 🗄️ Database Design

The database contains multiple related entities:

```text
USERS
POSTS
COMMENTS
LIKES
REACTIONS
FOLLOWS
ALBUMS
ALBUM_POSTS
ADMINS
DELETED_USERS_LOG
POST_ACTIVITY_LOG
```

The system uses primary keys, composite keys, foreign keys, unique constraints, ENUMs, CHECK constraints, and cascading deletes to maintain data integrity.

---

## 🔧 SQL Features Implemented

### CRUD Operations

The application implements complete CRUD operations across major entities:

* **INSERT** — Registration, posts, comments, likes, reactions, follows, albums
* **SELECT** — Profiles, feeds, comments, statistics, searches
* **UPDATE** — Posts, profiles, reactions
* **DELETE** — Users, posts, comments, likes, follows, albums

### JOIN Operations

Multiple JOIN queries are used to combine related information, including:

* Posts with author information
* Posts from followed users
* Comments with usernames
* Followers and following profiles
* Posts inside albums
* Reaction summaries
* Post statistics
* Administrative user and post reports

### Aggregate Functions

The project uses aggregate functions such as:

* `COUNT()`
* `COUNT(DISTINCT ...)`

These are used to calculate:

* Likes per post
* Comments per post
* Reactions by type
* Posts per user
* Followers per user
* Following counts

### SQL Functions

Custom database functions are used for:

* Generating display names
* Calculating user age
* Calculating days since registration
* Generating post labels
* Formatting usernames
* Checking relationships between users

### Views

Two database views are implemented:

* `post_summary` — Provides simplified post information for reporting.
* `user_stats` — Provides summarized user statistics.

### Triggers

The project includes database triggers for automated operations:

* `log_deleted_user` — Records deleted user information.
* `log_new_post` — Records newly created posts.
* `prevent_duplicate_like` — Prevents duplicate likes.

### Constraints

The database uses several constraints to maintain data integrity:

* `PRIMARY KEY`
* Composite primary keys
* `FOREIGN KEY`
* `UNIQUE`
* `NOT NULL`
* `CHECK`
* `ENUM`
* `ON DELETE CASCADE`

---

## 🔍 Search Functionality

Users can search for:

* Users by username
* Users by full name
* Users by city
* Posts by content keywords

Case-insensitive searching is implemented using SQL functions and `LIKE` conditions.

---

## 📂 Project Structure

```text
social-media-platform/
│
├── backend/
│   ├── routes/
│   │   ├── user.js
│   │   ├── post.js
│   │   ├── comment.js
│   │   ├── like.js
│   │   ├── reaction.js
│   │   ├── follow.js
│   │   └── album.js
│   │
│   └── ...
│
├── frontend/
│   ├── pages/
│   ├── css/
│   └── js/
│
├── database/
│   └── schema.sql
│
└── README.md
```

> Update the structure above if your actual repository uses different file or folder names.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have:

* Node.js
* MySQL
* XAMPP or another MySQL server
* Git

### 1. Clone the Repository

```bash
git clone https://github.com/nokibur01/dbms-project-3-1-
cd social-media-platform
```

### 2. Set Up the Database

1. Start MySQL using XAMPP or your preferred MySQL server.
2. Open phpMyAdmin.
3. Create a database for the project.
4. Import the provided `schema.sql` file.
5. Verify that all tables, functions, views, triggers, and constraints have been created successfully.

### 3. Install Dependencies

```bash
npm install
```

### 4. Configure Database Connection

Update the database configuration in the backend with your MySQL credentials.

### 5. Start the Server

```bash
node server.js
```

The application will then be available through the configured local server.

---

## 🎯 Learning Outcomes

Through this project, we gained practical experience with:

* Relational database design
* Entity relationships
* CRUD operations
* SQL JOINs
* Aggregate functions
* Database views
* Stored functions
* Database triggers
* Constraints and data integrity
* Foreign-key relationships
* Backend API development
* Connecting a web application with MySQL

---

## 👥 Project Team

* **Nokibur Rahman** — Backend / Database / Tester
* **Dhruba singh** — Frontend
* **Rafsan Rafi** — Frontend
* **Jannatul Ferdaous** _ Database Schema Design

---

## 📄 License

This project was developed for academic and educational purposes.
