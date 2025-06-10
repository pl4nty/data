const { argv } = require('node:process');
const crypto = require('node:crypto');
const { execSync } = require('node:child_process');
const fs = require('node:fs');
const path = require('node:path');

const SOURCE_CACHE_URL_PREFIX = 'https://electronsrccache.z5.web.core.windows.net/source-cache/';

// Per platform hash versions to bust the cache on different platforms
const HASH_VERSIONS = {
  darwin: 1,
  win32: 1,
  linux: 1
};

// Base files to hash
const filesToHash = [
  path.resolve(__dirname, '../DEPS'),
];

const addAllFiles = (dir) => {
  for (const child of fs.readdirSync(dir).sort()) {
    const childPath = path.resolve(dir, child);
    if (fs.statSync(childPath).isDirectory()) {
      addAllFiles(childPath);
    } else {
      filesToHash.push(childPath);
    }
  }
};

// Add all patch files to the hash
addAllFiles(path.resolve(__dirname, '../patches'));

// Create Hash
const hasher = crypto.createHash('SHA256');
const addToHashAndLog = (s) => {
  return hasher.update(s);
};
addToHashAndLog(`HASH_VERSION:${HASH_VERSIONS[process.platform]}`);
for (const file of filesToHash) {
  hasher.update(fs.readFileSync(file));
}

// Add the platform variable to the hash
let platform = argv[2] || 'unknown';
if (platform === 'mas') {
  platform = 'mac';
}
addToHashAndLog(platform);

const depshash = hasher.digest('hex');
const blobURL = `${SOURCE_CACHE_URL_PREFIX}${depshash}.tgz`;
try {
  const blobQuery = `az storage blob exists --blob-url ${blobURL}`;
  const queryResponse = execSync(blobQuery).toString();
  const blobExists = JSON.parse(execSync(blobQuery).toString());
  // Echo to stdout if cache is present
  if (blobExists.exists) {
    console.log('true');
  } else {  
    console.log('false');
  }
} catch (error) {
  console.error('Error checking blob existence:', error.message);
  console.log('unknown');
}

// Write the hash to disk
fs.writeFileSync(path.resolve(__dirname, '../.depshash'), depshash);
