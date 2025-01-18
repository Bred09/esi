// db
import { sqlQuery } from "../mysql_pool.js";

import express from "express";
const router = express.Router();

router.get("/", async (req, res) => {
  res.send("API");
});

// Videos
router.get("/videos", async (req, res) => {
  try {
    const [videos] = await sqlQuery("SELECT * FROM videos LIMIT 20;");

    res.send(videos);
  } catch (error) {
    console.error("Error in queries:", error);
    res.status(404).json({ message: "Видео не найдены" });
  }
});

// TAWOG se - season and episode
router.get("/tawog/:s/:e", async (req, res) => {
  try {
    const { s, e } = req.params;

    const [video] = await sqlQuery(
      `SELECT * FROM videos WHERE season = ? AND episode = ?;`,
      [s, e]
    );

    if (!video.length) {
      return res.status(404).json({ message: "Видео не найдено" });
    }

    res.send(video);
  } catch (error) {
    console.error("Error in queries:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

export default router;
