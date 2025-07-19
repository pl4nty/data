"use strict";
var CloudExperienceHost;
(function (CloudExperienceHost) {
    var AppFrame;
    (function (AppFrame) {
        function showGraphicAnimation(fileName) {
            return requireAsync(['legacy/appViewManager']).then((result) => {
                return result.legacy_appViewManager.showGraphicAnimation(fileName);
            });
        }
        AppFrame.showGraphicAnimation = showGraphicAnimation;
        function updateFrameDirection() {
            return requireAsync(['legacy/appViewManager']).then((result) => {
                return result.legacy_appViewManager.updateFrameDirection();
            });
        }
        AppFrame.updateFrameDirection = updateFrameDirection;
        function setDisplayModeFullScreen() {
            return requireAsync(['legacy/appViewManager']).then((result) => {
                return result.legacy_appViewManager.setDisplayModeFullScreen();
            });
        }
        AppFrame.setDisplayModeFullScreen = setDisplayModeFullScreen;
        function setBackgroundImage(appDataUri) {
            return new WinJS.Promise((completeDispatch) => completeDispatch());
        }
        AppFrame.setBackgroundImage = setBackgroundImage;
        function setGamepadLegendDisplayOverrideForB(displayText) {
            if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("GamepadLegendEnabled")) {
                return requireAsync(['legacy/appViewManager']).then((result) => {
                    return result.legacy_appViewManager.setGamepadLegendDisplayOverrideForB(displayText);
                });
            }
        }
        AppFrame.setGamepadLegendDisplayOverrideForB = setGamepadLegendDisplayOverrideForB;
    })(AppFrame = CloudExperienceHost.AppFrame || (CloudExperienceHost.AppFrame = {}));
})(CloudExperienceHost || (CloudExperienceHost = {}));
