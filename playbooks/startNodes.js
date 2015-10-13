// http://mongodb.github.io/node-mongodb-native/contents.html

var replicationFactor = 3
var shardFactor = 2


var Docker = require('node_modules/dockerode');

/*
var docker = new Docker({socketPath: '/var/run/docker.sock'});
var docker1 = new Docker(); //defaults to above if env variables are not used
var docker2 = new Docker({host: 'http://192.168.99.100', port: 3000});
var docker3 = new Docker({protocol:'http', host: '127.0.0.1', port: 3000});
var docker4 = new Docker({host: '127.0.0.1', port: 3000}); //defaults to http
*/

var docker_test = new Docker({
  port : process.env.DOCKER_PORT || 27001
});

var container = docker_test.getContainer();

container.inspect(function (err, data) {
  console.log(data);
});

container.start(function (err, data) {
  console.log(data);
});

container.remove(function (err, data) {
  console.log(data);
});


/*
docker_test.run('mongo', ['bash', '-c', 'uname -a'], process.stdout, function (err, data, container) {i
  console.log(data.StatusCode);
});
*/

// /Users/emanuel/.docker/machine/machines/default


//protocol http vs https is automatically detected

/*
var docker5 = new Docker({
  host: '192.168.1.10',
  port: process.env.DOCKER_PORT || 2375,
  ca: fs.readFileSync('ca.pem'),
  cert: fs.readFileSync('cert.pem'),
  key: fs.readFileSync('key.pem')
});

var docker6 = new Docker({
  protocol: 'https', //you can enforce a protocol
  host: '192.168.1.10',
  port: process.env.DOCKER_PORT || 2375,
  ca: fs.readFileSync('ca.pem'),
  cert: fs.readFileSync('cert.pem'),
  key: fs.readFileSync('key.pem')
});
*/


/*
 bash-3.2$ docker run --name mongo3 -d mongo:latest --smallfiles
29d427b541362f27a0e15c5b1e54e625a78fd79343538fe9947dd04bda453882


docker run \
--name mongo \
-v /home/core/mongo-files/data:/data/db \
-v /home/core/mongo-files:/opt/keyfile \
--hostname="node1.example.com" \
--add-host node1.example.com:${node1} \
-p 27017:27017 -d mongo:2.6.5 \
--smallfiles \
--keyFile /opt/keyfile/mongodb-keyfile \
--replSet "rs0"
*/


