(function () {
    "use strict";

    var bridge = new CloudExperienceHost.Bridge();
    var hasOnlineSettings = false;
    var resources;
    var navFlow;

    WinJS.UI.Pages.define("/RetailDemo/retailDemoShutdownsInclusive.html", {
        init: function (element, options) {
            require.config(new RequirePathConfig('/webapps/inclusiveOobe'));
            let pagePromise = bridge.invoke("CloudExperienceHost.StringResources.getRetailDemoStrings").done(function (result) {
                resources = JSON.parse(result);
            });

            let cssPromise = uiHelpers.LoadCssPromise(document.head, "..", bridge);
            let languagePromise = bridge.invoke("CloudExperienceHost.Globalization.Language.getPreferredLang").then(function (preferredLang) {
                _rdxHtmlRoot.setAttribute("lang", preferredLang);
            }, function () { });
            let dirPromise = bridge.invoke("CloudExperienceHost.Globalization.Language.getReadingDirection").then(function (dirVal) {
                _rdxHtmlRoot.setAttribute("dir", dirVal);
            }, function () { });
            let navFlowPromise = bridge.invoke("CloudExperienceHost.getContext").then(function (result) {
                navFlow = result.host;
            }, function () { });

            return WinJS.Promise.join({ pagePromise: pagePromise, cssPromise: cssPromise, languagePromise: languagePromise, dirPromise: dirPromise, navFlowPromise: navFlowPromise });
        },

        ready: function (element, options) {
            let processingFlag = false;

            document.title = resources.rdxTitle;
            rdamTitle.textContent = resources.shutdownsTitle;
            timeZoneText.textContent = resources.timeZoneText;
            cancelButton.textContent = resources.cancelButton;
            nextButton.textContent = resources.nextButton;
            useOfflineShutdownToggle.winControl.labelOn = useOfflineShutdownToggle.winControl.labelOff = resources.useOfflineShutdownToggle;

            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("RDX_OOBE_Override_Toggle_Accessibility")) {
                useOfflineShutdownToggle.setAttribute("aria-label", resources.useOfflineShutdownToggle);
                useOfflineShutdownToggle.setAttribute("role", "switch");
            }

            hasOnlineSettings = Windows.System.Profile.RetailInfo.properties.hasKey("shutdownCloudConfigured") && (Windows.System.Profile.RetailInfo.properties.lookup("shutdownCloudConfigured") == "true");
            if (hasOnlineSettings) {
                shutdownText.textContent = resources.shutdownTextOnline;
            } else {
                shutdownText.textContent = resources.shutdownText;
            }

            useOfflineShutdownToggle.winControl.checked = Windows.System.Profile.RetailInfo.properties.hasKey("useShutdownOfflineSettings") && (Windows.System.Profile.RetailInfo.properties.lookup("useShutdownOfflineSettings") == "true");
            setTimeControlsDisabledState();

            var weekdayRegistryValues;
            if (hasOnlineSettings && !useOfflineShutdownToggle.winControl.checked) {
                weekdayRegistryValues = ["mondayOnlineShutdownTime", "tuesdayOnlineShutdownTime", "wednesdayOnlineShutdownTime",
                    "thursdayOnlineShutdownTime", "fridayOnlineShutdownTime", "saturdayOnlineShutdownTime", "sundayOnlineShutdownTime"];
            } else {
                weekdayRegistryValues = ["mondayShutdownTime", "tuesdayShutdownTime", "wednesdayShutdownTime",
                    "thursdayShutdownTime", "fridayShutdownTime", "saturdayShutdownTime", "sundayShutdownTime"];
            }

            let year = 2016;
            let month = 8; // Windows starts counting months at 0. This is September.
            let aMondayDay = 5;
            populateShutdownTimes(mondayLegend, mondayTime, weekdayRegistryValues[0], year, month, aMondayDay);
            populateShutdownTimes(tuesdayLegend, tuesdayTime, weekdayRegistryValues[1], year, month, aMondayDay + 1);
            populateShutdownTimes(wednesdayLegend, wednesdayTime, weekdayRegistryValues[2], year, month, aMondayDay + 2);
            populateShutdownTimes(thursdayLegend, thursdayTime, weekdayRegistryValues[3], year, month, aMondayDay + 3);
            populateShutdownTimes(fridayLegend, fridayTime, weekdayRegistryValues[4], year, month, aMondayDay + 4);
            populateShutdownTimes(saturdayLegend, saturdayTime, weekdayRegistryValues[5], year, month, aMondayDay + 5);
            populateShutdownTimes(sundayLegend, sundayTime, weekdayRegistryValues[6], year, month, aMondayDay + 6);

            nextButton.addEventListener("click", function (eventInfo) {
                eventInfo.preventDefault();
                if (!processingFlag) {
                    processingFlag = true;
                    bridge.fireEvent(CloudExperienceHost.Events.showProgressWhenPageIsBusy);
                    writeShutdownTimesAsyncThen(function () {
                        bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.success);
                    }, function (error) {
                        bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "RetailInfoSetterFailure", JSON.stringify({ number: error.number.toString(16), description: error.description }));
                        bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.cancel);
                    });
                }
            });

            cancelButton.addEventListener("click", function (eventInfo) {
                eventInfo.preventDefault();
                cancelShutdownTimesAsyncThen(function () {
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.cancel);
                }, function (error) {
                    bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "RetailInfoSetterFailure", JSON.stringify({ number: error.number.toString(16), description: error.description }));
                    bridge.fireEvent(CloudExperienceHost.Events.done, CloudExperienceHost.AppResult.fail);
                });
            });

            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("RDX_OOBE_Narrator_ScanMode_Activation_Accessibility")) {
                useOfflineShutdownToggle.addEventListener("click", function (eventInfo) {
                    useOfflineShutdownToggle.winControl.checked = !useOfflineShutdownToggle.winControl.checked;
                    eventInfo.preventDefault();
                });
                useOfflineShutdownToggle.addEventListener("pointerdown", onPointerDownHandler, true /*useCapture*/);
            }

            useOfflineShutdownToggle.addEventListener("change", function (eventInfo) {
                eventInfo.preventDefault();
                setTimeControlsDisabledState();
                let platform = CloudExperienceHost.Environment.getPlatform();
                if ((navFlow != "RDXRACSKUINCLUSIVE") || (platform === CloudExperienceHost.TargetPlatform.MOBILE)) {
                    bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "useShutdownOfflineSettings", useOfflineShutdownToggle.winControl.checked ? "true" : "false");
                } else {
                    CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("useShutdownOfflineSettings", useOfflineShutdownToggle.winControl.checked ? "true" : "false");
                }
            });

            bridge.fireEvent(CloudExperienceHost.Events.visible, true);

            function writeShutdownTimesAsyncThen(complete, error) {
                if (hasOnlineSettings && !useOfflineShutdownToggle.winControl.checked) {
                    complete();
                } else {
                    let mondayString = "" + mondayTime.winControl.current.getHours() + ":" + mondayTime.winControl.current.getMinutes() + ":00";
                    let tuesdayString = "" + tuesdayTime.winControl.current.getHours() + ":" + tuesdayTime.winControl.current.getMinutes() + ":00";
                    let wednesdayString = "" + wednesdayTime.winControl.current.getHours() + ":" + wednesdayTime.winControl.current.getMinutes() + ":00";
                    let thursdayString = "" + thursdayTime.winControl.current.getHours() + ":" + thursdayTime.winControl.current.getMinutes() + ":00";
                    let fridayString = "" + fridayTime.winControl.current.getHours() + ":" + fridayTime.winControl.current.getMinutes() + ":00";
                    let saturdayString = "" + saturdayTime.winControl.current.getHours() + ":" + saturdayTime.winControl.current.getMinutes() + ":00";
                    let sundayString = "" + sundayTime.winControl.current.getHours() + ":" + sundayTime.winControl.current.getMinutes() + ":00";

                    let platform = CloudExperienceHost.Environment.getPlatform();
                    if ((navFlow != "RDXRACSKUINCLUSIVE") || (platform === CloudExperienceHost.TargetPlatform.MOBILE)) {
                        bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "shutdownTimeEnabled", "true")
                        .then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "mondayShutdownTime", mondayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "tuesdayShutdownTime", tuesdayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "wednesdayShutdownTime", wednesdayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "thursdayShutdownTime", thursdayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "fridayShutdownTime", fridayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "saturdayShutdownTime", saturdayString);
                        }).then(function () {
                            return bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "sundayShutdownTime", sundayString);
                        }).done(complete, error);
                    } else {
                        CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("shutdownTimeEnabled", "true")
                        .then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("mondayShutdownTime", mondayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("tuesdayShutdownTime", tuesdayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("wednesdayShutdownTime", wednesdayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("thursdayShutdownTime", thursdayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("fridayShutdownTime", fridayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("saturdayShutdownTime", saturdayString);
                        }).then(function () {
                            return CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("sundayShutdownTime", sundayString);
                        }).done(complete, error);
                    }
                }
            }

            function setTimeControlsDisabledState() {
                let timeControls = [mondayTime, tuesdayTime, wednesdayTime, thursdayTime, fridayTime, saturdayTime, sundayTime];
                timeControls.forEach(function (control) {
                    control.winControl.disabled = hasOnlineSettings && !useOfflineShutdownToggle.winControl.checked;
                });
            }

            function cancelShutdownTimesAsyncThen(complete, error) {
                let platform = CloudExperienceHost.Environment.getPlatform();
                if ((navFlow != "RDXRACSKUINCLUSIVE") || (platform === CloudExperienceHost.TargetPlatform.MOBILE)) {
                    bridge.invoke("RetailDemo.Internal.RetailInfoSetter.setStringAsync", "shutdownTimeEnabled", "false");
                    complete();
                } else {
                    CloudExperienceHostBroker.RetailDemo.ConfigureRetailDemo.setRetailInfoStringValue("shutdownTimeEnabled", "false");
                    complete();
                }
            }

            function populateShutdownTimes(legend, timeControl, lookupString, year, month, day) {
                let properties = Windows.System.Profile.RetailInfo.properties;
                let timeString = "22:00:00";
                if (properties.hasKey(lookupString) && properties.lookup(lookupString) != "") {
                    timeString = properties.lookup(lookupString);
                }
                let time = timeString.split(":");
                let dateTime = new Date(year, month, day, time[0], time[1], time[2]);
                timeControl.winControl.current = dateTime;
                let calendar = new Windows.Globalization.Calendar();
                calendar.setDateTime(dateTime);
                legend.textContent = calendar.dayOfWeekAsString();
            }

            function onPointerDownHandler(ev) {
                if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("RDX_OOBE_Narrator_ScanMode_Activation_Accessibility")) {
                    ev.stopImmediatePropagation();
                }
            }
        }
    });
})();
