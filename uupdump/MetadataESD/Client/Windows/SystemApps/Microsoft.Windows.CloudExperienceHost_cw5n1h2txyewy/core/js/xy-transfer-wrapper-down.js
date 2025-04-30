define(['require', "legacy/bridge",], (require, bridge) => {
    let gamepadEnabledObj = CloudExperienceHostAPI.FeatureStaging.tryGetIsFeatureEnabled("GamepadEnabledOobe");
    if (gamepadEnabledObj.result && gamepadEnabledObj.value) {
        let originalMethod = WinJS.UI.XYFocus._xyFocus;
        let shimMethod = function (direction, keyCode, referenceRect, dontExit) {
            let origResult = originalMethod(direction, keyCode, referenceRect, dontExit);
            if (direction == "down" && !origResult) {
                try {
                    CloudExperienceHostAPI.UtilStaticsCore.injectTabKey(false /*holdShift*/);
                }
                catch (err) {
                }
            }
            return origResult;
        };

        // If _keyHandlerStates in undefined causing an exception here
        // check if edits to the WinJS base.js have been overwritten which expose this member
        WinJS.UI.XYFocus._keyHandlerStates.RestState.xyFocus = shimMethod;
        WinJS.UI.XYFocus._keyHandlerStates.ToggleModeRestState.xyFocus = shimMethod;
        WinJS.UI.XYFocus._xyFocus = shimMethod;
    }
})
