const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const exec = require("child_process").exec;

const port = 3000;

app.use(bodyParser.json());

app.get("/", function(req, res) {
  res.send("Hello World");
});

app.post("/api/hook/docker", (req, res) => {
  const repo_name = req.body.repository.repo_name;
  const image_tag = req.body.push_data.tag;
  const image_name = req.body.repository.name;

  console.log(repo_name, image_tag);

  exec(
    `sh docker-startup-script.sh ${repo_name} ${image_tag} ${image_name}`,
    (error, stdout, stderr) => {
      console.log(`${stdout}`);
      console.log(`${stderr}`);
      if (error !== null) {
        console.log(`exec error: ${error}`);
      }
      res.end(stdout);
    }
  );
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
