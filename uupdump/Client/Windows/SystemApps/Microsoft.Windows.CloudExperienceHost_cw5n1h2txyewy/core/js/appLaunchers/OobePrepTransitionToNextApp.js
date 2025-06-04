//
// Copyright (C) Microsoft. All rights reserved.
//

define(() => {
    class OobePrepTransitionToNextApp {
        launchAsync() {
            return new WinJS.Promise(function (completeDispatch /*, errorDispatch, progressDispatch */) {
                CloudExperienceHost.Telemetry.logEvent("OobePrepTransitionToNextAppStart");
                CloudExperienceHost.Storage.VolatileSharableData.addItem("OobePrepTransitionToNextAppValues", "launchNextApp", false);

                // TODO: Move prepEnduserSession logic to OHA: https://task.ms/57004214
                CloudExperienceHostAPI.UtilStaticsCore.prepEnduserSessionAsync().then(() => {
                    let sharableDataPromise = CloudExperienceHost.Storage.SharableData.saveDataForOobeAsync();
                    let volatileSharableDataPromise = CloudExperienceHost.Storage.VolatileSharableData.saveDataForOobeAsync();

                    WinJS.Promise.join({ sharableDataPromise, volatileSharableDataPromise }).then(() => {
                        CloudExperienceHost.Telemetry.logEvent("SaveDataForOobeSucceeded");
                        CloudExperienceHost.Storage.VolatileSharableData.addItem("OobePrepTransitionToNextAppValues", "launchNextApp", true);
                        CloudExperienceHost.Telemetry.logEvent("LaunchOhaFlagSet");
                        completeDispatch(CloudExperienceHost.AppResult.success);
                    }, (err) => {                        
                        CloudExperienceHost.Telemetry.logEvent("SaveDataForOobeFailed", CloudExperienceHost.GetJsonFromError(err));
                        completeDispatch(CloudExperienceHost.AppResult.success);
                    });
                }, (err) => {
                    CloudExperienceHost.Telemetry.logEvent("OobePrepTransitionToNextAppFailed", CloudExperienceHost.GetJsonFromError(err));
                    completeDispatch(CloudExperienceHost.AppResult.fail);
                });
            });
        }
    }
    return OobePrepTransitionToNextApp;
});