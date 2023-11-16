const express = require('express');
const fs = require('fs');
const moment = require('moment');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const express_handlebars = require('express-handlebars');

const app = express();
const port = 3000

// Change to your server
var VIDEO_SERVER = 'localhost:8080';

if (process.argv.length > 2) {
  VIDEO_SERVER = process.argv[2];
}

app.set('view engine', 'handlebars');
app.engine('handlebars', express_handlebars.engine());
app.engine('handlebars', express_handlebars.engine({ defaultLayout: false }));
// app.use('public');

const statsDir = 'stats';

var jsonParser = bodyParser.json({limit: "500mb"});

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

app.get('/:video/:strategy/:mobility/:los', (req, res) => {
  const { video, strategy, mobility, los } = req.params;
  if (req.query.server) {
    media_server = req.query.server;
  }
  else {
    media_server = VIDEO_SERVER;
  }
  console.log(media_server, video, strategy, mobility, los);
  res.render('index', { 'video_server': media_server, video, strategy, mobility, los });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on port ${port}`);
});
