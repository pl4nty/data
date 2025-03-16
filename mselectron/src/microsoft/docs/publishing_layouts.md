# Publishing layouts

Our customers consume Electron from several different locations.  
For every distribution channel we have to publish slightly different list of files,  
create a unique directories' structure, and use a channel-specific naming convention.

Publishing layout templates control lists of files we publish, their exact names,  
and how they are organized. They help us to ensure that we include everything  
that we're supposed to include into a release.  

Implementation-wise it is a list of file copying rules.

```json
{
  // A layout template: list of files that is going to be published.
  "layout": [
    // A plain string specifies a file to copy from the input directory to the output directory.
    "file/path.txt",

    // An object with one key-value pair is a "publishing rule".
    // In its simplest form it can be used to move or rename a file.
    // The key on the left is an output file path, the value of the right – an input file path.
    {"artifact_name.txt": "directory/with/artifact.txt"},

    // In a more advanced form an output file path can be a template string.
    // When you supply a key-value pair to a layout processing script,
    // e.g. "version=1.0.0", the 'version' placeholder will be replaced by the '1.0.0' string.
    {"artifact-v${version}.txt": "artifact.txt"},
    // artifact.txt -> artifact-v1.0.0.txt

    // When a substitution has multiple values, all possible combinations
    // of all substitutions will be used to generate a group of files.
    {"${platform}-${arch}.txt": "${platform}/${arch}/artifact.txt"},
    // The template above will generate a group of five copying rules:
    // linux/x64/artifact.txt -> linux-x64.txt
    // linux/x86/artifact.txt -> linux-x86.txt
    // mac/x64/artifact.txt -> mac-x64.txt
    // windows/x64/artifact.txt -> windows-x64.txt
    // windows/x86/artifact.txt -> windows-x86.txt
    
    // Standard substitutions are "platform" and "arch".
    // Only supported combinations are used, e.g. there won't be ("mac", "x86").
  ],

  // Optional dictionary of standard substitutions' replacements.
  // Those will be used for output file names only.
  // Input files _have_ to use canonical names.
  "mapping": {
    "platform": {
      // Use "win" instead of "windows" for output files' ${platform}.
      "windows": "win"  
    }
  },

  // Optionally generate checksum list file for all resulting files
  // in the output directory.
  "checksums": [
    {
      // Algorithm to use.
      "algorithm": "sha256",

      // If all files should be treated as binary files. False by default.
      "as_binary": true,

      // Optionally enforce format marker style.
      // By default depends on if files are treated as binary files or text files.
      "format_marker": "space",

      // Output file name.
      "output": "SHASUMS256.txt"
    },
    <...>
  ]
}
```

Use this script to create a list of files ready to be published according to a layout specified.

```bash
$ python scripts/create_publishing_layout.py
    --config configs/publishing_layout/distribution.layout.json
    --input-dir directory/with/build/artifacts/
    --output-dir files/ready/to/be/published/
    --data key_one=value_one key_two=value_two
```
