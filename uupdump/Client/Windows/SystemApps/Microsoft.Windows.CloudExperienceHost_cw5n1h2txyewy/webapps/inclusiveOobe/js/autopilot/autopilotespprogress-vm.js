
"use strict";

define([
    'lib/knockout',
    'legacy/bridge',
    'legacy/appObjectFactory',
    'autopilot/commercialDiagnosticsUtilities'], (
    ko,
    bridge,
    appObjectFactory,
    commercialDiagnosticsUtilities) => {
    class autopilotEspProgressViewModel {
        constructor(
            resourceStrings,
            targetPersonality,
            sessionUtilities,
            categoryUiContainers,
            categoryUiContainerInitializationPromises) {


            this.BUTTON_FLAG_NONE = 0;
            this.BUTTON_FLAG_CONTINUE_ANYWAY = 1;
            this.BUTTON_FLAG_RESET_DEVICE = 2;
            this.BUTTON_FLAG_TRY_AGAIN = 4;
            this.BUTTON_FLAG_SIGN_OUT = 8;

            this.HYPERLINK_FLAG_NONE = 0;
            this.HYPERLINK_FLAG_CONTINUE_ANYWAY = 1;
            this.HYPERLINK_FLAG_COLLECT_LOGS = 2;
            this.HYPERLINK_FLAG_SIGN_OUT = 4;

            this.ACTION_INITIATION_DELAY_IN_MILLISECONDS = 5000;

            this.PAGE_TRANSITION_POST_ESP_SUCCESS_PAGE = CloudExperienceHost.AppResult.success;
            this.PAGE_TRANSITION_WHITE_GLOVE_RESULTS_PAGE = CloudExperienceHost.AppResult.action2;

            this.PAGE_TRANSITION_DIAGNOSTICS_PAGE = "OobeDiagnostics";

            this.DIAGNOSTICS_PREVIOUS_CXID_NAME = "DiagnosticsPreviousCXID";
            this.DIAGNOSTICS_LOGS_EXPORT_AREA_NAME = "DiagnosticsLogsExportArea";
            this.DIAGNOSTICS_LOGS_EXPORT_AREA_VALUE = "Autopilot";
            this.DIAGNOSTICS_LOGS_EXPORT_AREA_WITH_TPM_VALUE = "Autopilot;TPM";
            this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_NAME = "ReturnedFromDiagnosticsPageFlag";
            this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_VALUE = "true";

            this.EULA_ALREADY_ACCEPTED = "EulaAlreadyAccepted";

            this.E_DIAGNOSTIC_ANALYSIS_FRAMEWORK_GENERIC_ERROR = 0x81039025; // defined in AutopilotErrors.mc

            this.ESP_COMMANDS_SUBCATEGORY_ID_ON_SUCCESSFUL_ESP_PAGE_EXIT = "onSuccessfulEspPageExit";
            this.ESP_COMMANDS_SUBCATEGORY_ID_ON_ESP_PAGE_ERROR = "onEspPageError";

            this.categoryUiContainers = categoryUiContainers;
            this.currentCategoryIndex = 0;
            this.resourceStrings = resourceStrings;
            this.sessionUtilities = sessionUtilities;
            this.showCollectLogsButton = false;
            this.provisioningCompleted = false;
            this.errorButtonsVisibility = 0;
            this.isWhiteGloveFlow = false;
            this.showSignOutButton = false;
            this.firstPostOobeCategoryIndex = -1;
            this.commercialDiagnosticsUtilities = new commercialDiagnosticsUtilities();
            this.autopilotLogger = new ModernDeployment.Autopilot.Core.AutopilotLogging();
            this.onBatteryReportUpdatedHandler = this.batteryReportUpdatedOnHololens.bind(this);

            this.syncFailTimeoutInMilliseconds = 60 * 60 * 1000;

            for (let i = 0; i < this.categoryUiContainers.length; i++) {
                if (!this.categoryUiContainers[i].runsInOobe()) {
                    this.firstPostOobeCategoryIndex = i;
                    break;
                }
            }

            this.isLiteWhitePersonality = ko.observable(targetPersonality === CloudExperienceHost.TargetPersonality.LiteWhite);
            this.commercialDiagnosticsUtilities.logInfoEventName(this.isLiteWhitePersonality() ? "CommercialOOBE_ESP_LiteWhitePersonalityDetected_True" : "CommercialOOBE_ESP_LiteWhitePersonalityDetected_False");

            this.EnrollmentProgressNotifyOfNotificationText = ko.observable("");
            this.pageTitle = ko.observable(this.resourceStrings["BootstrapPageTitle"]);
            this.pageLeadText = this.isLiteWhitePersonality() ? "" : ko.observable(this.resourceStrings["BootstrapPageRebootWarning"]);
            this.subheaderText = ko.observable(this.resourceStrings["BootstrapPageRebootWarning"]);
            this.viewDiagnosticsBlobText = ko.observable(this.resourceStrings["BootstrapPageStatusForMoreDetails"]);
            this.viewDiagnosticsHyperlinkText = ko.observable(this.resourceStrings["BootstrapPageViewDiagnosticsHyperlink"]);
            this.continueAnywayHyperlinkText = ko.observable(this.resourceStrings["BootstrapPageContinueAnywayButton"]);
            this.signOutAnywayHyperlinkText = ko.observable(this.resourceStrings["BootstrapPageSignOutButton"]);

            this.buttonVisibility = ko.observable(0);
            this.hyperlinkVisibility = ko.observable(0);
            this.isResetButtonDisabled = ko.observable(false);
            this.isSignOutButtonDisabled = ko.observable(false);
            this.errorOccurred = ko.observable(false);
            this.errorMessage = ko.observable(this.resourceStrings[""]);
            this.infoMessage = ko.observable(this.resourceStrings[""]);
            this.showDiagnosticsHyperlinkEnabled = ko.observable(false);
            this.showContinueAnywayHyperlinkEnabled = ko.observable(false);
            this.showSignOutHyperlinkEnabled = ko.observable(false);

            this.continueAnywayButton = {
                automationId: "idContinueAnywayButton",
                buttonText: this.resourceStrings["BootstrapPageContinueAnywayButton"],
                buttonType: "button",
                isPrimaryButton: true,
                autoFocus: true,
                isVisible: true,
                buttonClickHandler: () => {
                    this.continueAnywayButtonClick();
                }
            };

            this.resetDeviceButton = {
                automationId: "idResetDeviceButton",
                buttonText: this.resourceStrings["BootstrapPageResetDeviceButton"],
                buttonType: "button",
                isPrimaryButton: false,
                autoFocus: false,
                isVisible: true,
                disableControl: ko.pureComputed(() => {
                    return this.isResetButtonDisabled();
                }),
                buttonClickHandler: () => {
                    this.resetDeviceButtonClick();
                }
            };

            this.tryAgainButton = {
                automationId: "idTryAgainButton",
                buttonText: this.resourceStrings["BootstrapPageTryAgainButton"],
                buttonType: "button",
                isPrimaryButton: true,
                autoFocus: true,
                isVisible: true,
                buttonClickHandler: () => {
                    this.tryAgainButtonClick();
                }
            };

            this.signOutButton = {
                automationId: "idSignOutButton",
                buttonText: this.resourceStrings["BootstrapPageSignOutButton"],
                buttonType: "button",
                isPrimaryButton: true,
                autoFocus: true,
                isVisible: true,
                disableControl: ko.pureComputed(() => {
                    return this.isSignOutButtonDisabled();
                }),
                buttonClickHandler: () => {
                    this.signOutButtonClick();
                }
            };

            const flexEndButtonSets = {};
            flexEndButtonSets[this.BUTTON_FLAG_NONE] = [];
            flexEndButtonSets[this.BUTTON_FLAG_CONTINUE_ANYWAY] = [this.continueAnywayButton];
            flexEndButtonSets[this.BUTTON_FLAG_RESET_DEVICE] = [this.resetDeviceButton];
            flexEndButtonSets[this.BUTTON_FLAG_TRY_AGAIN] = [this.tryAgainButton];
            flexEndButtonSets[this.BUTTON_FLAG_SIGN_OUT] = [this.signOutButton];
            flexEndButtonSets[this.BUTTON_FLAG_RESET_DEVICE | this.BUTTON_FLAG_TRY_AGAIN] = [this.resetDeviceButton, this.tryAgainButton];

            this.flexEndButtons = ko.pureComputed(() => {
                return flexEndButtonSets[this.buttonVisibility()];
            });

            this.commercialDiagnosticsUtilities.logInfoEventName("CommercialOOBE_ESP_RebootResumption_Set");
            bridge.invoke("CloudExperienceHost.AutoPilot.EnrollmentStatusPage.setStatusPageReboot");

            this.continueAnywayLink = {
                automationId: "idContinueAnywayLink",
                hyperlinkText: this.resourceStrings["BootstrapPageContinueAnywayButton"],
                handler: () => {
                    this.continueAnywayButtonClick();
                }
            };

            this.runDiagnosticsLink = {};
            this.commercialDiagnosticsUtilities.logInfoEventName("CommercialOOBE_ESP_SettingDiagnosticsHyperlink_Started");

            if (CloudExperienceHostAPI.FeatureStaging.isOobeFeatureEnabled("WindowsAutopilotDiagnostics")) {
                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESP_SettingDiagnosticsHyperlink_Finished", "Setting 'View diagnostics' button.");

                this.runDiagnosticsLink = {
                    automationId: "idViewDiagnosticsLink",
                    hyperlinkText: this.resourceStrings["BootstrapPageViewDiagnosticsButton"],
                    handler: () => {
                        this.viewDiagnosticsButtonClick();
                    }
                };
            }
            else {
                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESP_SettingDiagnosticsHyperlink_Finished", "Setting 'Collect logs' button.");

                this.runDiagnosticsLink = {
                    automationId: "idCollectLogsLink",
                    hyperlinkText: this.resourceStrings["BootstrapPageCollectLogsButton"],
                    handler: () => {
                        this.collectLogsButtonClick();
                    }
                };
            }

            this.signOutLink = {
                automationId: "idSignOutLink",
                hyperlinkText: this.resourceStrings["BootstrapPageSignOutButton"],
                handler: () => {
                    this.signOutButtonClick();
                }
            };

            const flexStartHyperlinksSets = {};
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_NONE] = [];
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_CONTINUE_ANYWAY] = [this.continueAnywayLink];
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_COLLECT_LOGS] = [this.runDiagnosticsLink];
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_SIGN_OUT] = [this.signOutLink];
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_CONTINUE_ANYWAY | this.HYPERLINK_FLAG_COLLECT_LOGS] = [this.continueAnywayLink, this.runDiagnosticsLink];
            flexStartHyperlinksSets[this.HYPERLINK_FLAG_SIGN_OUT | this.HYPERLINK_FLAG_COLLECT_LOGS] = [this.signOutLink, this.runDiagnosticsLink];

            this.flexStartHyperLinks = ko.pureComputed(() => {
                return this.isLiteWhitePersonality() ? flexStartHyperlinksSets[this.HYPERLINK_FLAG_NONE] : flexStartHyperlinksSets[this.hyperlinkVisibility()];
            });

            this.sessionUtilities.storeTransientState(this.sessionUtilities.stateNameGlobalErrorButtonsVisibility, 0);
            this.sessionUtilities.storeTransientState(this.sessionUtilities.stateNameGlobalShowCollectLogsButton, true);

            let currentMdmProgressMode = this.sessionUtilities.MDM_PROGRESS_MODE_DEVICE_AND_USER;
            if (this.sessionUtilities.runningInOobe()) {
                currentMdmProgressMode = this.sessionUtilities.MDM_PROGRESS_MODE_DEVICE;
            }

            this.sessionUtilities.storeTransientState(
                this.sessionUtilities.STATE_NAME_GLOBAL_MDM_PROGRESS_MODE,
                currentMdmProgressMode);

            bridge.fireEvent(CloudExperienceHost.Events.visible, true);

            this.clickHandlers = [];

            this.displayRequestInstance = null;
            this.startDateTimeOfDisplayRequestActive = new Date();
            if (CloudExperienceHostAPI.Environment.platform === 10) { // Holographic
                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_DisplayActiveRequest_Started", "BootstrapStatus: Requesting to keep display active.");
                this.displayRequestInstance = new Windows.System.Display.DisplayRequest();
                this.displayRequestInstance.requestActive();

                Windows.Devices.Power.Battery.aggregateBattery.addEventListener("reportupdated", this.onBatteryReportUpdatedHandler);
            }

            WinJS.Promise.join(categoryUiContainerInitializationPromises).then(() => {
                return this.waitForDebuggerAttachment();
            }).then(() => {
                return bridge.invoke("CloudExperienceHost.Storage.SharableData.getValue", this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_NAME);
            }).then((flag) => {
                if (this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_VALUE !== flag) {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_Initialization_ResumingAfterReboot",
                        "BootstrapStatus: The page is resuming after a reboot.");
                }

                return bridge.invoke("CloudExperienceHost.Storage.SharableData.removeValue", this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_NAME);
            }).then(() => {
                return this.checkBlockingValueAsync();
            }).then(() => {
                return this.checkShowLogsSettingAsync();
            }).then(() => {
                return this.checkForWhiteGloveModeAsync();
            }).then(() => {
                return this.shouldShowSignOutButtonAsync();
            }).then(() => {
                return this.getsyncFailTimeoutInMillisecondsAsync();
            }).then(() => {
                return this.runAllCategories(false);
            }).done(
                () => { },
                (e) => {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_Initialization_Failed",
                        "BootstrapStatus: Failed progress page view model initialization",
                        e);
                });
        }

        batteryReportUpdatedOnHololens() {
            const OneMinuteAsMilliseconds = 60000;

            var currentDateAndTime = new Date();
            var displayActiveRequestDurationInMinutes = Math.round((currentDateAndTime - this.startDateTimeOfDisplayRequestActive) / OneMinuteAsMilliseconds);

            var report = Windows.Devices.Power.Battery.aggregateBattery.getReport();
            var chargeRemainingInPercent = (report.remainingCapacityInMilliwattHours / report.fullChargeCapacityInMilliwattHours) * 100;

            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_BatteryReport_Updated",
                `BootstrapStatus: Battery report updated. Display kept active in mins: ${displayActiveRequestDurationInMinutes} Battery charge remaining %: ${chargeRemainingInPercent}.`);

            const MaxDurationOfDisplayActiveInMinutes = 60;
            const MinimumBatteryChargeInPercent = 10;

            if (displayActiveRequestDurationInMinutes > MaxDurationOfDisplayActiveInMinutes || chargeRemainingInPercent < MinimumBatteryChargeInPercent) {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_HololensDisplayActiveRequest_Released",
                    "BootstrapStatus: Releasing request to keep display active, threshold reached.");

                Windows.Devices.Power.Battery.aggregateBattery.removeEventListener("reportupdated", this.onBatteryReportUpdatedHandler);

                this.displayRequestInstance.requestRelease();
            }
        }

        waitForDebuggerAttachment() {
            return this.sessionUtilities.getSettingAsync(this.sessionUtilities.STATE_NAME_GLOBAL_SHOULD_WAIT_FOR_DEBUGGER_ATTACH).then((debuggerFlagValue) => {
                if ((null === debuggerFlagValue) || (debuggerFlagValue.length === 0)) {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_DebuggerAttachment_Success",
                        `BootstrapStatus: Done waiting for debugger to attach (value == ${debuggerFlagValue}).`);

                    return WinJS.Promise.as(true);
                }

                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_DebuggerAttachment_Waiting", "BootstrapStatus: Waiting 5 seconds for debugger to attach.");

                return WinJS.Promise.timeout(5000).then(() => {
                    return this.waitForDebuggerAttachment();
                });
            });
        }

        runOneClickHandlerAsync(clickedItemId, clickHandlerIndex) {
            if (clickHandlerIndex >= this.clickHandlers.length) {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_ClickHandlerInvocation_ReachedEnd",
                    `BootstrapStatus: Reached end of click handler invocations for ${this.clickHandlers.length} handler(s).`);

                return WinJS.Promise.as(true);
            }

            return this.clickHandlers[clickHandlerIndex]({
                clickedItemId: clickedItemId
            }).then((handlerSucceeded) => {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    handlerSucceeded ? "CommercialOOBE_ESPProgress_ClickHandler_Succeeded" : "CommercialOOBE_ESPProgress_ClickHandler_Failed",
                    `BootstrapStatus: Click handler at index ${clickHandlerIndex} for click ID '${clickedItemId}' ${handlerSucceeded}.`);

                return this.runOneClickHandlerAsync(clickedItemId, clickHandlerIndex + 1);
            });
        }

        runAllRegisteredClickHandlersAsync(clickedItemId) {
            return this.runOneClickHandlerAsync(clickedItemId, 0);
        }

        viewDiagnosticsButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_ViewDiagnostics_Started",
                "BootstrapStatus: View diagnostics button selected");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_VIEW_DIAGNOSTICS_BUTTON).then(() => {
                bridge.invoke("CloudExperienceHost.AutoPilot.AutopilotWrapper.GetCurrentNode").then((currentNode) => {
                    return bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.DIAGNOSTICS_PREVIOUS_CXID_NAME, currentNode.cxid);
                }).then(() => {
                    return bridge.invoke(
                        "CloudExperienceHost.Storage.SharableData.addValue",
                        this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_NAME,
                        this.RETURNED_FROM_DIAGNOSTICS_PAGE_FLAG_VALUE);
                }).then(() => {
                    return this.sessionUtilities.autopilotApis.getOobeSettingsOverrideAsync(EnterpriseDeviceManagement.Service.AutoPilot.AutoPilotOobeSetting.aadAuthUsingDeviceTicket);
                }).then((isUsingDeviceTicket) => {
                    if (isUsingDeviceTicket) {
                        return bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.DIAGNOSTICS_LOGS_EXPORT_AREA_NAME, this.DIAGNOSTICS_LOGS_EXPORT_AREA_WITH_TPM_VALUE);
                    }

                    return bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.DIAGNOSTICS_LOGS_EXPORT_AREA_NAME, this.DIAGNOSTICS_LOGS_EXPORT_AREA_VALUE);
                }).then(() => {

                    this.autopilotLogger.logAutopilotTelemetryAsync(
                        "DiagnosticAnalysisFramework",
                        "AutopilotESPPage",
                        "PageLaunchedByButton",
                        "Success",
                        0);

                    return bridge.fireEvent(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_DIAGNOSTICS_PAGE);
                }, (e) => {
                    let errorCode = e.number ? e.number : this.E_DIAGNOSTIC_ANALYSIS_FRAMEWORK_GENERIC_ERROR;

                    this.autopilotLogger.logAutopilotTelemetryAsync(
                        "DiagnosticAnalysisFramework",
                        "AutopilotESPPage",
                        "PageLaunchedByButton",
                        "Failure",
                        errorCode);
                });
            });
        }

        continueAnywayButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_ContinueAnyway_Started",
                "BootstrapStatus: Continue button selected");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_CONTINUE_ANYWAY_BUTTON).then(() => {
                try {
                    for (let i = 0; i < this.categoryUiContainers.length; i++) {
                        this.categoryUiContainers[i].prepareForContinueAnywayAsync();
                    }

                    this.sessionUtilities.enrollmentApis.setWasContinuedAnyway(this.sessionUtilities.runningInOobe());
                } catch (e) {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_ContinueAnyway_Failed",
                        "BootstrapStatus: setWasContinuedAnyway failed",
                        e);
                }

                this.handleFullyExitingEsp();

                return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_POST_ESP_SUCCESS_PAGE);
            });
        }

        tryAgainButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_TryAgain_Started",
                "BootstrapStatus: Try Again button selected");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_TRY_AGAIN_BUTTON).then(() => {
                try {
                    for (let i = 0; i < this.categoryUiContainers.length; i++) {
                        this.categoryUiContainers[i].resetForTryAgainAsync();
                    }

                    let mdmProgressMode = this.sessionUtilities.getTransientState(this.sessionUtilities.STATE_NAME_GLOBAL_MDM_PROGRESS_MODE);

                    this.sessionUtilities.enrollmentApis.resetProgressTimeout(mdmProgressMode);

                    this.buttonVisibility(0);
                    this.hyperlinkVisibility(0);
                    this.errorMessage("");
                    this.infoMessage("");

                    this.showContinueAnywayHyperlinkEnabled(false);
                    this.showSignOutHyperlinkEnabled(false);
                    this.showDiagnosticsHyperlinkEnabled(false);

                    if (this.isLiteWhitePersonality()) {
                        this.errorOccurred(false);
                        this.subheaderText(this.resourceStrings["BootstrapPageRebootWarning"]);
                    }

                    this.runAllCategories(true);
                } catch (e) {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_TryAgain_Failed",
                        "BootstrapStatus: Try again failed",
                        e);
                }
            });
        }

        resetDeviceButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_DeviceResetInitiation_Started",
                "BootstrapStatus: Reset button selected");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_RESET_BUTTON).then(() => {
                this.isResetButtonDisabled(true);

                let pluginManager = new CloudExperienceHostAPI.Provisioning.PluginManager();
                pluginManager.initiateSystemResetAsync().then(() => {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_DeviceResetInitiation_Succeeded",
                        "BootstrapStatus: Device reset initiated successfully");
                },
                    (e) => {
                        this.isResetButtonDisabled(false);
                        this.commercialDiagnosticsUtilities.logExceptionEvent(
                            "CommercialOOBE_ESPProgress_DeviceResetInitiation_Failed",
                            "BootstrapStatus: Device reset initiation failed",
                            e);
                    });
            });
        }

        collectLogsButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_CollectLogs_Started",
                "BootstrapStatus: Collect Logs button selected.");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_COLLECT_LOGS_BUTTON).then(() => {
                this.commercialDiagnosticsUtilities.getExportLogsFolderPathAsync().then((folderPath) => {
                    this.sessionUtilities.enrollmentApis.collectLogs(folderPath).then(() => {
                    },
                        (e) => {
                            this.commercialDiagnosticsUtilities.logExceptionEvent(
                                "CommercialOOBE_ESPProgress_CollectLogs_Failed",
                                "BootstrapStatus: collectLogs failed",
                                e);
                        });
                }, (e) => {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_GetExportLogsFolderPathAsync_Failed",
                        "BootstrapStatus: GetExportLogsFolderPathAsync failed",
                        e);
                });
            });
        }

        signOutButtonClick() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_SignOut_Started",
                "BootstrapStatus: Sign out button selected");

            this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_SIGN_OUT_BUTTON).then(() => {
                this.isSignOutButtonDisabled(true);

                try {
                    if (!this.provisioningCompleted) {
                        this.commercialDiagnosticsUtilities.logInfoEvent(
                            "CommercialOOBE_ESPProgress_SignOutAndWasContinuedAnyway_Started",
                            "BootstrapStatus: Setting WasContinuedAnyway on sign out");
                        this.sessionUtilities.enrollmentApis.setWasContinuedAnyway(this.sessionUtilities.runningInOobe());
                        this.runAllRegisteredClickHandlersAsync(this.sessionUtilities.CLICKABLE_ITEM_ID_CONTINUE_ANYWAY_BUTTON);
                    }
                } catch (e) {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_SignOutAndWasContinuedAnyway_Failed",
                        "BootstrapStatus: setWasContinuedAnyway failed",
                        e);
                }

                this.handleFullyExitingEsp();

                const windowsSessionHelper = new ModernDeployment.Autopilot.Core.AutopilotWindowsSessionHelpers();
                windowsSessionHelper.logoffInteractiveUserAsync().then(() => {
                    return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_POST_ESP_SUCCESS_PAGE);
                }, (e) => {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_SignOut_Failed",
                        "BootstrapStatus: signOutButton failed",
                        e);

                    return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_POST_ESP_SUCCESS_PAGE);
                });
            });
        }

        displayErrorAsync() {
            if (this.firstPostOobeCategoryIndex !== -1) {
                for (let i = this.firstPostOobeCategoryIndex; i < this.categoryUiContainers.length; i++) {
                    this.categoryUiContainers[i].showPreviousStepFailedStatusTextIfApplicableAsync();
                }
            }

            return this.checkBlockingValueAsync().then(() => {
                return this.sessionUtilities.enrollmentApis.retrieveCustomErrorText(this.sessionUtilities.runningInOobe());
            }).then((results) => {
                this.errorMessage(results);

                if (this.isLiteWhitePersonality()) {
                    this.errorOccurred(true);
                    this.subheaderText(results);
                }

                this.displayErrorButtons();
            }).then(() => {
                return this.sessionUtilities.startPhaseStateMachineAsync(
                    this.ESP_COMMANDS_SUBCATEGORY_ID_ON_ESP_PAGE_ERROR,
                    this.sessionUtilities.ESP_COMMAND_PHASE_NAME_POSTACTION,
                    () => {
                    },
                    (actionResultToUse) => {
                        return WinJS.Promise.as(true);
                    }
                )
            }, (e) => {
                this.errorMessage(this.resourceStrings["BootstrapPageDefaultErrorMessage"]);

                if (this.isLiteWhitePersonality()) {
                    this.errorOccurred(true);
                    this.subheaderText(this.resourceStrings["BootstrapPageDefaultErrorMessage"]);
                }

                if (CloudExperienceHostAPI.Environment.platform === 10) { // Holographic
                    this.errorButtonsVisibility = this.errorButtonsVisibility | 1;
                }

                this.displayErrorButtons();
            });
        }

        displayErrorButtons() {
            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_ErrorButtons_Displayed",
                `BootstrapStatus: Show error buttons and hyperlinks with visibility bitmask = ${this.commercialDiagnosticsUtilities.formatNumberAsHexString(this.errorButtonsVisibility, 8)}).`);

            let buttonSetToDisplay = 0;

            this.commercialDiagnosticsUtilities.logInfoEvent(
                ((this.errorButtonsVisibility & 1) !== 0) ? "CommercialOOBE_ESPProgress_ResetButton_Displayed" : "CommercialOOBE_ESPProgress_ResetButton_Hidden",
                `BootstrapStatus: ${((this.errorButtonsVisibility & 1) !== 0) ? "Show" : "Hide"} the reset button.`);

            if ((this.errorButtonsVisibility & 1) !== 0) {
                buttonSetToDisplay |= this.BUTTON_FLAG_RESET_DEVICE;
            }

            this.commercialDiagnosticsUtilities.logInfoEvent(
                ((this.errorButtonsVisibility & 2) !== 0) ? "CommercialOOBE_ESPProgress_TryAgainButton_Displayed" : "CommercialOOBE_ESPProgress_HideTryAgainButton_Hidden",
                `BootstrapStatus: ${((this.errorButtonsVisibility & 2) !== 0) ? "Show" : "Hide"} the try again button.`);

            if ((this.errorButtonsVisibility & 2) !== 0) {
                buttonSetToDisplay |= this.BUTTON_FLAG_TRY_AGAIN;
            }

            if (buttonSetToDisplay !== 0) {
                this.buttonVisibility(buttonSetToDisplay);
            }

            let hyperlinkSetToDisplay = 0;

            this.commercialDiagnosticsUtilities.logInfoEvent(
                ((this.errorButtonsVisibility & 4) !== 0) ? "CommercialOOBE_ESPProgress_TryAgainButton_Displayed" : "CommercialOOBE_ESPProgress_TryAgainButton_Hidden",
                `BootstrapStatus: ${((this.errorButtonsVisibility & 4) !== 0) ? "Show" : "Hide"} the continue anyway hyperlink.`);

            if ((this.errorButtonsVisibility & 4) !== 0) {
                if (this.showSignOutButton) {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_SignOutHyperLink_Displayed",
                        "BootstrapStatus: Showing sign out hyperlink instead of continue anyway due to admin policy.");
                    hyperlinkSetToDisplay |= this.HYPERLINK_FLAG_SIGN_OUT;
                    this.showContinueAnywayHyperlinkEnabled(false);
                    this.showSignOutHyperlinkEnabled(true);
                } else {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_ContinueAnywayHyperLink_Displayed",
                        "BootstrapStatus: Showing continue anyway hyperlink due to admin policy.");
                    hyperlinkSetToDisplay |= this.HYPERLINK_FLAG_CONTINUE_ANYWAY;
                    this.showContinueAnywayHyperlinkEnabled(true);
                    this.showSignOutHyperlinkEnabled(false);
                }
            }

            const shouldShowCollectLogsButton = this.showCollectLogsButton && CloudExperienceHostAPI.Environment.platform !== 10;

            this.commercialDiagnosticsUtilities.logInfoEvent(
                (shouldShowCollectLogsButton) ? "CommercialOOBE_ESPProgress_CollectLogsButton_Displayed" : "CommercialOOBE_ESPProgress_HideCollectLogsButton_Hidden",
                `BootstrapStatus: ${shouldShowCollectLogsButton ? "Show" : "Hide"} the collect logs hyperlink.`);

            if (shouldShowCollectLogsButton) {
                hyperlinkSetToDisplay |= this.HYPERLINK_FLAG_COLLECT_LOGS;
                this.showDiagnosticsHyperlinkEnabled(true);
            }
            else {
                this.showDiagnosticsHyperlinkEnabled(false);
            }

            this.hyperlinkVisibility(hyperlinkSetToDisplay);
        }

        async shouldShowContinueAnywayButtonAsync() {
            return this.sessionUtilities.getSettingAsync(this.sessionUtilities.STATE_NAME_GLOBAL_SHOW_CONTINUE_ANYWAY_BUTTON).then(
                (result) => {
                    let enableContinueAnyway = false;

                    if (result === "true") {
                        enableContinueAnyway = true;
                    }

                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        enableContinueAnyway ? "CommercialOOBE_ESPProgress_ContinueAnywayButton_Enabled" : "CommercialOOBE_ESPProgress_ContinueAnywayButton_Disabled",
                        `BootstrapStatus: shouldShowContinueAnywayButtonAsync = ${enableContinueAnyway}`);

                    return enableContinueAnyway;
                });
        }

        async shouldShowSignOutButtonAsync() {
            try {
                if (!this.sessionUtilities.runningInOobe()) {
                    this.showSignOutButton = false;

                    const shouldBeStandardUser = await this.sessionUtilities.autopilotApis.getOobeSettingsOverrideAsync(EnterpriseDeviceManagement.Service.AutoPilot.AutoPilotOobeSetting.disallowUserAsLocalAdmin);
                    if (!shouldBeStandardUser) {
                        const pluginManager = new CloudExperienceHostAPI.Provisioning.PluginManager();
                        const isAutopilotReset = pluginManager.isPostPowerwash();
                        const isHybrid = (await this.sessionUtilities.autopilotApis.getDwordPolicyAsync("CloudAssignedDomainJoinMethod") === 1);

                        this.commercialDiagnosticsUtilities.logInfoEvent(
                            (isAutopilotReset || isHybrid) ? "CommercialOOBE_ESPProgress_ShowSignOutButton_True" : "CommercialOOBE_ESPProgress_ShowSignOutButton_False"
                            `BootstrapStatus: shouldShowSignOutButton => isAutopilotReset = ${isAutopilotReset} or isHybrid = ${isHybrid}`);

                        if (isAutopilotReset || isHybrid) {
                            this.showSignOutButton = true;
                        }
                    } else {
                        this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_UserShouldBeStandardUser", "BootstrapStatus: User should not be a member of the admin group.");
                    }
                }
            } catch (e) {
                this.commercialDiagnosticsUtilities.logExceptionEvent(
                    "CommercialOOBE_ESPProgress_ShouldShowSignOutButton_Failed",
                    "BootstrapStatus: shouldShowSignOutButton failed",
                    e);
            }
        }

        async checkBlockingValueAsync() {
            try {
                this.errorButtonsVisibility = await this.sessionUtilities.enrollmentApis.checkBlockingValueAsync();
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_GetBlockingValueBitMask_Success",
                    `BootstrapStatus: Blocking value bitmask = ${this.commercialDiagnosticsUtilities.formatNumberAsHexString(this.errorButtonsVisibility, 8)}).`);
            } catch (e) {
                this.commercialDiagnosticsUtilities.logExceptionEvent(
                    "CommercialOOBE_ESPProgress_GetBlockingValueBitMask_Failed",
                    "BootstrapStatus: checkBlockingValueAsync failed",
                    e);
            }
        }

        async checkForWhiteGloveModeAsync() {
            try {
                this.isWhiteGloveFlow = false;

                const autopilotMode = await this.sessionUtilities.autopilotApis.getDeviceAutopilotModeAsync();

                if ((autopilotMode === EnterpriseDeviceManagement.Service.AutoPilot.AutopilotMode.whiteGloveCanonical) ||
                    (autopilotMode === EnterpriseDeviceManagement.Service.AutoPilot.AutopilotMode.whiteGloveDJPP)) {
                    this.isWhiteGloveFlow = true;
                }

                let autopilotAcceptEulaFeatureEnabled = CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("AutopilotAcceptEula");

                if (autopilotAcceptEulaFeatureEnabled) {

                    this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_Started", "Checking to see if the EULA needs to be explictly accepted");


                    try {
                        const isUsingDeviceTicket = await this.sessionUtilities.autopilotApis.getOobeSettingsOverrideAsync(EnterpriseDeviceManagement.Service.AutoPilot.AutoPilotOobeSetting.aadAuthUsingDeviceTicket);

                        this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_DetermineShouldAccept", `Pre-provisioning mode: ${this.isWhiteGloveFlow}, self-deploying mode: ${isUsingDeviceTicket}`);

                        if (isUsingDeviceTicket || this.isWhiteGloveFlow) {
                            let eulaAlreadyAccepted = CloudExperienceHost.Storage.SharableData.getValue(this.EULA_ALREADY_ACCEPTED);
                            if (eulaAlreadyAccepted) {
                                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_Skipped", "EULA already marked as accepted");
                            } else {
                                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_StartingAccept", "Beginning EULA acceptance");
                                await CloudExperienceHostAPI.OobeEulaManagerStaticsCore.acceptEulaAsync();
                                this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_Succeeded", "EULA has been accepted");
                            }
                        }
                    } catch (err) {
                        CloudExperienceHost.AutoPilot.logInfoEvent(
                            "CommercialOOBE_ESPProgress_ExplicitEulaAccept_Failed",
                            JSON.stringify(err));
                    }

                    this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExplicitEulaAccept_Completed", "EULA acceptance check has completed");
                }

                this.commercialDiagnosticsUtilities.logInfoEvent(
                    this.isWhiteGloveFlow ? "CommercialOOBE_ESPProgress_WhiteGloveMode_True" : "CommercialOOBE_ESPProgress_WhiteGloveMode_False",
                    `BootstrapStatus: White Glove flow = ${this.isWhiteGloveFlow}.`);
            } catch (e) {
                this.commercialDiagnosticsUtilities.logExceptionEvent(
                    "CommercialOOBE_ESPProgress_CheckWhiteGloveMode_Failed",
                    "BootstrapStatus: checkForWhiteGloveModeAsync failed",
                    e);
            }
        }

        async checkShowLogsSettingAsync() {
            try {
                this.showCollectLogsButton = await this.sessionUtilities.enrollmentApis.shouldShowCollectLogsAsync(this.sessionUtilities.runningInOobe());
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_CheckShowLogsSetting_Success",
                    `BootstrapStatus: Show collect logs policy = ${this.showCollectLogsButton}`);
            } catch (e) {
                this.commercialDiagnosticsUtilities.logExceptionEvent(
                    "CommercialOOBE_ESPProgress_CheckShowLogsSetting_Failed",
                    "BootstrapStatus: Error thrown trying to get the collect logs policy",
                    e);
            }
        }

        async getsyncFailTimeoutInMillisecondsAsync() {
            let isUsingDeviceTicket = await this.sessionUtilities.autopilotApis.getOobeSettingsOverrideAsync(EnterpriseDeviceManagement.Service.AutoPilot.AutoPilotOobeSetting.aadAuthUsingDeviceTicket)
            if (!isUsingDeviceTicket ||
                    this.sessionUtilities.getSettingAsync(this.sessionUtilities.STATE_NAME_GLOBAL_MDM_ENROLLMENT_STATUS) === this.sessionUtilities.MDM_ENROLLMENT_DISPOSITION[EnterpriseDeviceManagement.Service.AutoPilot.EnrollmentDisposition.completed]) {
                try {
                   this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ESPTimeOutValueRetrieval_Started", "BootstrapStatus: Retrieving the ESP Timeout value.");
                    this.syncFailTimeoutInMilliseconds = await sessionUtilities.enrollmentApis.getSyncFailureTimeout()
                   this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ESPTimeOutValueRetrieval_Success", `BootstrapStatus: ESP Timeout successfully retrieved: ${this.syncFailTimeoutInMilliseconds/(1000 * 60)} minutes.`);
                } catch (e) {
                    this.commercialDiagnosticsUtilities.logExceptionEvent(
                        "CommercialOOBE_ESPProgress_ESPTimeOutValueRetrieval_Failed",
                        `BootstrapStatus: Error occurred while retrieving ESP Timeout, falling back to default: ${this.syncFailTimeoutInMilliseconds/(1000 * 60)} minutes.`,
                        e);
                }
            } else {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_ESPTimeOutValueRetrieval_Skipped",
                    `BootstrapStatus: ESP Timeout cannot be retrieved because enrollment hasn't occured yet, falling back to default: ${this.syncFailTimeoutInMilliseconds/(1000 * 60)} minutes.`);
            }
        }

        handleFullyExitingEsp() {

            this.commercialDiagnosticsUtilities.logInfoEventName("CommercialOOBE_ESP_RebootResumption_Unset");

            bridge.invoke("CloudExperienceHost.Storage.SharableData.removeValue", "resumeCXHId");

            bridge.invoke("CloudExperienceHost.Storage.SharableData.removeValue", "OOBEResumeEnabled");

            bridge.invoke("CloudExperienceHost.Storage.SharableData.removeValue", "shouldRebootForOOBE");

            if (!this.sessionUtilities.runningInOobe()) {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESP_ExitPage",
                    "BootstrapStatus: Clearing ESP cache on page exit");

                this.sessionUtilities.deviceManagementUtilities.prepareForForNthUserAsync();
            }

            let bitlockerDeferralEnabled = CloudExperienceHostAPI.FeatureStaging.isOobeFeatureEnabled("AutopilotBitlockerOobeDeferral");
            if (bitlockerDeferralEnabled) {
                if (!this.isWhiteGloveFlow) {
                    this.sessionUtilities.signalBitlockerProvisioningComplete(3); // BitLockerDeferralReason.MdmSyncComplete
                }
            }
        }

        transitionToSuccessPageAsync(
            resultId,
            idOfPageToTransitionTo) {

            return this.sessionUtilities.startPhaseStateMachineAsync(
                this.ESP_COMMANDS_SUBCATEGORY_ID_ON_SUCCESSFUL_ESP_PAGE_EXIT,
                this.sessionUtilities.ESP_COMMAND_PHASE_NAME_PREACTION,
                () => {
                    return bridge.fireEvent(resultId, idOfPageToTransitionTo);
                },
                (actionResultToUse) => {
                    return WinJS.Promise.as(true);
                }
            )
        }

        exitPage() {
            if (this.isLiteWhitePersonality()) {
                this.subheaderText(this.resourceStrings["BootstrapPageStatusSuccess"]);
            }

            if (this.displayRequestInstance) {
                this.commercialDiagnosticsUtilities.logInfoEvent(
                    "CommercialOOBE_ESPProgress_PageDisplayActiveRequest_Released",
                    "BootstrapStatus: Releasing request to keep display active, exiting page.");
                Windows.Devices.Power.Battery.aggregateBattery.removeEventListener("reportupdated", this.batteryReportUpdatedOnHololens.bind(this));
                this.displayRequestInstance.requestRelease();
            }

            this.handleFullyExitingEsp();

            if (this.isWhiteGloveFlow) {
                bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.sessionUtilities.WHITE_GLOVE_RESULT_NAME, this.sessionUtilities.WHITE_GLOVE_RESULT_VALUE_SUCCESS);
                bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.sessionUtilities.WHITE_GLOVE_END_TIME_VALUE, Date.now());
                setTimeout(
                    () => {
                        this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_WhiteGlove_Success", "BootstrapStatus: Exiting page due to White Glove success.");
                        return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_WHITE_GLOVE_RESULTS_PAGE);
                    },
                    this.ACTION_INITIATION_DELAY_IN_MILLISECONDS);
            } else {
                setTimeout(
                    () => {
                        if (this.showSignOutButton) {
                            this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_ExitPageSignOut_Displayed", "BootstrapStatus: Displaying sign out to exit page.");
                            this.infoMessage(this.resourceStrings["BootstrapPageAutopilotResetSignOutMessage"]);
                            this.buttonVisibility(this.BUTTON_FLAG_SIGN_OUT);
                        } else {
                            this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_Page_Exiting", "BootstrapStatus: Exiting page normally.");
                            return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_POST_ESP_SUCCESS_PAGE);
                        }
                    },
                    this.ACTION_INITIATION_DELAY_IN_MILLISECONDS);
            }
        }

        runOneCategory(previousCategorySucceeded, tryingAgain) {
            while (this.currentCategoryIndex < this.categoryUiContainers.length) {
                let currentCategory = this.categoryUiContainers[this.currentCategoryIndex];

                if (this.sessionUtilities.runningInOobe() && !currentCategory.runsInOobe()) {
                    return WinJS.Promise.as(previousCategorySucceeded);
                } else if (!currentCategory.isCategoryInTerminalState() && (currentCategory.getDisposition() === this.sessionUtilities.CATEGORY_DISPOSITION_IGNORED)) {
                    this.currentCategoryIndex++;
                } else {
                    break;
                }
            }

            if (this.currentCategoryIndex >= this.categoryUiContainers.length) {
                return WinJS.Promise.as(previousCategorySucceeded);
            }

            this.clickHandlers.push(this.categoryUiContainers[this.currentCategoryIndex].getClickHandler());

            this.commercialDiagnosticsUtilities.logInfoEvent(
                "CommercialOOBE_ESPProgress_Category_Started",
                `BootstrapStatus: Starting category ${this.categoryUiContainers[this.currentCategoryIndex].getId()}...`);

            if (this.currentCategoryIndex === this.firstPostOobeCategoryIndex) {
                previousCategorySucceeded = true;
            }

            let shouldShowContinueAnywayPromise = WinJS.Promise.as(false);

            return this.checkBlockingValueAsync().then(() => {
                if ((this.isWhiteGloveFlow === false) && (this.errorButtonsVisibility === 0)) {
                    shouldShowContinueAnywayPromise = this.shouldShowContinueAnywayButtonAsync();
                }
            }).then(() => {
                return shouldShowContinueAnywayPromise.then(
                    (shouldShowButton) => {
                        if (shouldShowButton) {
                            this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_Button_Visibility_Triggered", `BootstrapStatus: Button visibility triggered`);
                            this.buttonVisibility(this.showSignOutButton ? this.BUTTON_FLAG_SIGN_OUT : this.BUTTON_FLAG_CONTINUE_ANYWAY);
                        }
                    }).then(() => {
                        return this.categoryUiContainers[this.currentCategoryIndex].startActionsAsync(previousCategorySucceeded, tryingAgain).then(
                            (previousCategorySucceeded) => {
                                this.commercialDiagnosticsUtilities.logInfoEvent(
                                    previousCategorySucceeded? "CommercialOOBE_ESPProgress_Category_Success" : "CommercialOOBE_ESPProgress_Category_Failed",
                                    `BootstrapStatus: Category ${this.categoryUiContainers[this.currentCategoryIndex].getId()} ${previousCategorySucceeded ? "succeeded" : "failed"}.`);

                                this.currentCategoryIndex++;
                                return this.runOneCategory(previousCategorySucceeded, tryingAgain);
                            },

                            (e) => {
                                this.commercialDiagnosticsUtilities.logExceptionEvent(
                                    "CommercialOOBE_ESPProgress_StartActionsAsync_Failed",
                                    "BootstrapStatus: startActionAsync failed",
                                    e);
                            });
                    });
            });
        }

        runAllCategories(tryingAgain) {
            this.clickHandlers = [];
            this.currentCategoryIndex = 0;

            return new WinJS.Promise(
                (completeDispatch, errorDispatch, progressDispatch) => {
                    this.commercialDiagnosticsUtilities.logInfoEvent(
                        "CommercialOOBE_ESPProgress_ESPTimeOutValue_Applied",
                        `BootstrapStatus: Applying the ESP Timeout value: ${this.syncFailTimeoutInMilliseconds / (1000 * 60)} minutes.`);

                    WinJS.Promise.timeout(this.syncFailTimeoutInMilliseconds, this.runOneCategory(true, tryingAgain)).then((previousCategorySucceeded) => {
                        if (previousCategorySucceeded) {
                            this.provisioningCompleted = true;
                            this.exitPage();
                        } else if ((previousCategorySucceeded !== true) && (this.isWhiteGloveFlow)) {
                            let error = this.sessionUtilities.getTransientState(this.sessionUtilities.WHITE_GLOVE_ERROR_USER_MESSAGE);

                            if (error === undefined) {
                                error = this.resourceStrings.WhiteGloveTimeOutError;
                            }

                            bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.sessionUtilities.WHITE_GLOVE_RESULT_NAME, error);
                            bridge.invoke("CloudExperienceHost.Storage.SharableData.addValue", this.sessionUtilities.WHITE_GLOVE_END_TIME_VALUE, Date.now());

                            setTimeout(
                                () => {
                                    this.commercialDiagnosticsUtilities.logInfoEvent("CommercialOOBE_ESPProgress_WhiteGlove_Failed", "BootstrapStatus: Exiting page due to White Glove failure.");

                                    this.handleFullyExitingEsp();

                                    return this.transitionToSuccessPageAsync(CloudExperienceHost.Events.done, this.PAGE_TRANSITION_WHITE_GLOVE_RESULTS_PAGE);
                                },
                                this.ACTION_INITIATION_DELAY_IN_MILLISECONDS);
                        } else {
                            return this.displayErrorAsync().then(() => {
                                return previousCategorySucceeded;
                            });
                        }

                        return WinJS.Promise.as(previousCategorySucceeded);
                    }).then((previousCategorySucceeded) => {
                        completeDispatch(previousCategorySucceeded);
                    });
                },

                () => {
                });
        }
    }

    return autopilotEspProgressViewModel;
});
