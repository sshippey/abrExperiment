const express = require('express');
const fs = require('fs');
const moment = require('moment');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const express_handlebars = require('express-handlebars');

const app = express();
const port = 3000

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

app.get('/:video/:strategy', (req, res) => {
  const { video, strategy } = req.params;
  console.log(video, strategy);
  res.render('index', { video, strategy });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on port ${port}`);
});
