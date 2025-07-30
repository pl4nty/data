//
// Copyright (C) Microsoft. All rights reserved.
//
define(["lib/knockout", 'legacy/bridge', 'legacy/events', 'legacy/core', 'corejs/knockouthelpers'], (ko, bridge, constants, core, KoHelpers) => {
    class OobePrivacySettingsData {
        // Create settings group
        getSettingsGroups(settingsEntryResources) {
            let settingsGroups = [
                {
                    contentHeader: settingsEntryResources.OobeSettingsGroupName,
                    description: settingsEntryResources.OobeSettingsGroupDescription,
                    settings: this.getSettings(settingsEntryResources)
                }
            ];
            return settingsGroups;
        }

        // Task 57800249: Create settings entries
        getSettings(settingsEntryResources) {
            let locationSetting = {
                canonicalName: settingsEntryResources.OobeSettingsLocationName,
                name: settingsEntryResources.OobeSettingsLocationName,
                title: settingsEntryResources.OobeSettingsLocationTitle,
                descriptionOn: settingsEntryResources.OobeSettingsLocationDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsLocationDescOff,
                description2On: settingsEntryResources.OobeSettingsLocationDesc2On,
                description2Off: settingsEntryResources.OobeSettingsLocationDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsLocationGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsLocationGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let findMyDeviceSetting = {
                canonicalName: settingsEntryResources.OobeSettingsFindMyDeviceName,
                name: settingsEntryResources.OobeSettingsFindMyDeviceName,
                title: settingsEntryResources.OobeSettingsFindMyDeviceTitle,
                descriptionOn: settingsEntryResources.OobeSettingsFindMyDeviceDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsFindMyDeviceDescOff,
                description2On: settingsEntryResources.OobeSettingsFindMyDeviceDesc2On,
                description2Off: settingsEntryResources.OobeSettingsFindMyDeviceDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsFindMyDeviceGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsFindMyDeviceGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let telemetrySetting = {
                canonicalName: settingsEntryResources.OobeSettingsTelemetryName,
                name: settingsEntryResources.OobeSettingsTelemetryName,
                title: settingsEntryResources.OobeSettingsTelemetryTitle,
                descriptionOn: settingsEntryResources.OobeSettingsTelemetryDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsTelemetryDescOff,
                description2On: settingsEntryResources.OobeSettingsTelemetryDesc2On,
                description2Off: settingsEntryResources.OobeSettingsTelemetryDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsTelemetryGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsTelemetryGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsLabelFull,
                valueOffLabel: settingsEntryResources.OobeSettingsLabelBasic,
                value2OnLabel: settingsEntryResources.OobeSettingsLabelFull,
                value2OffLabel: settingsEntryResources.OobeSettingsLabelBasic,
                value: true
            };

            let inputDiagnosticSetting = {
                canonicalName: settingsEntryResources.OobeSettingsInputDiagnosticName,
                name: settingsEntryResources.OobeSettingsInputDiagnosticName,
                title: settingsEntryResources.OobeSettingsInputDiagnosticTitle,
                descriptionOn: settingsEntryResources.OobeSettingsInputDiagnosticDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsInputDiagnosticDescOff,
                description2On: settingsEntryResources.OobeSettingsInputDiagnosticDesc2On,
                description2Off: settingsEntryResources.OobeSettingsInputDiagnosticDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsInputDiagnosticGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsInputDiagnosticGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let personalizedOffersSetting = {
                canonicalName: settingsEntryResources.OobeSettingsPersonalizedOffersName,
                name: settingsEntryResources.OobeSettingsPersonalizedOffersName,
                title: settingsEntryResources.OobeSettingsPersonalizedOffersTitle,
                descriptionOn: settingsEntryResources.OobeSettingsPersonalizedOffersDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsPersonalizedOffersDescOff,
                description2On: settingsEntryResources.OobeSettingsPersonalizedOffersDesc2On,
                description2Off: settingsEntryResources.OobeSettingsPersonalizedOffersDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsPersonalizedOffersGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsPersonalizedOffersGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let adsSetting = {
                canonicalName: settingsEntryResources.OobeSettingsAdsName,
                name: settingsEntryResources.OobeSettingsAdsName,
                title: settingsEntryResources.OobeSettingsAdsTitle,
                descriptionOn: settingsEntryResources.OobeSettingsAdsDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsAdsDescOff,
                description2On: settingsEntryResources.OobeSettingsAdsDesc2On,
                description2Off: settingsEntryResources.OobeSettingsAdsDesc2Off,
                onGlyph: settingsEntryResources.OobeSettingsAdsGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsAdsGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let humanPresenceSetting = {
                canonicalName: settingsEntryResources.OobeSettingsHumanPresenceName,
                name: settingsEntryResources.OobeSettingsHumanPresenceName,
                title: settingsEntryResources.OobeSettingsHumanPresenceTitle,
                descriptionOn: settingsEntryResources.OobeSettingsHumanPresenceDescOn,
                descriptionOff: settingsEntryResources.OobeSettingsHumanPresenceDescOff,
                description2On: settingsEntryResources.OobeSettingsHumanPresenceDescOn,
                description2Off: settingsEntryResources.OobeSettingsHumanPresenceDescOff,
                onGlyph: settingsEntryResources.OobeSettingsHumanPresenceGlyphOn,
                offGlyph: settingsEntryResources.OobeSettingsHumanPresenceGlyphOff,
                valueOnLabel: settingsEntryResources.OobeSettingsOn,
                valueOffLabel: settingsEntryResources.OobeSettingsOff,
                value2OnLabel: settingsEntryResources.OobeSettingsOn,
                value2OffLabel: settingsEntryResources.OobeSettingsOff,
                value: true
            };

            let settings = [
                locationSetting,
                findMyDeviceSetting,
                telemetrySetting,
                inputDiagnosticSetting,
                personalizedOffersSetting,
                adsSetting,
                humanPresenceSetting
            ];
            return settings;
        }
    }
    return new OobePrivacySettingsData();
});
