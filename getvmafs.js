const fs = require('fs');

const args = process.argv.slice(2);

// Specify the path to your JSON file
const filePath = args[0];

// Use fs.readFile to read the JSON file
fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading JSON file:', err);
    return;
  }

  // Parse the JSON data into a JavaScript object
  const jsonData = JSON.parse(data);

  // Now you can work with the jsonData object
  console.log(jsonData.pooled_metrics.vmaf.mean);
});

