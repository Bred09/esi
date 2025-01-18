// Imports
import dotenv from "dotenv";
dotenv.config();
const pe = process.env;

// server
import express from "express";
const app = express();

import api from "./routes/api.js";


// ROUTER
app.use(express.static("src"));
app.use("/api", api);

const port = pe.PORT || 9000;
// Start server
app.listen(port, () => {
  console.log(`\x1b[46m Server \x1b[0m: \x1b[36m${port}\x1b[0m`);

  if (process.env.APP_TYPE === "dev") {
    console.log("\x1b[33m%s\x1b[0m", "Development");
  }
});
