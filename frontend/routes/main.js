// Imports
import axios from "axios";
import express from "express";
const router = express.Router();
import dotenv from "dotenv";
dotenv.config();
const pe = process.env;

router.get("/", async (req, res) => {
  try {
    let data = {};

    const apiQuery = await axios
      .get(pe.API_URL + "/videos")
      .then((res) => {
        data = res.data;
        return data.status = "ok";
      })
      .catch((error) => {
        console.error(error);
        data.status = "error";
        return data.error = "Videos not found";
      });

    let userData = "data isers";

    res.render("main", { userData, data });
  } catch (error) {
    console.error("Error in queries:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

export default router;
