const express = require("express");
const app = express();
const exec = require("child_process").exec;

app.get("/", function(req, res) {
  res.send("Hello World");
});

app.post("/docker-hook", (req, res) => {
  exec("sh docker.sh", (error, stdout, stderr) => {
    console.log(`${stdout}`);
    console.log(`${stderr}`);
    if (error !== null) {
      console.log(`exec error: ${error}`);
    }
    res.end(stdout);
  });
});

app.listen(3000, () => {
  console.log("Server is listening on port 3000");
});
