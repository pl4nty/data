# RBE

> RBE is a distributed compiler service for open-source project such as Chromium and Android.

<https://github.com/bazelbuild/remote-apis>

## (Re)authenticate RBE for CI builds

 1. Get Electron's RBE credential helper

    If you have a full checkout of the internal Electron, run "./scripts/checkout_rbe_helper.py",
    it will place "rbe-credential-helper" next to "src".  
    If you don't have a checkout, keep reading.

     1. Checkout Electron's [rbe-credential-helper][]:
        ```bash
        $ git clone https://github.com/electron/build-tools.git
        ```

     1. Run `npm install` in the repo root directory.

     1. Run `npm link` in the repo root directory.

 1. Run `rbe-credential-helper login` to get an authorization URL.  Copy the authorization URL 
 to a browser and log in with your "@microsoft.com" account.

 1. Run `rbe-credential-helper printForCI` to get the authorization token. Copy the token to the
  "ELECTRON_RBE_JWT" secret in the [[MicrosoftElectron-Dev][] library variable group.

[rbe-credential-helper]: https://devdiv.visualstudio.com/DevDiv/_git/electron-rbe-credential-helper
[MicrosoftElectron-Dev]: https://devdiv.visualstudio.com/DevDiv/_library?itemType=VariableGroups&view=VariableGroupView&variableGroupId=515&path=MicrosoftElectron-Dev
