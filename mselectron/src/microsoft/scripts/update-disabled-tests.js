const { argv } = require('node:process');
const { writeFileSync } = require('node:fs');
const path = require('node:path');

const platform = argv[2] || 'linux';
const flavor = argv[3] || 'electron';
const disabledTestsPath = argv[4] || path.resolve(__dirname, '../../electron/spec/disabled-tests.json');
const disabledTests = require(disabledTestsPath);
const filesToRead = [
  'disabled_tests.json',
  `disabled_${platform}_tests.json`,
  `disabled_${platform}_${flavor}_tests.json`
];

let updatedTests = disabledTests;
let shouldUpdate = false;
filesToRead.forEach((configFile) => {
  try {
    const configDisabledPath = path.resolve(__dirname, '../configs', configFile);
    const configDisabledTests = require(configDisabledPath);
    updatedTests = updatedTests.concat(configDisabledTests);
    shouldUpdate = true;
    console.log(`Added additional disabled tests from ${configFile}`);
  } catch (ex) {
    // If the error is MODULE_NOT_FOUND that means that a config doesn't exist
    // and is safe to ignore the error.
    if (ex.code !== 'MODULE_NOT_FOUND') {
      console.error(ex);
    }
  }
});

if (shouldUpdate) {
  writeFileSync(disabledTestsPath, JSON.stringify(updatedTests, null, 2));
}
