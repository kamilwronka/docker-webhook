const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const exec = require("child_process").exec;

const port = process.env.DOCKER_WEBHOOK_PORT;

app.use(bodyParser.json());

app.post("/csgoed-cms", (req, res) => {
  const repo_name = req.body.repository.repo_name;
  const image_tag = req.body.push_data.tag;
  const image_name = req.body.repository.name;

  exec(
    `sh run-cms.sh ${repo_name} ${image_tag} ${image_name}`,
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

app.post("/csgoed-mainpage", (req, res) => {
  const repo_name = req.body.repository.repo_name;
  const image_tag = req.body.push_data.tag;
  const image_name = req.body.repository.name;

  exec(
    `sh run-mainpage.sh ${repo_name} ${image_tag} ${image_name}`,
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

app.post("/csgoed-panel", (req, res) => {
  const repo_name = req.body.repository.repo_name;
  const image_tag = req.body.push_data.tag;
  const image_name = req.body.repository.name;

  exec(
    `sh run-panel.sh ${repo_name} ${image_tag} ${image_name}`,
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

app.post("/csgoed-panel-backend", (req, res) => {
  const repo_name = req.body.repository.repo_name;
  const image_tag = req.body.push_data.tag;
  const image_name = req.body.repository.name;

  exec(
    `sh run-panel-backend.sh ${repo_name} ${image_tag} ${image_name}`,
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
