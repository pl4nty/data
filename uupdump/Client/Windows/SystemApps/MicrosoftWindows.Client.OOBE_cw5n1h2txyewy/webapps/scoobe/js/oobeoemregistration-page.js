﻿//
// Copyright (C) Microsoft. All rights reserved.
//
"use strict";
(() => {
    WinJS.UI.Pages.define("/webapps/scoobe/view/oobeoemregistration-main.html", {
        init: function oemPageInit(element, options) {
            require.config(new RequirePathConfig('/webapps/scoobe'));

            return requireAsync(['legacy/uiHelpers', 'legacy/bridge']).then((result) => {
                let bridge = result.legacy_bridge;
                var promises = [];
                promises.push(result.legacy_uiHelpers.LoadCssPromise(document.head, "", bridge));
                promises.push(bridge.invoke("CloudExperienceHost.StringResources.makeResourceObject", "oobeOemRegistration").then((result) => {
                    this.resourceStrings = JSON.parse(result);
                }));

                promises.push(result.legacy_uiHelpers.LangAndDirPromise(document.documentElement, bridge));

                promises.push(bridge.invoke("CloudExperienceHost.OemRegistration.getOEMInfo", "", "").then((registrationInfo) => {
                    this.oemRegistrationInfo = JSON.parse(registrationInfo);
                }));

                promises.push(bridge.invoke("CloudExperienceHost.MSA.getUserInfo").then((userInfo) => {
                    this.userInfo = JSON.parse(userInfo);
                }));

                promises.push(bridge.invoke("CloudExperienceHost.Globalization.GeographicRegions.getAllCodes").then((regions) => {
                    this.regions = JSON.parse(regions);
                }));

                promises.push(bridge.invoke("CloudExperienceHost.Globalization.GeographicRegions.getCode").then((defaultRegion) => {
                    this.defaultRegion = defaultRegion;
                }));
                
                promises.push(bridge.invoke("CloudExperienceHost.getContext").then((targetContext) => {
                    this.targetPersonality = targetContext.personality;
                    this.deviceForm = parseInt(targetContext.deviceForm);
                }));

                promises.push(bridge.invoke("CloudExperienceHost.FeatureStaging.tryGetIsFeatureEnabled", "GamepadLegendEnabled").then((response) => {
                    // The definition of tryGetIsFeatureEnabled on the bridge returns a JSON object with two number properties indicating the success of the call and whether the feature is enabled.
                    this.isGamepadLegendEnabled = (response.result === 1) && (response.value === 1);
                }));

                return WinJS.Promise.join(promises);
            });
        },
        error: function oemPageError(e) {
            // Look for an error object from our set of init promises and unpack that if we find one.
            if (e.initResult && e.initResult.length > 0) {
                e.initResult.forEach((result) => {
                    if (result && result.number) {
                        e = result;
                    }
                });
            }
            require(['legacy/bridge', 'legacy/events', 'legacy/core'], (bridge, constants, core) => {
                bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "OEMRegistrationPageLoadFailure", core.GetJsonFromError(e));
                bridge.fireEvent(constants.Events.done, constants.AppResult.error);
            });
        },
        ready: function oemPageReady(element, options) {
            return requireAsync(['lib/knockout', 'corejs/knockouthelpers', 'legacy/bridge', 'legacy/events', 'oobeoemregistration-vm']).then((modules) => {
                // Setup knockout customizations
                window.KoHelpers = modules.corejs_knockouthelpers;
                let ko = modules.lib_knockout;
                let koHelpers = new KoHelpers();
                koHelpers.registerComponents(CloudExperienceHost.RegisterComponentsScenarioMode.Scoobe);

                // Apply bindings and show the page
                let vm = new modules.oobeoemregistration_vm(this.resourceStrings, this.regions, this.defaultRegion, this.oemRegistrationInfo, this.userInfo, this.targetPersonality,
                    this.deviceForm, this.isGamepadLegendEnabled);
                ko.applyBindings(vm);
                KoHelpers.waitForInitialComponentLoadAsync().then(() => {
                    WinJS.Utilities.addClass(document.body, "pageLoaded");
                    modules.legacy_bridge.fireEvent(modules.legacy_events.Events.visible, true);
                    KoHelpers.setFocusOnAutofocusElement();
                    vm.startVoiceOver();
                });
            });
        }
    });
})();
