"use strict";
var CloudExperienceHost;
(function (CloudExperienceHost) {
    class Environment {
        static getTarget() {
            var retValue;
            var regValue = CloudExperienceHostAPI.Environment.target;
            switch (regValue) {
                case 0:
                    retValue = CloudExperienceHost.TargetEnvironment.PROD;
                    break;
                case 1:
                    retValue = CloudExperienceHost.TargetEnvironment.INT;
                    break;
                default:
                    retValue = CloudExperienceHost.TargetEnvironment.PROD;
                    break;
            }
            return retValue;
        }
        static hasInternetAccess() {
            let hasInternetAccess = false;
            let internetAccessOverride = CloudExperienceHostAPI.Environment.getRegValue("internetAccessOverride");
            if (internetAccessOverride !== "")
                return (internetAccessOverride === "true");
            let connectionProfile = Windows.Networking.Connectivity.NetworkInformation.getInternetConnectionProfile();
            if (connectionProfile && (connectionProfile.getNetworkConnectivityLevel() === Windows.Networking.Connectivity.NetworkConnectivityLevel.internetAccess)) {
                if (connectionProfile.isWwanConnectionProfile && Environment._isOobeScenario() && !Environment.hasDataMartBeenChecked) {
                    Environment.wwanConnectionIsDataMartSim = Environment.isDataMartSim();
                    Environment.hasDataMartBeenChecked = true;
                }
                if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("Feature_Servicing_InternetDisconnectFix")) {
                    hasInternetAccess = (!connectionProfile.isWwanConnectionProfile || !Environment.wwanConnectionIsDataMartSim);
                }
                else {
                    hasInternetAccess = !Environment.wwanConnectionIsDataMartSim;
                }
            }
            return hasInternetAccess;
        }
        static hasNetworkConnectivity() {
            let hasNetworkConnectivity = false;
            let ConnectionProfiles = Windows.Networking.Connectivity.NetworkInformation.getConnectionProfiles();
            if (ConnectionProfiles.length !== 0) {
                for (var i = 0; i < ConnectionProfiles.length; i++) {
                    if (ConnectionProfiles[i].getNetworkConnectivityLevel() > Windows.Networking.Connectivity.NetworkConnectivityLevel.none) {
                        hasNetworkConnectivity = true;
                        break;
                    }
                }
            }
            return hasNetworkConnectivity;
        }
        static isConnectionMetered() {
            let isConnectionMetered = false;
            let connectionProfile = Windows.Networking.Connectivity.NetworkInformation.getInternetConnectionProfile();
            if (connectionProfile) {
                let connectionCost = connectionProfile.getConnectionCost();
                if (connectionCost) {
                    isConnectionMetered = ((connectionCost.networkCostType == Windows.Networking.Connectivity.NetworkCostType.fixed) ||
                        (connectionCost.networkCostType == Windows.Networking.Connectivity.NetworkCostType.variable));
                }
            }
            return isConnectionMetered;
        }
        static isDataMartSim() {
            let isDmSim = false;
            try {
                let modem = Windows.Networking.NetworkOperators.MobileBroadbandModem.getDefault();
                if (modem) {
                    let iccid = modem.deviceInformation.simIccId;
                    isDmSim = CloudExperienceHostAPI.UtilStaticsCore.isDataMartSim(iccid);
                }
            }
            catch (exception) {
            }
            return isDmSim;
        }
        static getLicensingPoliciesAsync(namesJson) {
            return new WinJS.Promise(function (completeDispatch, errorDispatch, progressDispatch) {
                let names = JSON.parse(namesJson);
                let results = new Array(names.length);
                for (let i = 0; i < names.length; i++) {
                    results[i] = CloudExperienceHostAPI.UtilStaticsCore.getLicensingPolicyValue(names[i]);
                }
                completeDispatch(JSON.stringify(results));
            });
        }
        static getAnalyticsInfoSystemPropertiesAsync(itemsJson) {
            let items = JSON.parse(itemsJson);
            return Windows.System.Profile.AnalyticsInfo.getSystemPropertiesAsync(items).then((result) => {
                return JSON.stringify(result);
            });
        }
        static isNetworkRequiredAsync() {
            return new WinJS.Promise(function (completeDispatch, errorDispatch, progressDispatch) {
                let result = CloudExperienceHostAPI.UtilStaticsCore.isNetworkRequired;
                completeDispatch(result);
            });
        }
        static GetWiFiHostedApplicationArguments() {
            let propertySet = new Windows.Foundation.Collections.PropertySet();
            if (CloudExperienceHost.Storage.SharableData.getValue("retailDemoEnabled")) {
                propertySet.insert("IsNetworkRequired", false);
            }
            else {
                propertySet.insert("IsNetworkRequired", CloudExperienceHostAPI.UtilStaticsCore.disabledSkipNetwork);
            }
            return propertySet;
        }
        static GetWiFiHostedApplicationArgumentsDesktop() {
            let propertySet = Environment.GetWiFiHostedApplicationArguments();
            propertySet.insert("HostedApplicationLaunchArgument", (CloudExperienceHost.getContext().personality === CloudExperienceHost.TargetPersonality.LiteWhite) ? "desktopLite" : "desktopInclusive");
            return propertySet;
        }
        static GetWiFiHostedApplicationArgumentsWcosDefaults() {
            let propertySet = new Windows.Foundation.Collections.PropertySet();
            propertySet.insert("NetworkUXMode", "Windows.Core");
            propertySet.insert("IsNetworkRequired", true);
            return propertySet;
        }
        static GetWiFiHostedApplicationArgumentsHub() {
            let propertySet = new Windows.Foundation.Collections.PropertySet();
            propertySet.insert("IsNetworkRequired", true);
            propertySet.insert("NetworkUXMode", "Desktop");
            return propertySet;
        }
        static GetWiFiHostedApplicationArgumentsDesktopReconnect() {
            let propertySet = this.GetWiFiHostedApplicationArgumentsDesktop();
            propertySet.insert("IsReconnect", true);
            return propertySet;
        }
        static GetWiFiHostedApplicationArgumentsWcosReconnect() {
            let propertySet = this.GetWiFiHostedApplicationArgumentsWcosDefaults();
            propertySet.insert("IsReconnect", true);
            return propertySet;
        }
        static getMachineModel() {
            return CloudExperienceHostAPI.Environment.machineModel;
        }
        static getManufacturer() {
            return CloudExperienceHostAPI.Environment.manufacturer;
        }
        static getPlatform() {
            var retValue;
            var regValue = CloudExperienceHostAPI.Environment.platform;
            switch (regValue) {
                case 3:
                    retValue = CloudExperienceHost.TargetPlatform.DESKTOP;
                    break;
                case 5:
                    retValue = CloudExperienceHost.TargetPlatform.XBOX;
                    break;
                case 6:
                    retValue = CloudExperienceHost.TargetPlatform.SURFACEHUB;
                    break;
                case 9:
                    retValue = CloudExperienceHost.TargetPlatform.SERVER;
                    break;
                case 10:
                    retValue = CloudExperienceHost.TargetPlatform.HOLOGRAPHIC;
                    break;
                default:
                    retValue = "CloudExperienceHost.Platform." + regValue;
                    break;
            }
            return retValue;
        }
        static getDeviceForm() {
            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("OOBEDeviceForm")) {
                try {
                    return CloudExperienceHostAPI.Environment.deviceForm.toString();
                }
                catch (exception) {
                    CloudExperienceHost.Telemetry.logEvent("GetDeviceFormError", CloudExperienceHost.GetJsonFromError(exception));
                }
            }
            return "";
        }
        static isGamepadBasedDevice() {
            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("OOBEDeviceForm")) {
                return CloudExperienceHostAPI.Environment.deviceForm == CloudExperienceHost.TargetDevice.HANDHELD;
            }
            return false;
        }
        static getWindowsProductId() {
            return CloudExperienceHostAPI.Environment.windowsProductId.toString();
        }
        static getEdition() {
            return CloudExperienceHostAPI.Environment.edition;
        }
        static isRemoteDesktopSession() {
            var isRemoteDesktopSession = false;
            var interactiveSession = Windows.System.RemoteDesktop.InteractiveSession;
            if (interactiveSession && interactiveSession.isRemote) {
                isRemoteDesktopSession = true;
            }
            return isRemoteDesktopSession;
        }
        static isSpeechDisabled() {
            let navMesh = CloudExperienceHost.getNavMesh();
            return navMesh && navMesh.getSpeechDisabled();
        }
        static _isOobeScenario() {
            let isOobe = false;
            try {
                if (Environment.getPlatform() == CloudExperienceHost.TargetPlatform.XBOX) {
                    isOobe = !Windows.Xbox.System.Internal.XConfig.XConfigProperties.isOobeCompleted;
                }
                else {
                    isOobe = CloudExperienceHost.getContext &&
                        CloudExperienceHost.getContext() &&
                        (CloudExperienceHost.getContext().host.toLowerCase() === "frx");
                }
            }
            catch (e) {
            }
            return isOobe;
        }
        static getTelemetryLevel() {
            return CloudExperienceHostAPI.OobeSettingsManagerStaticsCore.getTelemetryLevel();
        }
    }
    Environment.hasDataMartBeenChecked = false;
    Environment.wwanConnectionIsDataMartSim = false;
    CloudExperienceHost.Environment = Environment;
    class ScoobeContextHelper {
        static tryGetScoobeLaunchInstance() {
            let scoobeLaunchInstanceObj = { scoobeLaunchInstance: 0, succeeded: false };
            scoobeLaunchInstanceObj.scoobeLaunchInstance = CloudExperienceHost.Storage.SharableData.getValue("ScoobeLaunchInstance");
            scoobeLaunchInstanceObj.succeeded = (scoobeLaunchInstanceObj.scoobeLaunchInstance != null) ? true : false;
            return scoobeLaunchInstanceObj;
        }
    }
    CloudExperienceHost.ScoobeContextHelper = ScoobeContextHelper;
    class OobeExperimentationPages {
        static getShouldSkipAsync() {
            let msaDisallowed = (CloudExperienceHost.getAllowedIdentityProviders().indexOf(CloudExperienceHost.SignInIdentityProviders.MSA) == -1);
            return WinJS.Promise.wrap(msaDisallowed);
        }
    }
    CloudExperienceHost.OobeExperimentationPages = OobeExperimentationPages;
    class OobeUserIntent {
        static getShouldSkipAsync() {
            return new WinJS.Promise(function (completeDispatch /*, errorDispatch, progressDispatch*/) {
                if (CloudExperienceHostAPI.UtilStaticsCore.getLicensingPolicyValue("Shell-UserIntentDevicePersonalization-Enabled") !== 1) {
                    completeDispatch(true);
                    return;
                } // Skip if the User Intent feature is disabled via SL Policy
                let shouldSkip = false;
                let shouldRestrictionsApply = false;
                let oobeExperimentationPagesPromise = OobeExperimentationPages.getShouldSkipAsync().then((result) => {
                    shouldSkip = result; // Skip if we can't show experimentation pages
                });
                let ageAppropriateDesignCodeEligibilityPromise = AgeAppropriateDesignCode.Eligibility.shouldRestrictionsApplyToCurrentUserAsync().then((result) => {
                    shouldRestrictionsApply = result; // Skip for AADC restricted users
                });
                WinJS.Promise.join([oobeExperimentationPagesPromise, ageAppropriateDesignCodeEligibilityPromise]).then(() => {
                    completeDispatch(shouldSkip || shouldRestrictionsApply);
                });
            });
        }
    }
    CloudExperienceHost.OobeUserIntent = OobeUserIntent;
    class OobeGamePass {
        static getShouldSkipAsync() {
            return new WinJS.Promise(function (completeDispatch /*, errorDispatch, progressDispatch*/) {
                let shouldSkip = false;
                let shouldRestrictionsApply = false;
                let oobeExperimentationPagesPromise = OobeExperimentationPages.getShouldSkipAsync().then((result) => {
                    shouldSkip = result; // Skip if we can't show experimentation pages
                });
                let ageAppropriateDesignCodeEligibilityPromise = AgeAppropriateDesignCode.Eligibility.shouldRestrictionsApplyToCurrentUserAsync().then((result) => {
                    shouldRestrictionsApply = result; // Skip for AADC restricted users
                });
                WinJS.Promise.join([oobeExperimentationPagesPromise, ageAppropriateDesignCodeEligibilityPromise]).then(() => {
                    completeDispatch(shouldSkip || shouldRestrictionsApply);
                });
            });
        }
    }
    CloudExperienceHost.OobeGamePass = OobeGamePass;
    class Wireless {
        static getShouldSkipAsync() {
            let skipNetworkConnectPage = CloudExperienceHostAPI.UtilStaticsCore.hideWireless;
            if (!skipNetworkConnectPage) {
                let connectionProfile = Windows.Networking.Connectivity.NetworkInformation.getInternetConnectionProfile();
                if (connectionProfile) {
                    skipNetworkConnectPage = (connectionProfile.getNetworkConnectivityLevel() === Windows.Networking.Connectivity.NetworkConnectivityLevel.internetAccess) &&
                        !connectionProfile.isWwanConnectionProfile;
                }
            }
            return WinJS.Promise.wrap(skipNetworkConnectPage);
        }
        static getConnectivityLevel() {
            let connectionProfile = Windows.Networking.Connectivity.NetworkInformation.getInternetConnectionProfile();
            return (connectionProfile ? connectionProfile.getNetworkConnectivityLevel() : -1); //-1 is default for case of NULL connectivityProfile
        }
    }
    CloudExperienceHost.Wireless = Wireless;
    class WirelessCommercial {
        static getShouldSkipAsync() {
            let oobeResumeEnabled = CloudExperienceHost.Storage.SharableData.getValue("OOBEResumeEnabled");
            if (!oobeResumeEnabled) {
                return WinJS.Promise.wrap(true);
            }
            let skipNetworkConnectPage = CloudExperienceHostAPI.UtilStaticsCore.hideWirelessCommercial;
            CloudExperienceHost.Telemetry.logEvent("WirelessCommercial_HideWirelessCommercial", skipNetworkConnectPage);
            if (!skipNetworkConnectPage) {
                skipNetworkConnectPage = Environment.hasInternetAccess();
                CloudExperienceHost.Telemetry.logEvent("WirelessCommercial_SkipNetworkConnectPage", skipNetworkConnectPage);
            }
            return WinJS.Promise.wrap(skipNetworkConnectPage);
        }
    }
    CloudExperienceHost.WirelessCommercial = WirelessCommercial;
    class Bookends {
        static getShouldSkipAsync() {
            if (CloudExperienceHost.getContext().personality === CloudExperienceHost.TargetPersonality.LiteWhite) {
                return WinJS.Promise.wrap(true);
            }
            let localAccountManager = new CloudExperienceHostBroker.Account.LocalAccountManager();
            let isSpeechAllowedByPolicy = true;
            try {
                let speechController = AppObjectFactory.getInstance().getObjectFromString("CloudExperienceHostAPI.Speech.SpeechRecognitionController");
                isSpeechAllowedByPolicy = speechController.isSpeechAllowedByPolicy();
            }
            catch (exception) {
                CloudExperienceHost.Telemetry.logEvent("IsSpeechAllowedByPolicyError", CloudExperienceHost.GetJsonFromError(exception));
            }
            let skipIntro = localAccountManager.unattendCreatedUser ||
                !CloudExperienceHost.Cortana.isCortanaSupported() ||
                !isSpeechAllowedByPolicy ||
                CloudExperienceHost.Storage.SharableData.getValue("retailDemoEnabled");
            if (!skipIntro) {
                try {
                    let captureSettings = new Windows.Media.Capture.MediaCaptureInitializationSettings();
                    captureSettings.streamingCaptureMode = Windows.Media.Capture.StreamingCaptureMode.audio;
                    captureSettings.mediaCategory = Windows.Media.Capture.MediaCategory.speech;
                    let capture = new Windows.Media.Capture.MediaCapture();
                    let capturePromise = capture.initializeAsync(captureSettings).then(() => {
                        return WinJS.Promise.wrap(false);
                    }, (error) => {
                        return WinJS.Promise.wrap(true);
                    });
                    return capturePromise;
                }
                catch (exception) {
                    return WinJS.Promise.wrap(true);
                }
            }
            return WinJS.Promise.wrap(skipIntro);
        }
    }
    CloudExperienceHost.Bookends = Bookends;
    class AccountDisambiguation {
        static getShouldSkipAsync() {
            let allowedProviders = CloudExperienceHost.getAllowedIdentityProviders();
            let onlineProviderAllowed = ((allowedProviders.indexOf(CloudExperienceHost.SignInIdentityProviders.MSA) != -1) || (allowedProviders.indexOf(CloudExperienceHost.SignInIdentityProviders.AAD) != -1));
            return WinJS.Promise.wrap(!onlineProviderAllowed);
        }
    }
    CloudExperienceHost.AccountDisambiguation = AccountDisambiguation;
    class AccountAndServices {
        static shouldSkipAccountAndServices() {
            try {
                let localAccountManager = new CloudExperienceHostBroker.Account.LocalAccountManager();
                return localAccountManager.unattendCreatedUser;
            }
            catch (exception) {
                return false;
            }
        }
        static getShouldSkipAsync() {
            return WinJS.Promise.wrap(CloudExperienceHost.AccountAndServices.shouldSkipAccountAndServices());
        }
        static getUserProfileEngagementAsync(items) {
            let promises = items.map((item) => {
                let itemStatus = "Ineligible";
                let timeout = false;
                let userProfileEngagementPromise = CloudExperienceHostAPI.UserProfileEngagementCore.checkEngagementAsync(item).then((result) => {
                    itemStatus = result;
                });
                let timeoutPromise = WinJS.Promise.timeout(10000).then(() => { timeout = true; });
                return WinJS.Promise.any([userProfileEngagementPromise, timeoutPromise]).then(() => {
                    if (timeout) {
                        CloudExperienceHost.Telemetry.logEvent("UserProfileEngagementItemTimeout", JSON.stringify({ item: item }));
                    }
                    else {
                        CloudExperienceHost.Telemetry.logEvent("UserProfileEngagementItem", JSON.stringify({ item: item, result: itemStatus }));
                    }
                    return itemStatus;
                });
            });
            return WinJS.Promise.join(promises);
        }
        static isDomainAccount() {
            return CloudExperienceHostAPI.ContentDeliveryManagerHelpers.isDomainAccount;
        }
        static setWebappSkipList(skipListJson) {
            try {
                let skipList = JSON.parse(skipListJson); // verify string input is valid JSON array
                CloudExperienceHost.Storage.SharableData.addValue("skipList_" + CloudExperienceHost.getContext().experienceName, JSON.stringify(skipList)); // append experience name to ensure unique lists per experience
                CloudExperienceHost.Telemetry.logEvent("SetWebappSkipListSuccess");
            }
            catch (ex) {
                CloudExperienceHost.Telemetry.logEvent("SetWebappSkipListFailure", CloudExperienceHost.GetJsonFromError(ex)); // On error, simply log instead of crashing the app
            }
        }
    }
    CloudExperienceHost.AccountAndServices = AccountAndServices;
    class BrowserSettings {
        static pinAndSetDefaultMicrosoftBrowserAsync() {
            return CloudExperienceHostAPI.BrowserEngagementCore.pinAndSetDefaultMicrosoftBrowserAsync();
        }
        static resetBrowserSearchEngineAsync(partnerCode) {
            return CloudExperienceHostAPI.BrowserEngagementCore.resetBrowserSearchEngineAsync(partnerCode);
        }
        static declutterBrowsersAfterUserConsentAsync() {
            return CloudExperienceHostAPI.BrowserEngagementCore.declutterBrowsersAfterUserConsentAsync();
        }
    }
    CloudExperienceHost.BrowserSettings = BrowserSettings;
    class DeviceName {
        static getShouldSkipAsync() {
            if (CloudExperienceHost.AccountAndServices.shouldSkipAccountAndServices() ||
                CloudExperienceHost.Storage.SharableData.getValue("retailDemoEnabled")) {
                return WinJS.Promise.wrap(true);
            }
            else {
                return CloudExperienceHostAPI.OobeDeviceNameManager.getShouldSkipAsync();
            }
        }
        static getIsValidDeviceNameAsync(deviceName) {
            return CloudExperienceHostAPI.OobeDeviceNameManager.getIsValidDeviceNameAsync(deviceName);
        }
        static setDeviceNameAsync(deviceName) {
            return CloudExperienceHostAPI.OobeDeviceNameManager.setDeviceNameAsync(deviceName).then(() => {
                CloudExperienceHost.setRebootForOOBE("OobeWirelessAfterDeviceNameReboot");
            });
        }
    }
    CloudExperienceHost.DeviceName = DeviceName;
    class SnapshotCapture {
        static getShouldSkipAsync() {
            let isDeviceNPUCapable = false;
            isDeviceNPUCapable = CloudExperienceHostAPI.SnapshotCapture.isSnapshotCaptureSupported();
            try {
                let shouldShowPage = isDeviceNPUCapable && !CloudExperienceHostAPI.SnapshotCapture.isPackageAvailable();
                return WinJS.Promise.wrap(!shouldShowPage);
            }
            catch (exception) {
                return WinJS.Promise.wrap(!isDeviceNPUCapable);
            }
        }
        static resumeSnapshotCaptureAsync() {
            return WinJS.Promise.wrap(CloudExperienceHostAPI.SnapshotCapture.resumeSnapshotCapture());
        }
        static enableSnapshotCaptureAsync() {
            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("ShowHelloPromptToEnableA9")) {
                return CloudExperienceHostAPI.SnapshotCapture.enableSnapshotCaptureAsync();
            }
            else {
                CloudExperienceHost.Telemetry.logEvent("ApiNonexistentOnClient", "ShowHelloPromptToEnableA9");
                throw "ApiNonexistentOnClient"; // This API is not available in this image
            }
        }
    }
    CloudExperienceHost.SnapshotCapture = SnapshotCapture;
    class SnapshotCaptureConsent {
        static getShouldSkipAsync() {
            let isDeviceNPUCapable = false;
            isDeviceNPUCapable = CloudExperienceHostAPI.SnapshotCapture.isSnapshotCaptureSupported();
            try {
                let shouldShowPage = isDeviceNPUCapable && CloudExperienceHostAPI.SnapshotCapture.isPackageAvailable();
                return WinJS.Promise.wrap(!shouldShowPage);
            }
            catch (exception) {
                return WinJS.Promise.wrap(!isDeviceNPUCapable);
            }
        }
    }
    CloudExperienceHost.SnapshotCaptureConsent = SnapshotCaptureConsent;
    class FeatureStaging {
        static isOobeFeatureEnabled(featureName) {
            let featureEnabledObj = CloudExperienceHostAPI.FeatureStaging.tryGetIsFeatureEnabled(featureName);
            return featureEnabledObj.result ? featureEnabledObj.value : false;
        }
        static tryGetIsFeatureEnabled(featureName) {
            return CloudExperienceHostAPI.FeatureStaging.tryGetIsFeatureEnabled(featureName);
        }
        static tryGetFeatureVariant(featureName) {
            return CloudExperienceHostAPI.FeatureStaging.tryGetFeatureVariant(featureName);
        }
        static tryGetFeatureVariantData(featureName) {
            return CloudExperienceHostAPI.FeatureStaging.tryGetFeatureVariantData(featureName);
        }
    }
    CloudExperienceHost.FeatureStaging = FeatureStaging;
    class ScheduledTasks {
        static registerTimeTriggeredTaskForUserScenarioAsync(scenarioId, triggerTimeDeltaInMinutes) {
            return CloudExperienceHostAPI.ScheduledTasksRegistrationManagerCore.registerTimeTriggeredTaskForUserScenarioAsync(scenarioId, triggerTimeDeltaInMinutes);
        }
        static deleteRegisteredTaskIfPresentAsync(scenarioId) {
            return CloudExperienceHostAPI.ScheduledTasksRegistrationManagerCore.deleteRegisteredTaskIfPresentAsync(scenarioId);
        }
    }
    CloudExperienceHost.ScheduledTasks = ScheduledTasks;
    var AgeAppropriateDesignCode;
    (function (AgeAppropriateDesignCode) {
        var AgeGroup;
        (function (AgeGroup) {
            AgeGroup[AgeGroup["Unknown"] = 0] = "Unknown";
            AgeGroup[AgeGroup["MinorWithoutParentalConsent"] = 1] = "MinorWithoutParentalConsent";
            AgeGroup[AgeGroup["MinorWithParentalConsent"] = 2] = "MinorWithParentalConsent";
            AgeGroup[AgeGroup["Adult"] = 3] = "Adult";
            AgeGroup[AgeGroup["NotAdult"] = 4] = "NotAdult";
            AgeGroup[AgeGroup["MinorNoParentalConsentRequired"] = 5] = "MinorNoParentalConsentRequired";
        })(AgeGroup || (AgeGroup = {}));
        ;
        class Eligibility {
            static shouldRestrictionsApplyInRegion(region) {
                let aadcInScopeRegionList = ["AT", "AUT", "BE", "BEL", "BG", "BGR", "HR", "HRV", "CY", "CYP",
                    "CZ", "CZE", "DK", "DNK", "EE", "EST", "FI", "FIN", "FR", "FRA", "DE", "DEU", "GR", "GRC",
                    "HU", "HUN", "IE", "IRL", "IT", "ITA", "LV", "LVA", "LT", "LTU", "LU", "LUX", "MT", "MLT",
                    "NL", "NLD", "PL", "POL", "PT", "PRT", "RO", "ROU", "SK", "SVK", "SI", "SVN", "ES", "ESP",
                    "SE", "SWE", "GB", "GBR", "IS", "ISL", "LI", "LIE", "NO", "NOR", "CH", "CHE", "UK"];
                return (aadcInScopeRegionList.indexOf(region) != -1);
            }
            static shouldRestrictionsApplyToAgeGroupAndRegion(ageGroup, region, shouldRestrictionsApplyToMinorOverStatutoryAge) {
                if (!Eligibility.shouldRestrictionsApplyInRegion(region)) {
                    return false; // Exit early if the region is not in-scope
                }
                switch (ageGroup) {
                    case AgeGroup.MinorWithoutParentalConsent:
                    case AgeGroup.MinorWithParentalConsent:
                    case AgeGroup.MinorNoParentalConsentRequired:
                        return true;
                    case AgeGroup.NotAdult:
                        return shouldRestrictionsApplyToMinorOverStatutoryAge;
                    case AgeGroup.Adult:
                        return false;
                    case AgeGroup.Unknown:
                    default:
                        return false;
                }
            }
            static shouldRestrictionsApplyInDeviceRegion() {
                let deviceRegion = CloudExperienceHost.Globalization.GeographicRegion.getCode();
                return Eligibility.shouldRestrictionsApplyInRegion(deviceRegion);
            }
            static shouldRestrictionsApplyToCurrentUserAsync(shouldRestrictionsApplyToMinorOverStatutoryAge = false) {
                return new WinJS.Promise((completeDispatch /*, errorDispatch, progressDispatch */) => {
                    CloudExperienceHost.MSA.getAccountInformation(null /* userName */, null /* accountId */).then((accountInformationSet) => {
                        let ageGroup = accountInformationSet.hasKey("agegroup") ? parseInt(accountInformationSet.lookup("agegroup")) : AgeGroup.Unknown;
                        let region = accountInformationSet.hasKey("countryOrRegion") ? accountInformationSet.lookup("countryOrRegion").toUpperCase() : CloudExperienceHost.Globalization.GeographicRegion.getCode();
                        completeDispatch(Eligibility.shouldRestrictionsApplyToAgeGroupAndRegion(ageGroup, region, shouldRestrictionsApplyToMinorOverStatutoryAge));
                    }, (e) => {
                        completeDispatch(Eligibility.shouldRestrictionsApplyToAgeGroupAndRegion(AgeGroup.Unknown, CloudExperienceHost.Globalization.GeographicRegion.getCode(), shouldRestrictionsApplyToMinorOverStatutoryAge));
                    });
                });
            }
        }
        AgeAppropriateDesignCode.Eligibility = Eligibility;
        class OobeAadcAgeConfirmation {
            static getShouldSkipAsync() {
                if (CloudExperienceHost.getContext().personality !== CloudExperienceHost.TargetPersonality.LiteWhite) {
                    return WinJS.Promise.wrap(true);
                }
                else {
                    let allowedIdentityProviders = CloudExperienceHost.getAllowedIdentityProviders();
                    let localDisallowed = (allowedIdentityProviders.indexOf(CloudExperienceHost.SignInIdentityProviders.Local) == -1);
                    let msaDisallowed = (allowedIdentityProviders.indexOf(CloudExperienceHost.SignInIdentityProviders.MSA) == -1);
                    return WinJS.Promise.wrap(localDisallowed || msaDisallowed);
                }
            }
        }
        AgeAppropriateDesignCode.OobeAadcAgeConfirmation = OobeAadcAgeConfirmation;
    })(AgeAppropriateDesignCode = CloudExperienceHost.AgeAppropriateDesignCode || (CloudExperienceHost.AgeAppropriateDesignCode = {}));
    class DeviceIntegrationPolicy {
        static tryGetGeographicRegionPolicy(policy) {
            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("DeviceIntegrationPolicy")) {
                try {
                    if (WindowsUdk.System.Profile.IntegratedServicesGeographicRegionPolicies !== undefined) {
                        let geographicRegionPolicy = WindowsUdk.System.Profile.IntegratedServicesGeographicRegionPolicies[policy];
                        if (geographicRegionPolicy !== undefined) {
                            return JSON.stringify(geographicRegionPolicy);
                        }
                    }
                    else {
                        CloudExperienceHost.Telemetry.logEvent("ApiNonexistentOnClient", "DeviceIntegrationPolicy");
                        throw "ApiNonexistentOnClient"; // Throw a string error instead of an Error object to avoid truncation in the callback layer
                    }
                }
                catch (exception) {
                    CloudExperienceHost.Telemetry.logEvent("tryGetGeographicRegionPolicyError", CloudExperienceHost.GetJsonFromError(exception));
                }
            }
            return JSON.stringify({});
        }
    }
    CloudExperienceHost.DeviceIntegrationPolicy = DeviceIntegrationPolicy;
    class WindowsAccountSyncConsent {
        static throwIfFeatureIsDisabled() {
            if (!CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("WindowsAccountSyncConsent")) {
                throw "ApiNonexistentOnClient";
            }
        }
        static throwIfApiNotAvailable() {
            if (!(WindowsUdk && WindowsUdk.Services && WindowsUdk.Services.UnifiedConsent && WindowsUdk.Services.UnifiedConsent.WindowsAccountSyncConsentCoordinator)) {
                throw "ApiNonexistentOnClient";
            }
            if (!CloudExperienceHostAPI.WindowsAccountSyncConsentCoordinator) {
                throw "ApiNonexistentOnClient";
            }
        }
        static getConsentStateAsync(categoryName) {
            WindowsAccountSyncConsent.throwIfFeatureIsDisabled();
            WindowsAccountSyncConsent.throwIfApiNotAvailable();
            return new WinJS.Promise(function (completeDispatch, errorDispatch) {
                try {
                    CloudExperienceHostAPI.WindowsAccountSyncConsentCoordinator.getConsentStateFromUserProfileAsync(categoryName).then((consentStateJson) => {
                        completeDispatch(consentStateJson);
                    }, (ex) => {
                        CloudExperienceHost.Telemetry.logEvent("getConsentStateFromUserProfileAsyncError", CloudExperienceHost.GetJsonFromError(ex));
                        errorDispatch(ex);
                    });
                }
                catch (ex) {
                    CloudExperienceHost.Telemetry.logEvent("getConsentStateAsyncError", CloudExperienceHost.GetJsonFromError(ex));
                    errorDispatch(ex);
                }
            });
        }
        static setConsentStateAsync(consentResponseJson) {
            WindowsAccountSyncConsent.throwIfFeatureIsDisabled();
            WindowsAccountSyncConsent.throwIfApiNotAvailable();
            return new WinJS.Promise(function (completeDispatch, errorDispatch) {
                try {
                    CloudExperienceHostAPI.WindowsAccountSyncConsentCoordinator.setConsentStateToUserProfileAsync(consentResponseJson).then(() => {
                        completeDispatch();
                    }, (ex) => {
                        CloudExperienceHost.Telemetry.logEvent("setConsentStateToUserProfileAsyncError", CloudExperienceHost.GetJsonFromError(ex));
                        errorDispatch(ex);
                    });
                }
                catch (ex) {
                    CloudExperienceHost.Telemetry.logEvent("setConsentStateAsyncError", CloudExperienceHost.GetJsonFromError(ex));
                    errorDispatch(ex);
                }
            });
        }
    }
    CloudExperienceHost.WindowsAccountSyncConsent = WindowsAccountSyncConsent;
    class Developer {
        static startDownloadFullPackageAsync() {
            return CloudExperienceHostAPI.Developer.startDownloadFullPackageAsync();
        }
    }
    CloudExperienceHost.Developer = Developer;
})(CloudExperienceHost || (CloudExperienceHost = {}));
