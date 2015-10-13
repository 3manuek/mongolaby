
var numShards = 2
var replFactor = 3

var Docker = require('../lib/docker');

var docker = new Docker({
  socketPath: '/var/run/docker.sock'
});


// Create the data directory 
function createFolder(folder = 'cfg/') {
  mkdirp(folder, function (err) {
  if (err) { throw err; } });
}



/*
Docker API reference:
https://github.com/docker/docker/blob/docs/docs/reference/api/docker_remote_api_v1.9.md
*/

docker.run('mongo', [], process.stdout, {
  'Volumes': {
    '/stuff': {}
  },
  'ExposedPorts': {
    '80/tcp': {}
  }
}, {
  'Binds': ['/home/vagrant:/stuff'],
  'PortBindings' : {
     "80/tcp": [
                   {
                     "HostIp": "0.0.0.0",
                     "HostPort": "49153"
                   }
  } 
}, function(err, data, container) {
  console.log(data.StatusCode);
});



