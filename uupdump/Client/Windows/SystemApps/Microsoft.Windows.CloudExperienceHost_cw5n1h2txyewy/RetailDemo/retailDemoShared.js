var retailDemoShared;
(function (retailDemoShared) {

    function SetupPageSuccessNavigation(specifiedPassword, navFlow, bridge) {
        switch (navFlow) {
            case "FRXRDX":
                CreateRetailAdminThen(specifiedPassword, bridge, function () {
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.success);
                }, function () {
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
                });
                break;
            case "FRX" :
            case "FRXINCLUSIVE":
                CreateRetailAdminThen(specifiedPassword, bridge, () => {
                    CommitExpressSettings(bridge).then(() => {
                        return EnableRetailDemoFromOOBE(bridge);
                    }).done(() => {
                        bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.success);
                    }, () => {
                        bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
                    });
                }, () => {
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
                });
                break;
            case "FRXRDXMOB":
            case "RDXRACSKU":
                bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.success);
                break;
            case "RDXPOSTOOBE":
            case "RDXPOSTOOBEINCLUSIVE":
                CreateRetailAdminThen(specifiedPassword, bridge, function () {
                    StartPostOOBE(bridge);
                }, function () {
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
                });
                break;
            default: // Unknown flow
                bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.abort);
                break;
        }
    }
    retailDemoShared.SetupPageSuccessNavigation = SetupPageSuccessNavigation;

    function CreateRetailAdminThen(specifiedPassword, bridge, complete, error) {
        bridge.invoke("CloudExperienceHost.LocalAccount.createRetailAccount", specifiedPassword, true).done(complete, function (e) {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "CreateRetailAdminAccountFailure", JSON.stringify({ number: e.number.toString(16), description: e.description }));
            if (e.number === -2147023580) { //ERROR_USER_EXISTS
                complete();
            } else {
                error();
            }
        });
    }
    retailDemoShared.CreateRetailAdminThen = CreateRetailAdminThen;

    function StartPostOOBE(bridge) {
        bridge.invoke("CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.startPostOOBE").done(function () {
            bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.success);
        }, function (error) {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "ConfigureRetailDemoFailure", JSON.stringify({ number: error.number.toString(16), description: error.description }));
            bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
        });
    }
    retailDemoShared.StartPostOOBE = StartPostOOBE;

    function EnableRetailDemoFromOOBE(bridge) {
        return bridge.invoke("CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.enableRetailDemoFromOOBEAsync").then(() => {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "EnableRetailDemoFromOOBESuccessful");
        }, (error) => {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "EnableRetailDemoFromOOBEAsyncFailure", CloudExperienceHost.GetJsonFromError(error));
            return WinJS.Promise.wrapError(error);
        });
    }
    retailDemoShared.EnableRetailDemoFromOOBE = EnableRetailDemoFromOOBE;

    function CommitExpressSettings(bridge) {
        let settings = [];
        let oobeSettingsGroups = CloudExperienceHostAPI.OobeSettingsStaticsCore.getSettingGroups();
        for (let settingGroup of oobeSettingsGroups) {
            let settingsInGroup = settingGroup.getSettings();
            for (let setting of settingsInGroup) {
                settings.push(setting);
            }
        }
        return CloudExperienceHostAPI.OobeSettingsStaticsCore.commitSettingsAsyncForUser(null, settings, 1 /*PrivacyConsentPresentationVersion::None*/).then(() => {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "CommitSettingsSuccessful", "Express");
        }, (error) => {
            bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "CommitSettingsAsyncWorkerFailure", CloudExperienceHost.GetJsonFromError(error));
            return WinJS.Promise.wrapError(error);
        });
    }
    retailDemoShared.CommitExpressSettings = CommitExpressSettings;

})(retailDemoShared || (retailDemoShared = {}));
