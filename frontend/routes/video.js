// Imports
import dotenv from "dotenv";
dotenv.config();
const pe = process.env;
import axios from "axios";
import express from "express";
const router = express.Router();

// Video page
router.get("/:s/:e", async (req, res) => {
  try {
    const { s, e } = req.params;

    const apiQueryVideos = await axios
      .get(`${pe.API_URL}/videos`)
      .then((res) => {
        return res.data;
      })
      .catch((error) => {
        console.error(error);
        return false;
      });

    const apiQueryVideo = await axios
      .get(`${pe.API_URL}/tawog/${s}/${e}`)
      .then((res) => {
        return res.data[0];
      })
      .catch((error) => {
        console.error(error);
        return false;
      });

    res.render("video/play", {
      video: apiQueryVideo,
      userData: "User data",
      comments: [
        {
          login: "User 1",
          body: "Comment 1",
          avatar: "http://localhost:9000/avatars/gumball.jpg",
          role: "gumball",
        },
        {
          login: "User 2",
          body: "Comment 2",
          avatar: "http://localhost:9000/avatars/darwin.jpg",
          role: "darwin",
        },
        {
          login: "User 3",
          body: "Comment 3",
          avatar: "http://localhost:9000/avatars/anais.jpg",
          role: "admin",
        },
      ],
      data: apiQueryVideos,
    });
  } catch (error) {
    console.error("Error in queries:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

export default router;
