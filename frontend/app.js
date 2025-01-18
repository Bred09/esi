// Imports
import dotenv from "dotenv";
dotenv.config();
const pe = process.env;
import staticAsset from "static-asset";
import path from "path";
import { fileURLToPath } from "url";

// Get __dirname equivalent in ES module
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// server
import express from "express";
const app = express();
// Plugins
app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(express.json());
app.use(staticAsset(path.join(__dirname, "public")));

import { main, video } from "./routes/index.js";

// Views ==========
// home
app.use("/", main);

// video upload
app.use("/play/", video);

// Page 404
app.use(function (req, res, next) {
  res.status(404).render("page_404", { userData: "User data" });
});

// Start server ==========
const port = pe.PORT || 2502;
app.listen(port, () => {
  console.log(`\x1b[46m App \x1b[0m: \x1b[36m${port}\x1b[0m`);

  if (process.env.APP_TYPE === "dev") {
    console.log("\x1b[33m%s\x1b[0m", "Development");
  }
});
