
"use strict";

(() => {
    WinJS.UI.Pages.define("/webapps/inclusiveOobe/view/autopilot/autopilotDevicePreparation-main.html", {
        init: (element, options) => {
            require.config(new RequirePathConfig('/webapps/inclusiveOobe'));

            let getContextAndLoadCssPromise = requireAsync(['legacy/bridge']).then((result) => {
                result.legacy_bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "DevicePrepPage: Loading page context");

                return result.legacy_bridge.invoke("CloudExperienceHost.getContext");
            }).then((targetContext) => {
                this.targetPersonality = targetContext.personality ? targetContext.personality : CloudExperienceHost.TargetPersonality.InclusiveBlue;
            }).then(() => {
                return requireAsync(['legacy/uiHelpers', 'legacy/bridge', 'legacy/core']);
            }).then((result) => {
                return result.legacy_uiHelpers.LoadCssPromise(document.head, "", result.legacy_bridge);
            });

            let langAndDirPromise = requireAsync(['legacy/uiHelpers', 'legacy/bridge']).then((result) => {
                return result.legacy_uiHelpers.LangAndDirPromise(document.documentElement, result.legacy_bridge);
            });

            let getLocalizedStringsPromise = requireAsync(['legacy/bridge', 'legacy/core']).then((result) => {
                return result.legacy_bridge.invoke("CloudExperienceHost.AutoPilot.makeAutopilotResourceObject").then((resultString) => {
                    this.resourceStrings = JSON.parse(resultString);
                }, (error) => {
                    result.legacy_bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "Autopilot_devicePreparationPagePage_FailedToLoadResource", result.legacy_core.GetJsonFromError(error));
                });
            });


            return WinJS.Promise.join({
                getContextAndLoadCssPromise: getContextAndLoadCssPromise,
                getLocalizedStringsPromise: getLocalizedStringsPromise,
                langAndDirPromise: langAndDirPromise
            });
        },

        error: (e) => {
            require(['legacy/bridge', 'legacy/events'], (bridge, constants) => {
                bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "Autopilot enrollment status page failed to load", JSON.stringify({ error: e }));
                bridge.fireEvent(constants.Events.done, constants.AppResult.error);
            });
        },

        ready: (element, options) => {
            require(
                [
                    'lib/knockout', 
                    'corejs/knockouthelpers', 
                    'legacy/bridge',
                    'legacy/events',
                    'autopilot/autopilotDevicePreparation-vm',
                    'autopilot/bootstrapSessionGeneralUtilities'
                ],
                (
                    ko,
                    koHelpers,
                    bridge,
                    constants,
                    autopilotDevicePreparationViewModel,
                    bootstrapSessionGeneralUtilities) => {

                    this.sessionUtilities = new bootstrapSessionGeneralUtilities(true);

                    let koPageHelpers = new koHelpers();
                    koPageHelpers.registerComponents(CloudExperienceHost.RegisterComponentsScenarioMode.LightProgress, true /*holdForAdditionalRegistration*/);
                    koPageHelpers.registerComponents(CloudExperienceHost.RegisterComponentsScenarioMode.InclusiveOobe);
                    window.KoHelpers = koHelpers;

                    let viewModel = new autopilotDevicePreparationViewModel(
                        this.resourceStrings,
                        this.targetPersonality,
                        this.sessionUtilities);

                    ko.applyBindings(viewModel);

                    koHelpers.waitForInitialComponentLoadAsync().then(() => {
                        WinJS.Utilities.addClass(document.body, "pageLoaded");
                        bridge.fireEvent(constants.Events.visible, true);
                        koHelpers.setFocusOnAutofocusElement();
                    });
            });
        }
    });
})();
