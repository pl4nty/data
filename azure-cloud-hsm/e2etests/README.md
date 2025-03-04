# Cloud HSM Extension E2E tests

## Setup

1. In order to run the tests you need to write credentials to the windows credential manager.
   See [Authentication](#authentication) section for more details.
2. Make sure you have **Node.js** installed on your machine. You can download and install it
   at [Node.js's official website](https://nodejs.org/en/). The recommended Node.js version is typically the latest LTS.
   At the time of writing, the recommended version is `22.x`.
   > NOTE: Usage of [nvm-windows](https://github.com/coreybutler/nvm-windows#install-nvm-windows) is recommended to
   > manage multiple node versions.
3. Install npm. You can find how to do it [here](https://www.npmjs.com/get-npm).
4. Clone this repo to your local machine using Git. You can find how to use Git
   clone [here](https://docs.microsoft.com/en-us/azure/devops/repos/git/clone?view=azure-devops&tabs=visual-studio).
5. Navigate to the `e2etests` folder of the project on your local machine. For example, if you cloned this repo to "C:
   \repo\Security-CHSM-Portal", your command prompt should show "C:\repo\Security-CHSM-Portal\e2etests".
6. Run `npm install`.
7. Run `.\scrips\run-browser-driver-install.ps1` in order to install the playwright browser engines.

## How to run the tests

### Against side-loaded local version

Run `.\scripts\run-e2e-tests.ps1`

**Note**: If some of your E2E test cases are failing when you run this then it means that your tests may not be up to
date. Make sure that your E2E test cases are matching the changes in the Dev code.

### Against the deployed version

Run `.\scripts\run-live-e2e-tests.ps1 -StageName <stage-name>`

where `<stage-name>` is either `Preview` or a number 1..5 indicating the corresponding public cloud deployment stage.

### Inspecting failures

If you see a test failure, you can inspect the failure by looking at the screenshots in the `.\e2etests\Screenshots`
folder.

Sometimes, screenshots may be insufficient, and watching the entire interaction may be necessary. In this case, you can
disable the headless mode by passing the `-Interactive` flag to the runner script, e.g.:

```pwsh
...e2etests> .\scripts\run-e2e-tests.ps1 -Interactive
```

or

```pwsh
...e2etests> .\scripts\run-live-e2e-tests.ps1 -StageName 5 -Interactive
```

---

## Authentication

1. Get the test account password from the cloudhsmtestaccountpasskey Secret
   inside [cloudhsmtestaccount-kv KeyVault](https://ms.portal.azure.com/#@microsoft.onmicrosoft.com/resource/subscriptions/3e1398f4-49b3-47bd-81a8-7ac520396295/resourceGroups/AzureCloudHSMPortal-E2ETests/providers/Microsoft.KeyVault/vaults/cloudhsmtestaccount-kv/secrets).
2. Write <cloudhsmportale2etst@microsoft.com> credentials to the windows credential manager using the following command:
   `cmdkey /generic:cloudhsmportale2etst@microsoft.com/signIn /user:cloudhsmportale2etst@microsoft.com /pass:<PASSWORD>`
