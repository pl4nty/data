//
// Copyright (C) Microsoft. All rights reserved.
//

define(() => {
    class OobePrepTransitionToNextApp {
        launchAsync() {
            return new WinJS.Promise(function (completeDispatch /*, errorDispatch, progressDispatch */) {
                CloudExperienceHost.Telemetry.logEvent("OobePrepTransitionToNextAppStart");
                CloudExperienceHost.Storage.VolatileSharableData.addItem("OobePrepTransitionToNextAppValues", "launchNextApp", false);

                try {
                    CloudExperienceHostAPI.UtilStaticsCore.setDefaultUserSessionNextAppLaunch(true);
                    CloudExperienceHost.Telemetry.logEvent("SetDefaultUserSessionNextAppLaunchSucceeded");
                    CloudExperienceHost.Storage.VolatileSharableData.addItem("OobePrepTransitionToNextAppValues", "launchNextApp", true);

                    // TODO: Move prepEnduserSession logic to OHA: https://task.ms/57004214
                    CloudExperienceHostAPI.UtilStaticsCore.prepEnduserSessionAsync().then(() => {
                        CloudExperienceHost.Telemetry.logEvent("PrepEnduserSessionSucceeded");
                        let sharableDataPromise = CloudExperienceHost.Storage.SharableData.saveDataForOobeAsync();
                        let volatileSharableDataPromise = CloudExperienceHost.Storage.VolatileSharableData.saveDataForOobeAsync();

                        WinJS.Promise.join({ sharableDataPromise, volatileSharableDataPromise }).then(() => {
                            CloudExperienceHost.Telemetry.logEvent("SaveDataForOobeSucceeded");                            
                            completeDispatch(CloudExperienceHost.AppResult.success);
                        }, (err) => {
                            CloudExperienceHost.Telemetry.logEvent("SaveDataForOobeFailed", CloudExperienceHost.GetJsonFromError(err));
                            completeDispatch(CloudExperienceHost.AppResult.success);
                        });
                    }, (err) => {
                        CloudExperienceHost.Telemetry.logEvent("PrepEnduserSessionFailed", CloudExperienceHost.GetJsonFromError(err));
                        completeDispatch(CloudExperienceHost.AppResult.fail);
                    });
                } catch (err) {
                    CloudExperienceHost.Telemetry.logEvent("SetDefaultUserSessionNextAppLaunchFailed", CloudExperienceHost.GetJsonFromError(err));
                    completeDispatch(CloudExperienceHost.AppResult.fail);
                }
            });
        }
    }
    return OobePrepTransitionToNextApp;
});