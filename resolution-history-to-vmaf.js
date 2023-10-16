const fs = require('fs');

const args = process.argv.slice(2);

// Specify the path to your JSON file
const filePath = args[0];

const vmaf_480 = [
  52.181534,
  65.594718,
  68.28367,
  69.478457,
  69.76835,
  70.01265,
  69.883686,
  71.141273,
  71.064597,
  70.197337,
  71.052806,
  70.726918,
  71.050913,
  70.051089,
  70.359422,
  70.494023,
  70.961747,
  70.559279
];

const vmaf_720 = [
  85.48015
  ,85.070845
  ,85.30622
  ,84.768845
  ,85.923464
  ,85.791688
  ,85.373442
  ,85.748237
  ,86.198127
  ,84.95796
  ,85.490318
  ,85.075827
  ,85.333027
  ,85.159355
  ,85.210996
  ,85.165714
  ,85.191276
  ,85.664726
];

const vmaf_1080 = [
  85.48015
  ,85.070845
  ,85.30622
  ,84.768845
  ,85.923464
  ,85.791688
  ,85.373442
  ,85.748237
  ,86.198127
  ,84.95796
  ,85.490318
  ,85.075827
  ,85.333027
  ,85.159355
  ,85.210996
  ,85.165714
  ,85.191276
  ,85.664726
];

// Use fs.readFile to read the JSON file
fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading JSON file:', err);
    return;
  }

  // Parse the JSON data into a JavaScript object
  const jsonData = JSON.parse(data);

  // Now you can work with the jsonData object
  var res_history = jsonData.history.resolutionHistory;
  for (var i=0; i < res_history.length; i++) {
    // Use i to figure out which segment we're in
    if (res_history[i] === '640x480') {
      console.log(vmaf_480[Math.trunc(i/20)])
    }
    else if (res_history[i] === '1280x720') {
      console.log(vmaf_720[Math.trunc(i/20)])
    }
    else if (res_history[i] === '1920x1080') {
      console.log(vmaf_1080[Math.trunc(i/20)])
    }
  }
});

