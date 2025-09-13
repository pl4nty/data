const grpc = require('@grpc/grpc-js');
const { service } = require('grpc-health-check');

// Create a client for the health service            
const HealthClientConstructor = grpc.makeClientConstructor(service, 'grpc.health.v1.HealthService');

function generateAuthMetadata(params, callback) {
   const metadata = new grpc.Metadata();
   const token = process.env.ELECTRON_RBE_JWT;
   metadata.add('authorization', `Bearer ${token}`);
   callback(null,metadata);
}

const authCreds = grpc.credentials.createFromMetadataGenerator(generateAuthMetadata);
const sslCreds = grpc.credentials.createSsl();
const combinedCreds = grpc.credentials.combineChannelCredentials(sslCreds, authCreds);
const healthClient = new HealthClientConstructor('rbe.ionicpineapple.com:443', combinedCreds);

// Check the health status of the service
healthClient.check({ service: '' }, (err, response) => {
  if (err) {
    console.error('Error checking health status:', err.message);
  } else {
    console.log('Health status:', response.status); // SERVING, NOT_SERVING, etc.
  }
  if (err || response.status !== 'SERVING') {
    process.exit(1);
  } else {
    process.exit(0);
  }
});