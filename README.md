# A Framework for Testing ABR Algorithms End to End over Real Hardware

## Configuration

## Setup
Dependencies: `node`, `npm`, an HTTP server (e.g. [node http-sever](https://www.npmjs.com/package/http-server)).

Node dependencies: `express`, `express-handlebars`, `moment`, `fs`

```
$ npm i
```

Start the HTTP server within the `videos/` directory, making sure that CORS is enabled:

```
$ cd abrExperiment/videos
$ http-server --cors
```

Take note of the IP and port. Then run:

```
$ node app.js VIDEO_SERVER_IP:PORT
```

Take note of the node server's IP and port combination.

## Performing tests

Open google chrome on the client device and navigate to the node server's `IP:port/videoname/abrStategy/mobility/los`. For instance, to evaluate the BOLA algorithm on a video called `runner` with an immobile client within line of sight, you would navigate to `IP:port/runner/abrBola/immobile/los`. These last two parameters will be used to name the log files, and can be anything as long as they make sense.
