const { argv } = require('node:process');
const { readFileSync, writeFileSync } = require('node:fs');
const path = require('node:path');

// 27.1.3-electron-8806237
const releaseDetails = readFileSync('version.txt').toString().trimEnd().split('-');
const version = releaseDetails[0];

const fileSuffixes = [
  'darwin-arm64',
  'darwin-x64',
  'linux-arm64',
  'linux-armv7l',
  'linux-x64',
  'win32-arm64',
  'win32-ia32',
  'win32-x64',
  'electron',
  'node-headers'
];

fileSuffixes.forEach(fileSuffix => {
  const rolloutFile = `RolloutParameters.${fileSuffix}.json`;
  const rolloutFilePath = path.resolve('RolloutParameters', rolloutFile);
  const rolloutParameters = require(rolloutFilePath);
  const payloadProperties = rolloutParameters.extensions[0].payloadProperties;
  let sourceSASPath = payloadProperties.sourceSAS.reference.path;
  sourceSASPath = sourceSASPath.replaceAll('__ELECTRON_VERSION__', version);
  payloadProperties.sourceSAS.reference.path = sourceSASPath;
  writeFileSync(rolloutFilePath, JSON.stringify(rolloutParameters, null, 2), 'utf8');
});

const flavor = argv[2];
if (flavor === 'electron') {
  // Add node headers to release
  const rolloutSpecFile = 'RolloutSpec.prod.json';
  const rolloutSpecFilePath = path.resolve('RolloutSpecs', rolloutSpecFile);
  const rolloutSpec = require(rolloutSpecFilePath);
  rolloutSpec.orchestratedSteps.push({
    name: 'Upload Node Headers',
    targetType: 'ServiceResource',
    targetName: 'Upload Node Headers Release',
    actions: ['extension/AzCopy']
  });
  writeFileSync(rolloutSpecFilePath, JSON.stringify(rolloutSpec, null, 2), 'utf8');
}
