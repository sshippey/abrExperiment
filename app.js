const express = require('express');

const fs = require('fs');
const moment = require('moment');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');

const app = express();
const port = 3000

const statsDir = 'stats';

var jsonParser = bodyParser.json({limit: "500mb"});

// default options
app.use(fileUpload());

// Route to handle file upload
app.post('/upload', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      // Handle any errors that occurred during the upload
      return res.status(500).send(err.message);
    }

    // Check if the uploaded file is a video (you can adjust the MIME types or file extensions as needed)
    const allowedMimeTypes = ['video/mp4', 'video/mpeg', /* Add more video MIME types here */];
    if (!allowedMimeTypes.includes(req.file.mimetype)) {
      return res.status(400).send('Invalid file type. Please upload a video.');
    }

    // File uploaded successfully
    res.send('Video uploaded!');
  });
});

app.post('/stats', jsonParser, (req, res) => {
  const requestData = JSON.stringify(req.body, null, 2);

  var mobility = 'mobile';
  if (!req.body.mobility) {
    mobility = 'immobile'
  }
  var los = 'los';
  if (!req.body.los) {
    los = 'nolos'
  }

  var abr = req.body.abr;

  var video_name = req.body.video;

  const filename = mobility + ',' + los + ',' + abr + ',' + video_name + moment();
  const filePath = statsDir + '/' + filename + '.json';

  fs.writeFile(filePath, requestData, (err) => {
    if (err) {
      console.error('Error writing file: ', err);
      res.status(500).send("Internal error");
    } else {
      console.log("Stats data written to " + filePath);
      res.send("Received");
    }
  });
});


app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});


app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on port ${port}`);
});
