// ── Image preview ─────────────────────────────────────
document.getElementById("profilePic").addEventListener("change", function () {
    const file    = this.files[0];
    const preview = document.getElementById("imagePreview");

    if (file) {
        compressImage(file, function(compressed) {
            preview.innerHTML = `<img src="${compressed}" alt="Preview">`;
        });
    }
});

// ── Compress image ────────────────────────────────────
function compressImage(file, callback) {
    const reader = new FileReader();
    reader.onload = function (e) {
        const img = new Image();
        img.onload = function () {
            const canvas  = document.createElement("canvas");
            const maxSize = 400;
            let width     = img.width;
            let height    = img.height;

            if (width > height) {
                if (width > maxSize) {
                    height = (height * maxSize) / width;
                    width  = maxSize;
                }
            } else {
                if (height > maxSize) {
                    width  = (width * maxSize) / height;
                    height = maxSize;
                }
            }

            canvas.width  = width;
            canvas.height = height;
            const ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0, width, height);
            callback(canvas.toDataURL("image/jpeg", 0.7));
        };
        img.src = e.target.result;
    };
    reader.readAsDataURL(file);
}

// ── Register ──────────────────────────────────────────
function register() {
    const username = document.getElementById("username").value;
    const email    = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const fullName = document.getElementById("fullName").value;
    const dob      = document.getElementById("dob").value;
    const gender   = document.getElementById("gender").value;
    const phone    = document.getElementById("phone").value;
    const city     = document.getElementById("city").value;
    const picFile  = document.getElementById("profilePic").files[0];

    if (!username || !email || !password) {
        document.getElementById("message").innerText = "Username, email and password are required";
        return;
    }

    if (picFile) {
        compressImage(picFile, function(compressed) {
            sendRegister(username, email, password, fullName, dob, gender, phone, city, compressed);
        });
    } else {
        sendRegister(username, email, password, fullName, dob, gender, phone, city, "");
    }
}

// ── Send register ─────────────────────────────────────
function sendRegister(username, email, password, fullName, dob, gender, phone, city, profilePic) {
    fetch("http://localhost:3000/user/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, email, password, fullName, dob, gender, phone, city, profilePic })
    })
    .then(res => res.json())
    .then(data => {
        const msg = document.getElementById("message");
        msg.innerText = data.message;
        msg.className = data.success ? "message success" : "message";
        if (data.success) {
            window.location.href = "login.html";
        }
    })
    .catch(err => console.error(err));
}

// ── Show/hide password ────────────────────────────────
function togglePassword() {
    const input = document.getElementById("password");
    const btn   = document.getElementById("toggleBtn");
    if (input.type === "password") {
        input.type = "text";
        btn.innerText = "Hide";
    } else {
        input.type = "password";
        btn.innerText = "Show";
    }
}