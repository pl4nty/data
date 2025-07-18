define(['lib/knockout', 'oobesettings-data', 'legacy/bridge', 'legacy/events', 'legacy/core', 'corejs/knockouthelpers'], (ko, oobeSettingsData, bridge, constants, core, KoHelpers) => {
    
        class SettingsMultiPageViewModel {
            constructor(resources, isInternetAvailable, targetPersonality, isPrivacySensitiveRegion) {
                this.resources = resources;
                this.isPrivacySensitiveRegion = isPrivacySensitiveRegion;
                let settingsPagesAndSettings = this.getSettingsPages();
                this.settingsPageContent = settingsPagesAndSettings.settingsPageContent;
                this.settingsObjects = settingsPagesAndSettings.settingsObjects;

                for (let setting of this.settingsObjects) {
                    bridge.invoke("CloudExperienceHost.Telemetry.logEvent", "Default" + setting.canonicalName, setting.value);
                }

                this.learnMoreContent = oobeSettingsData.getLearnMoreContent();
                this.learnMoreVisible = ko.observable(false);
                this.learnMoreVisible.subscribe(() => {
                    this.setShowBackButton();
                });
                this.settingVisible = ko.pureComputed(() => {
                    return !this.learnMoreVisible();
                });

                this.learnMoreButtons = [
                    {
                        buttonText: resources.ContinueButtonText,
                        buttonType: "button",
                        isPrimaryButton: true,
                        autoFocus: false,
                        disableControl: ko.pureComputed(() => {
                            return this.processingFlag();
                        }),
                        buttonClickHandler: () => {
                            this.onLearnMoreContinue();
                        }
                    }
                ];

                this.onLearnMoreContinue = () => {
                    this.learnMoreVisible(false);
                };

                bridge.addEventListener(constants.Events.backButtonClicked, this.handleBackNavigation.bind(this));

                this.processingFlag = ko.observable(false);
                this.disableControl = ko.pureComputed(() => {
                    return this.processingFlag();
                });

                this.currentPanelIndex = ko.observable(0);

                this.getPanelElement = (panelIndex) => {
                    return document.querySelector(".oobe-panel[data-panel-index='" + panelIndex + "']");
                };

                this.currentPanelElement = ko.pureComputed(() => {
                    return this.getPanelElement(this.currentPanelIndex());
                });

                this.pageDefaultAction = () => {
                    this.nextStep();
                };

                this.currentPanelIndex.subscribe((newStepIndex) => {
                    this.processingFlag(false);

                    let newStepPanel = document.querySelector(".oobe-panel[data-panel-index='" + newStepIndex + "']");
                    if (!newStepPanel) {
                        this.completePageFlow();
                    } else {
                        let page = ko.dataFor(this.currentPanelElement());
                        this.setShowBackButton();

                        if (page.voiceConversationHandler) {
                            page.voiceConversationHandler();
                        }
                    }
                });

                this.pageFooterButtons = [
                    {
                        buttonText: resources.LearnMoreButtonText,
                        buttonClickHandler: () => {
                            this.onLearnMoreButtonClick();
                        },
                        disableControl: this.disableControl
                    },
                    {
                        buttonText: resources.NextButtonText,
                        buttonClickHandler: () => {
                            this.nextStep();
                        },
                        disableControl: ko.pureComputed(() => {
                            let currentPanelIndexValue = this.currentPanelIndex();
                            return (this.settingsPageContent[currentPanelIndexValue] === undefined) ||
                                   (this.settingsPageContent[currentPanelIndexValue].selectedItem() === undefined) ||
                                   this.processingFlag();
                        }),
                        isPrimaryButton: true
                    }
                ];

                this.nextStep = () => {
                    if (!this.processingFlag()) {
                        this.processingFlag(true);
                        this.currentPanelIndex(this.currentPanelIndex() + 1);
                        this.startVoiceOver();
                    }
                };

                this.firstPanelRender = () => {
                    let item = ko.dataFor(this.currentPanelElement());
                    if (item.voiceConversationHandler) {
                        item.voiceConversationHandler();
                    }
                };

                this.completePageFlow = () => {
                    oobeSettingsData.commitSettings(this.settingsObjects, 3 /*PrivacyConsentPresentationVersion::OneSettingPerPageTwoItemListView*/);
                };

                this.onLearnMoreButtonClick = () => {
                    this.learnMoreVisible(true);
                    this.updateLearnMore();
                    this.setShowBackButton();
                };

                this.voiceOverContent = {};
                this.voiceOverContent["Location"] = resources.LocationVoiceOver;                    // OPBS_Location = 0,       // 0
                this.voiceOverContent["InputDiagnostics"] = resources.InputDiagnosticsVoiceOver;    // OPBS_InputDiagnostics,   // 1
                this.voiceOverContent["Telemetry"] = resources.TelemetryVoiceOver;                  // OPBS_Telemetry,          // 2
                this.voiceOverContent["Tailored"] = resources.TailoredVoiceOver;                    // OPBS_Tailored,           // 3
                this.voiceOverContent["Ads"] = resources.AdsVoiceOver;                              // OPBS_Ads,                // 4
                this.voiceOverContent["FindMyDevice"] = resources.FindMyDeviceVoiceOver;            // OPBS_FindMyDevice,       // 5

            }

            startVoiceOver() {
                let currentPanelIndexValue = this.currentPanelIndex();
                if (this.settingsObjects[currentPanelIndexValue] !== undefined)
                {
                    this.speak(this.settingsObjects[currentPanelIndexValue].canonicalName);
                }
            }

            speak(canonicalName) {
                if (canonicalName in this.voiceOverContent) {
                    CloudExperienceHostAPI.Speech.SpeechRecognition.stop();
                    CloudExperienceHostAPI.Speech.SpeechSynthesis.speakAsync(this.voiceOverContent[canonicalName]);
                }
            }

            updateLearnMore() {
                let learnMoreIFrame = document.getElementById("learnMoreIFrame");
                let doc = learnMoreIFrame.contentWindow.document;
                let currentItem = this.settingsObjects[this.currentPanelIndex()];
                oobeSettingsData.updateLearnMoreContentForRender(learnMoreIFrame, doc, document.documentElement.dir, isInternetAvailable, this.resources.NavigationError, targetPersonality, currentItem.canonicalName);
            }

            handleBackNavigation() {
                if (this.settingVisible() && !this.processingFlag() && (this.currentPanelIndex() > 0)) {
                    this.processingFlag(true);
                    this.currentPanelIndex(this.currentPanelIndex() - 1);
                } else if (this.learnMoreVisible()) {
                    this.learnMoreVisible(false);
                }
            }

            setShowBackButton() {
                if (this.learnMoreVisible()) {
                    bridge.invoke("CloudExperienceHost.setShowBackButton", true);
                } else if (this.currentPanelIndex() > 0) {
                    bridge.invoke("CloudExperienceHost.setShowBackButton", true);
                } else {
                    bridge.invoke("CloudExperienceHost.setShowBackButton", false);
                }
            }

            getSettingsPages() {
                let platform = CloudExperienceHostAPI.Environment.platform;
                let oobeSettingsGroups = CloudExperienceHostAPI.OobeSettingsStaticsCore.getSettingGroups();
                let settingsObjects = [];
                let settingsPageContent = [];
                for (let oobeSettingsGroup of oobeSettingsGroups) {
                    let settingsInGroup = oobeSettingsGroup.getSettings();

                    for (let setting of settingsInGroup) {
                        settingsObjects.push(setting);
                        let page = {
                            title: setting.title,
                            items: [
                                {
                                    value: true,
                                    valueText: setting.value2OnLabel,
                                    icon: setting.onGlyph,
                                    descriptionText: setting.description2On
                                },
                                {
                                    value: false,
                                    icon: setting.offGlyph,
                                    valueText: setting.value2OffLabel,
                                    descriptionText: setting.description2Off
                                }
                            ],
                            selectedItem: ko.observable()
                        };
                        page.selectedItem.subscribe((item) => {
                            setting.value = item.value;
                        });

                        if ((platform === 9)) { // Server
                            if (!this.isPrivacySensitiveRegion) {
                                page.selectedItem(page.items[0]);
                            }
                        }
                        
                        settingsPageContent.push(page);
                    }
                }

                return {
                    settingsPageContent: settingsPageContent,
                    settingsObjects: settingsObjects
                };
            }
        }
        return SettingsMultiPageViewModel;
});
