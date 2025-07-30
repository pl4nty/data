//
// Copyright (C) Microsoft. All rights reserved.
//
define(['lib/knockout', 'oobeprivacysettings-data', 'legacy/bridge', 'legacy/events', 'legacy/core', 'corejs/knockouthelpers'], (ko, oobePrivacySettingsData, bridge, constants, core, KoHelpers) => {
    class OobePrivacySettingsAadcViewModel {
        constructor(resourceStrings) {
            this.resourceStrings = resourceStrings;
            this.viewName = ko.observable("defaults");
            this.learnMoreContent = " "; // Learn More content is purely server-side; initialize it to " " to create well-defined iframe content for keyboard focus and Narrator readout

            let titleTextStrings = {};
            let subTitleTextStrings = {};
            titleTextStrings["defaults"] = resourceStrings.Title;
            subTitleTextStrings["defaults"] = resourceStrings.Subtitle;
            titleTextStrings["learnmore"] = resourceStrings.LearnMoreTitle;
            subTitleTextStrings["learnmore"] = "";

            this.title = ko.pureComputed(() => {
                return titleTextStrings[this.viewName()];
            });
            this.subTitleText = ko.pureComputed(() => {
                return subTitleTextStrings[this.viewName()];
            });

            this.subtexts = [];
            this.subtexts.push({ header: resourceStrings.SubHeader1, bodyText: resourceStrings.SubText1 });
            this.subtexts.push({ header: resourceStrings.SubHeader2, bodyText: resourceStrings.SubText2 });

            this.processingFlag = ko.observable(false);
            let flexEndButtonSet = {};
            flexEndButtonSet["defaults"] = [
                {
                    buttonText: resourceStrings.LearnMoreButtonText,
                    buttonType: "button",
                    automationId: "LearnMoreButton",
                    isPrimaryButton: false,
                    autoFocus: false,
                    disableControl: ko.pureComputed(() => {
                        return this.processingFlag();
                    }),
                    buttonClickHandler: () => {

                    }
                },
                {
                    buttonText: resourceStrings.NextButtonText,
                    buttonType: "button",
                    automationId: "NextButton",
                    isPrimaryButton: true,
                    autoFocus: true,
                    disableControl: ko.pureComputed(() => {
                        return this.processingFlag();
                    }),
                    buttonClickHandler: () => {
                        this.onNext();
                    }
                }
            ];
            flexEndButtonSet["learnmore"] = [
                {
                    buttonText: resourceStrings.ContinueButtonText,
                    buttonType: "button",
                    automationId: "ContinueButton",
                    isPrimaryButton: true,
                    autoFocus: false,
                    disableControl: ko.pureComputed(() => {
                        return this.processingFlag();
                    }),
                    buttonClickHandler: () => {

                    }
                }
            ];

            this.flexEndButtons = ko.pureComputed(() => {
                return flexEndButtonSet[this.viewName()];
            });
            this.learnMoreVisible = ko.pureComputed(() => {
                return (this.viewName() === "learnmore");
            });

            this.pageDefaultAction = () => {
                this.onNext();
            };
        }

        onNext() {
            bridge.invoke("CloudExperienceHost.Telemetry.logUserInteractionEvent", "NextButtonClicked");
            bridge.fireEvent(constants.Events.done, constants.AppResult.success);
        }

    }
    return { OobePrivacySettingsAadcViewModel };
});
