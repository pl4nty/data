define(['legacy/appViewManager'], (appViewManager) => {
    class DefaultFrameViewModel {
        constructor() {
            this.contentViewName = "default-contentView";
            appViewManager.subscribe(this);
        }

        dispose() {
            appViewManager.unSubscrible();

            if (this._webViewCtrl) {
                WinJS.Utilities.empty(this._webViewCtrl);
            }

            let root = document.getElementById("_defaultRoot");
            if (root) {
                WinJS.Utilities.empty(root);
            }
        }

        setWebView(webViewCtrl) {
            this._webViewCtrl = webViewCtrl;
        }

        createWebView() {
            if (!this._webViewCtrl) {
                let webViewCtrl = document.createElement('x-ms-webview');

                if (CloudExperienceHost.Environment.getPlatform() === CloudExperienceHost.TargetPlatform.XBOX) {
                    webViewCtrl.addEventListener("MSWebViewDOMContentLoaded", function () {
                        webViewCtrl.invokeScriptAsync("eval", "navigator.gamepadInputEmulation = \"keyboard\";").start();
                    });
                }

                webViewCtrl.style.height = "100%";
                webViewCtrl.style.width = "100%";
                webViewCtrl.setAttribute("aria-hidden", "true");

                if (CloudExperienceHost.FeatureStaging.isOobeFeatureEnabled("CustomDefaultFrameSizing")) {
                    let frameMargin = CloudExperienceHost.getNavMesh ? CloudExperienceHost.getNavMesh().getFrameStyleMargin() : null;
                    if (frameMargin != null) {
                        webViewCtrl.style.margin = frameMargin;
                    }
                    let frameHeight = CloudExperienceHost.getNavMesh ? CloudExperienceHost.getNavMesh().getFrameStyleHeight() : null;
                    if (frameHeight != null) {
                        webViewCtrl.style.height = frameHeight;
                    }
                    let frameWidth = CloudExperienceHost.getNavMesh ? CloudExperienceHost.getNavMesh().getFrameStyleWidth() : null;
                    if (frameWidth != null) {
                        webViewCtrl.style.width = frameWidth;
                    }
                }

                this._webViewCtrl = webViewCtrl;
            }
            return this._webViewCtrl;
        }

        getView() {
            return document.getElementById('_view');
        }

        getContentViewBoundingRect() {
            return this.getView().getBoundingClientRect();
        }

        getFrameViewBoundingRect() {
            return this.getView().getBoundingClientRect();
        }

        getChromeFooterOffset() {
            return { x: 0, y: 0 };
        }

        update(updateType, completeDispatch, errorDispatch) {
            let progressControl = document.getElementById("_progress");
            let progressText = document.getElementById("_progressText");
            let progressElement = document.getElementsByTagName("default-progress")[0];
            let view = this.getView();

            switch (updateType) {
                case CloudExperienceHost.FrameViewModelUpdateType.Progress:
                    const displayStyle = "block";
                    progressElement.removeAttribute("aria-hidden");
                    progressControl.removeAttribute("aria-hidden");
                    progressText.removeAttribute("aria-hidden");

                    if (this._webViewCtrl) {
                        this._webViewCtrl.setAttribute("aria-hidden", "true");
                    }
                    progressElement.style.display = displayStyle;
                    WinJS.UI.Animation.crossFade(progressElement, view).done(() => {
                        progressElement.style.display = displayStyle;
                        progressText.focus();

                        this._progressTextTimerID = setTimeout(function () {
                            progressText.textContent = progressText.textContent
                        }, 3000);

                        completeDispatch();
                    }, errorDispatch);
                    break;
                case CloudExperienceHost.FrameViewModelUpdateType.View:
                    progressElement.setAttribute("aria-hidden", "true");
                    progressControl.setAttribute("aria-hidden", "true");
                    progressText.setAttribute("aria-hidden", "true");

                    if (this._webViewCtrl) {
                        this._webViewCtrl.removeAttribute("aria-hidden");

                        if (!document.activeElement || (document.activeElement == document.body)) {
                            this._webViewCtrl.focus();
                        }
                    }

                    if (this._progressTextTimerID) {
                        clearTimeout(this._progressTextTimerID);
                        this._progressTextTimerID = null;
                    }

                    WinJS.UI.Animation.crossFade(view, progressElement).done(() => {
                        progressElement.style.display = "none"; // hide the progress element completely
                        completeDispatch();
                    }, errorDispatch);
                    break;
                case CloudExperienceHost.FrameViewModelUpdateType.Dimmed:
                    if (this._progressTextTimerID) {
                        clearTimeout(this._progressTextTimerID);
                        this._progressTextTimerID = null;
                    }
                    progressText.blur();
                    completeDispatch();
                    break;
                case CloudExperienceHost.FrameViewModelUpdateType.Undimmed:
                    completeDispatch();
                    break;
            }
        }
    }
    return DefaultFrameViewModel;
});
