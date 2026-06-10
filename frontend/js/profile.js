const userId   = localStorage.getItem("userId");
const username = localStorage.getItem("username");

if (!userId) {
    window.location.href = "login.html";
}

// Image helper
function getImage(src) {
    if (!src || src === "") return "../images/default.png";
    if (src.startsWith("data:")) return src;
    if (src.startsWith("http")) return src;
    return "http://localhost:3000" + src;
}

// Load profile
function loadProfile() {
    fetch("http://localhost:3000/user/details?userId=" + userId)
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            const user = data.user;
            document.getElementById("profileUsername").innerText  = user.formatted_username || user.username;
            document.getElementById("profileBio").innerText       = user.bio || "No bio yet";
            document.getElementById("profileFullName").innerText  = user.display_name || "";
            document.getElementById("profileCity").innerText      = user.city_upper ? user.city_upper : "";
            document.getElementById("profileGender").innerText    = user.age ? "Age: " + user.age : "";
            document.getElementById("editBio").value              = user.bio || "";
            document.getElementById("profilePic").src             = getImage(user.profile_pic);

            // Show joined date and days
            if (document.getElementById("profileJoined")) {
                document.getElementById("profileJoined").innerText =
                    "Joined: " + user.joined_date + " (" + user.days_joined + " days ago)";
            }
        }
    });
}

// Load counts
function loadCounts() {
    fetch("http://localhost:3000/follow/followers?userId=" + userId)
    .then(res => res.json())
    .then(data => {
        document.getElementById("followerCount").innerText = data.followers.length;
    });

    fetch("http://localhost:3000/follow/following?userId=" + userId)
    .then(res => res.json())
    .then(data => {
        document.getElementById("followingCount").innerText = data.following.length;
    });
}

// Load user posts
function loadUserPosts() {
    fetch("http://localhost:3000/post/user?userId=" + userId)
    .then(res => res.json())
    .then(data => {
        document.getElementById("postCount").innerText = data.posts.length;
        const div = document.getElementById("userPosts");
        div.innerHTML = "";

        if (data.posts.length === 0) {
            div.innerHTML = "<p style='color:#b2bec3;'>No posts yet.</p>";
            return;
        }

        data.posts.forEach(post => {
            div.innerHTML += `
                <div class="post-card">
                    <div class="post-content">${post.content}</div>
                    ${post.image_url ? `<img src="${getImage(post.image_url)}" class="post-image">` : ""}
                    <div class="post-date">${new Date(post.created_at).toLocaleString()}</div>
                </div>
            `;
        });
    });
}

// Load user albums
function loadUserAlbums() {
    fetch("http://localhost:3000/album/user?userId=" + userId)
    .then(res => res.json())
    .then(data => {
        const div = document.getElementById("userAlbums");
        div.innerHTML = "";

        if (data.albums.length === 0) {
            div.innerHTML = "<p style='color:#b2bec3;'>No albums yet.</p>";
            return;
        }

        data.albums.forEach(album => {
            div.innerHTML += `
                <div class="album-card" onclick="openAlbum(${album.album_id}, '${album.title}')">
                    <h4>${album.title}</h4>
                    <p>${album.description || "No description"}</p>
                    <span>${album.post_count} posts — click to manage</span>
                </div>
            `;
        });
    });
}

// Open album modal
let currentAlbumId = null;

function openAlbum(albumId, title) {
    currentAlbumId = albumId;
    document.getElementById("modalAlbumTitle").innerText = title;
    document.getElementById("modalOverlay").style.display = "block";
    document.getElementById("albumModal").style.display   = "block";
    switchModalTab("posts");
}

function closeModal() {
    document.getElementById("modalOverlay").style.display = "none";
    document.getElementById("albumModal").style.display   = "none";
    currentAlbumId = null;
    loadUserAlbums();
}

// Switch modal tab
function switchModalTab(tab) {
    document.getElementById("tabPosts").classList.toggle("active", tab === "posts");
    document.getElementById("tabAdd").classList.toggle("active",   tab === "add");
    document.getElementById("modalPostsList").style.display = tab === "posts" ? "block" : "none";
    document.getElementById("modalAddList").style.display   = tab === "add"   ? "block" : "none";

    if (tab === "posts") loadAlbumPosts();
    if (tab === "add")   loadPostsToAdd();
}

// Load posts in album
function loadAlbumPosts() {
    fetch("http://localhost:3000/album/posts?albumId=" + currentAlbumId)
    .then(res => res.json())
    .then(data => {
        const div = document.getElementById("modalPostsList");
        div.innerHTML = "";

        if (data.posts.length === 0) {
            div.innerHTML = "<p style='color:#b2bec3; text-align:center; padding:20px;'>No posts in this album yet.</p>";
            return;
        }

        data.posts.forEach(post => {
            div.innerHTML += `
                <div class="modal-post-card">
                    <p>${post.content.substring(0, 80)}${post.content.length > 80 ? '...' : ''}</p>
                    <button class="remove-btn" onclick="removeFromAlbum(${post.post_id})">Remove</button>
                </div>
            `;
        });
    });
}

