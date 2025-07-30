//
// Copyright (C) Microsoft. All rights reserved.
//
define(['lib/knockout', 'oobeprivacysettings-data', 'legacy/bridge', 'legacy/events', 'legacy/core', 'corejs/knockouthelpers'], (ko, oobePrivacySettingsData, bridge, constants, core, KoHelpers) => {
        class OobePrivacySettingsMultiPageViewModel {
            constructor(resources, settingsEntryResources) {
                this.resources = resources;
                this.settingsEntryResources = settingsEntryResources;
                let settingsPagesAndSettings = this.getSettingsPages();
                this.settingsPageContent = settingsPagesAndSettings.settingsPageContent;
                this.settingsObjects = settingsPagesAndSettings.settingsObjects;

                this.settingVisible = ko.observable(true);

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

                        }
                    }
                ];

                // Add event listener for back button
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
                    }
                });

                this.pageFooterButtons = [
                    {
                        buttonText: resources.LearnMoreButtonText,
                        buttonClickHandler: () => {

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

                // One of the component redirections loses the object context for invoking this. For now use an arrow function to work around this.
                this.nextStep = () => {
                    if (!this.processingFlag()) {
                        this.processingFlag(true);
                        this.currentPanelIndex(this.currentPanelIndex() + 1);
                    }
                };

                this.firstPanelRender = () => {
                    let item = ko.dataFor(this.currentPanelElement());
                };

                this.completePageFlow = () => {
                    bridge.fireEvent(constants.Events.done, constants.AppResult.success);
                };
            }

            handleBackNavigation() {
                // Since the back button in Frame is removed asynchronously, multiple back navigations may arrive
                // during transitions within the webapp panes.
                // Therefore also cap the panel index decrement at zero.
                if (this.settingVisible() && !this.processingFlag() && (this.currentPanelIndex() > 0)) {
                    this.processingFlag(true);
                    this.currentPanelIndex(this.currentPanelIndex() - 1);
                }
            }

            setShowBackButton() {
            if (this.currentPanelIndex() > 0) {
                    bridge.invoke("CloudExperienceHost.setShowBackButton", true);
                } else {
                    bridge.invoke("CloudExperienceHost.setShowBackButton", false);
                }
            }

            // Converts the underlying settings objects into a format consumable by the multi-page variant of oobe settings
            getSettingsPages() {
                //let platform = CloudExperienceHostAPI.Environment.platform;
                let oobeSettingsGroups = oobePrivacySettingsData.getSettingsGroups(this.settingsEntryResources);
                let settingsObjects = [];
                let settingsPageContent = [];
                for (let oobeSettingsGroup of oobeSettingsGroups) {
                    let settingsInGroup = oobeSettingsGroup.settings;

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
                        
                        //add the page to the list
                        settingsPageContent.push(page);
                    }
                }

                return {
                    settingsPageContent: settingsPageContent,
                    settingsObjects: settingsObjects
                };
            }
        }
        return OobePrivacySettingsMultiPageViewModel;
});
