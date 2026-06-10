const express = require("express");
const cors    = require("cors");
const path    = require("path");

const app = express();

// ── Middleware ────────────────────────────────────────
app.use(cors());
app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ limit: "10mb", extended: true }));

// ── Serve frontend files ──────────────────────────────
app.use(express.static(path.join(__dirname, "../frontend")));

// ── Routes ────────────────────────────────────────────
app.use("/user",    require("./routes/user"));
app.use("/post",    require("./routes/post"));
app.use("/comment", require("./routes/comment"));
app.use("/like",    require("./routes/like"));
app.use("/follow",  require("./routes/follow"));
app.use("/album",   require("./routes/album"));
app.use("/reaction", require("./routes/reaction"));

// ── Start server ──────────────────────────────────────
app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});