// Load user posts to add to album
function loadPostsToAdd() {
    fetch("http://localhost:3000/post/user?userId=" + userId)
    .then(res => res.json())
    .then(userPostsData => {
        fetch("http://localhost:3000/album/posts?albumId=" + currentAlbumId)
        .then(res => res.json())
        .then(albumPostsData => {
            const div = document.getElementById("modalAddList");
            div.innerHTML = "";

            const albumPostIds = albumPostsData.posts.map(p => p.post_id);
            const postsNotInAlbum = userPostsData.posts.filter(p => !albumPostIds.includes(p.post_id));

            if (postsNotInAlbum.length === 0) {
                div.innerHTML = "<p style='color:#b2bec3; text-align:center; padding:20px;'>All your posts are already in this album.</p>";
                return;
            }

            postsNotInAlbum.forEach(post => {
                div.innerHTML += `
                    <div class="modal-post-card">
                        <p>${post.content.substring(0, 80)}${post.content.length > 80 ? '...' : ''}</p>
                        <button onclick="addToAlbum(${post.post_id})">Add</button>
                    </div>
                `;
            });
        });
    });
}

// Add post to album
function addToAlbum(postId) {
    fetch("http://localhost:3000/album/addpost", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ albumId: currentAlbumId, postId })
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) loadPostsToAdd();
    });
}

// Remove post from album
function removeFromAlbum(postId) {
    fetch("http://localhost:3000/album/removepost", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ albumId: currentAlbumId, postId })
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) loadAlbumPosts();
    });
}

// Toggle edit form
function toggleEditForm() {
    const form = document.getElementById("editForm");
    form.style.display = form.style.display === "none" ? "block" : "none";
}

// Update profile
function updateProfile() {
    const bio     = document.getElementById("editBio").value;
    const picFile = document.getElementById("editProfilePic").files[0];

    if (picFile) {
        const reader = new FileReader();
        reader.onload = function (e) {
            sendUpdate(bio, e.target.result);
        };
        reader.readAsDataURL(picFile);
    } else {
        sendUpdate(bio, "");
    }
}

function sendUpdate(bio, profilePic) {
    fetch("http://localhost:3000/user/update", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId, bio, profilePic })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("editMessage").innerText = data.message;
        if (data.success) {
            loadProfile();
            toggleEditForm();
        }
    });
}

// Toggle album form
function toggleAlbumForm() {
    const form = document.getElementById("albumForm");
    form.style.display = form.style.display === "none" ? "block" : "none";
}

// Create album
function createAlbum() {
    const title       = document.getElementById("albumTitle").value;
    const description = document.getElementById("albumDesc").value;

    if (!title) {
        document.getElementById("albumMessage").innerText = "Title is required";
        return;
    }

    fetch("http://localhost:3000/album/create", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId, title, description })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("albumMessage").innerText = data.message;
        if (data.success) {
            document.getElementById("albumTitle").value = "";
            document.getElementById("albumDesc").value  = "";
            loadUserAlbums();
        }
    });
}

// Logout
function logout() {
    localStorage.removeItem("userId");
    localStorage.removeItem("username");
    window.location.href = "login.html";
}
// ── Open follow modal ─────────────────────────────────
function openFollowModal(type) {
    document.getElementById("followModalOverlay").style.display = "block";
    document.getElementById("followModal").style.display        = "block";

    if (type === "followers") {
        document.getElementById("followModalTitle").innerText = "Followers";
        loadFollowList("followers");
    } else if (type === "following") {
        document.getElementById("followModalTitle").innerText = "Following";
        loadFollowList("following");
    } else {
        closeFollowModal();
    }
}

// ── Close follow modal ────────────────────────────────
function closeFollowModal() {
    document.getElementById("followModalOverlay").style.display = "none";
    document.getElementById("followModal").style.display        = "none";
}

// ── Load follow list ──────────────────────────────────
function loadFollowList(type) {
    fetch(`http://localhost:3000/follow/${type}?userId=${userId}`)
    .then(res => res.json())
    .then(data => {
        const div  = document.getElementById("followModalList");
        div.innerHTML = "";
        const list = type === "followers" ? data.followers : data.following;

        if (list.length === 0) {
            div.innerHTML = `<p style='text-align:center; color:#b2bec3; padding:20px;'>No ${type} yet.</p>`;
            return;
        }

        list.forEach(user => {
            div.innerHTML += `
                <div class="modal-post-card">
                    <img src="${getImage(user.profile_pic)}"
                         style="width:40px; height:40px; border-radius:50%; object-fit:cover; border:2px solid #a29bfe;">
                    <a href="user.html?userId=${user.user_id}"
                       style="font-weight:700; color:#2d3436; font-size:14px; flex:1; margin-left:12px;">
                        ${user.username}
                    </a>
                </div>
            `;
        });
    });
}

// Load everything
loadProfile();
loadCounts();
loadUserPosts();
loadUserAlbums();