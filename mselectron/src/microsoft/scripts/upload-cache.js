const SOURCE_CACHE_URL_PREFIX = 'https://electronsrccache.z5.web.core.windows.net/';
const SOURCE_CACHE_CONTAINER = '$web'
const { exec } = require('node:child_process');
const fs = require('node:fs');
const { Readable } = require('stream');
const { finished } = require('stream/promises');
const path = require('node:path');
const { argv } = require('node:process');


const sourceCacheName = argv[2];
const artifactDirectory = argv[3];
const platform = argv[4] || 'unknown';
// Number of reties to upload the cache if it is invalid
const retries = argv[5] || 5;
const sourceCacheFile = `source-cache/${sourceCacheName}.tgz`;

async function execCommand(command) {  
  return new Promise((resolve, reject) => {
    const child = exec(command);
    child.stdout.on('data', function(data) {
      console.log(data);
    });
    child.stderr.on('data', function(data) {
      console.error(data);
    });
    child.on('close', function(code) {
      console.log(`${command} exited with code ${code}`);
      if (code === 0) {
        resolve(code);
      } else {      
        reject(new Error(`${command} exited with code ${code}`));
      }
    });
    child.on('error', function(err) {
      reject(err);
    });
  });
}    

async function verifyCache() {
  let cacheValid = true;
  // Download the source cache file
  const sourceCacheURL = `${SOURCE_CACHE_URL_PREFIX}${sourceCacheFile}`;
  console.log(`Verifying cache: ${sourceCacheFile}`);

  try {
    console.log(`Downloading cache: ${sourceCacheFile}`);
    const stream = fs.createWriteStream('source-cache.tgz');
    const { body } = await fetch(sourceCacheURL);
    await finished(Readable.fromWeb(body).pipe(stream));

    // Verify the download
    let verifyCommand = 'gzip -tv source-cache.tgz';
    if (platform === 'windows') {
      verifyCommand = '7z t source-cache.tgz';
    }
    try {
      console.log(`Verifying cache.${sourceCacheFile}`);
      await execCommand(verifyCommand);
    } catch (error) {
      cacheValid = false;
      console.error('Error verifying source cache:', error);
    }
  } catch (error) {
    cacheValid = false;
    console.error('Error downloading source cache:', error);   
  }
  // Remove the downloaded file
  fs.unlinkSync('source-cache.tgz');
  return cacheValid;
}

function getContainerName() {
  // Non windows OSes use single quotes to escape the container name
  if (platform === 'windows') {
    return `${SOURCE_CACHE_CONTAINER}`;
  } else {
    return `'${SOURCE_CACHE_CONTAINER}'`;
  }
}

async function deleteCacheFromAzure() {
  const deleteCommand = `az storage blob delete -c ${getContainerName()} -n ${sourceCacheFile}`;
  try {
    console.log(`Deleting file: ${sourceCacheFile}`);
    await execCommand(deleteCommand);
    console.log('File deleted successfully');
  } catch (error) {
    console.error('Error deleting file from Azure:', error);
  }
}

async function uploadCacheToAzure() {
  const fileToUpload = path.normalize(`${artifactDirectory}/${sourceCacheFile}`);
  const uploadCommand = `az storage blob upload -c ${getContainerName()} -f ${fileToUpload} -n ${sourceCacheFile}`;
  try {
    console.log(`Uploading cache: ${fileToUpload}`);
    await execCommand(uploadCommand);
    console.log('Cache uploaded successfully');
    return true;
  } catch (error) {
    console.error('Error uploading cache to Azure:', error);
    return false;
  }
}

async function uploadCache() {
  for (let i = 0; i < retries; i++) {
    const uploadSuccess = await uploadCacheToAzure();
    if (!uploadSuccess) {      
      continue;
    }
    const cacheValid = await verifyCache();
    if (cacheValid) {
      console.log('Cache is valid on attempt #:', i + 1);
      process.exit(0);
    } else {      
      console.log(`Cache is invalid on attempt #: ${i +1}, deleting cache...`);
      await deleteCacheFromAzure();
    }
  }
  process.exit(1)
}

uploadCache();