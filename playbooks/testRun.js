
var Docker = require('../lib/docker');

var docker = new Docker({
  socketPath: '/var/run/docker.sock'
});



docker.run('mongo',  [] , process.stdout, {
  'Volumes': {
    '/stuff': {}
  },
  'ExposedPorts': {
    '80/tcp': {}
  }
} )



docker.run('mongo', [], process.stdout, {
  'Volumes': {
    '/stuff': {}
  },
  'ExposedPorts': {
    '80/tcp': {}
  }
}, {
  'Binds': ['/home/vagrant:/stuff']
}, function(err, data, container) {
  console.log(data.StatusCode);
});



