﻿
define(() => {
    class OobeEnableDriverUpdate {
        launchAsync() {
            CloudExperienceHostAPI.UtilStaticsCore.enableDriverUpdate();
            return WinJS.Promise.as(CloudExperienceHost.AppResult.success);
        }
    }
    return OobeEnableDriverUpdate;
});