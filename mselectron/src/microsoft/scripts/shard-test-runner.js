const { argv } = require('node:process');
const { fork } = require('node:child_process');
const { readdirSync } = require('node:fs');
const path = require('node:path');

const filesToSkip = {
  linux: [
    // The following tests are disabled because abstract-socket doesn't work on linux CI
    'api-notification-dbus-spec.ts',
    'api-power-monitor-spec.ts'
  ],
  mac: [],
  windows: []
};

function getFiles (directoryPath, platform) {
  return readdirSync(directoryPath)
    .filter((base) => /-spec\.[tj]s$/.test(base) && !filesToSkip[platform].includes(base))
    .map((base) => path.join(directoryPath, base));
}

async function shardTests (shard, runner, platform) {
  const testFiles = getFiles(__dirname, platform);
  const midPoint = Math.floor(testFiles.length / 2);
  let fileList;
  switch (shard) {
    case '0':
      fileList = testFiles.slice(0, midPoint);
      break;
    case '1':
      fileList = testFiles.slice(midPoint);
      break;
    default:
      fileList = testFiles;
  }
  const specRunner = path.resolve(__dirname, '../script/spec-runner.js');
  const child = fork(specRunner, ['--enable-logging', '--verbose', `--runners ${runner}`, '--files', ...fileList]);
  child.on('exit', code => process.exit(code));
}

const shard = argv[2] || '0';
const runner = argv[3] || 'main';
const platform = argv[4] || 'linux';
shardTests(shard, runner, platform);
