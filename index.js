const express = require("express");
const app = express();
const exec = require("child_process").exec;

const port = 3000;

app.get("/", function(req, res) {
  res.send("Hello World");
});

app.post("/docker-hook-frontend", (req, res) => {
  exec("sh docker-front.sh", (error, stdout, stderr) => {
    console.log(`${stdout}`);
    console.log(`${stderr}`);
    if (error !== null) {
      console.log(`exec error: ${error}`);
    }
    res.end(stdout);
  });
});

app.post("/docker-hook-backend", (req, res) => {
  exec("sh docker-backend.sh", (error, stdout, stderr) => {
    console.log(`${stdout}`);
    console.log(`${stderr}`);
    if (error !== null) {
      console.log(`exec error: ${error}`);
    }
    res.end(stdout);
  });
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
