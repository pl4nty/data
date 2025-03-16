// It's an Electron app. Pass the file path as an argument to an Electron binary.
//
// Accepts one optional argument:
// a component name, e.g. "chrome" or "node", to print a version for.
// With no arguments prints versions of all components in JSON format.

let textToPrint = '';

const componentName = process.argv[2] || null;
if (componentName === null) {
  textToPrint = process.versions;
} else {
  textToPrint = process.versions[componentName];
}

process.stdout.write(textToPrint);
process.exit(0);
