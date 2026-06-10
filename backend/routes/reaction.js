const express = require("express");
const router  = express.Router();
const db      = require("../db");

// ── ADD OR UPDATE REACTION ────────────────────────────
router.post("/react", (req, res) => {
    const { userId, postId, reactionType } = req.body;

    if (!userId || !postId || !reactionType) {
        return res.json({ success: false, message: "All fields are required" });
    }

    // Check if reaction already exists
    db.query("SELECT * FROM REACTIONS WHERE user_id = ? AND post_id = ?",
        [userId, postId],
        (err, result) => {
            if (err) return res.json({ success: false, message: "Failed" });

            if (result.length > 0) {
                // Same reaction → remove it
                if (result[0].reaction_type === reactionType) {
                    db.query("DELETE FROM REACTIONS WHERE user_id = ? AND post_id = ?",
                        [userId, postId],
                        (err) => {
                            if (err) return res.json({ success: false, message: "Failed" });
                            res.json({ success: true, message: "Reaction removed", action: "removed" });
                        }
                    );
                } else {
                    // Different reaction → update it
                    db.query("UPDATE REACTIONS SET reaction_type = ? WHERE user_id = ? AND post_id = ?",
                        [reactionType, userId, postId],
                        (err) => {
                            if (err) return res.json({ success: false, message: "Failed" });
                            res.json({ success: true, message: "Reaction updated", action: "updated" });
                        }
                    );
                }
            } else {
                // No reaction → insert new
                db.query("INSERT INTO REACTIONS (user_id, post_id, reaction_type) VALUES (?, ?, ?)",
                    [userId, postId, reactionType],
                    (err) => {
                        if (err) return res.json({ success: false, message: "Failed" });
                        res.json({ success: true, message: "Reaction added", action: "added" });
                    }
                );
            }
        }
    );
});

// ── GET REACTIONS FOR A POST ──────────────────────────
router.get("/post", (req, res) => {
    const { postId, userId } = req.query;

    db.query(`
        SELECT
            reaction_type,
            COUNT(*) AS count
        FROM REACTIONS
        WHERE post_id = ?
        GROUP BY reaction_type
        ORDER BY count DESC`,
        [postId],
        (err, counts) => {
            if (err) return res.json({ success: false, message: "Failed" });

            // Get current user reaction
            db.query("SELECT reaction_type FROM REACTIONS WHERE user_id = ? AND post_id = ?",
                [userId, postId],
                (err, userReaction) => {
                    if (err) return res.json({ success: false, message: "Failed" });
                    res.json({
                        success      : true,
                        counts       : counts,
                        userReaction : userReaction.length > 0 ? userReaction[0].reaction_type : null
                    });
                }
            );
        }
    );
});

// ── GET ALL REACTIONS SUMMARY (uses JOIN + aggregate) ─
router.get("/summary", (req, res) => {
    db.query(`
        SELECT
            p.post_id,
            p.content,
            u.username,
            r.reaction_type,
            COUNT(r.reaction_id) AS reaction_count
        FROM REACTIONS r
        JOIN POSTS p ON r.post_id = p.post_id
        JOIN USERS u ON p.user_id = u.user_id
        GROUP BY p.post_id, p.content, u.username, r.reaction_type
        ORDER BY reaction_count DESC`,
        (err, results) => {
            if (err) return res.json({ success: false, message: "Failed" });
            res.json({ success: true, reactions: results });
        }
    );
});

module.exports = router;