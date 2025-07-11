
"use strict";

define(['autopilot/commercialDiagnosticsUtilities'], (commercialDiagnosticsUtilities) => {
    class bootstrapStatusSubcategoryViewModel {
        constructor(
            resourceStrings, // [optional] resource strings
            sessionUtilities, // [optional] session utilities
            id, // [mandatory] subcategory ID (not displayed)
            title, // [mandatory] Title is mandatory, even for silent subcategories.
            isParallelizableAction, // is subcategory action parallelizable with its immediate predecessor and successor?
            getDispositionAction, // callback returning subcategory's disposition (e.g., visible, silent, etc.)
            asyncAction) {  // subcategory action

            this.resourceStrings = resourceStrings;
            this.sessionUtilities = sessionUtilities;
            this.commercialDiagnosticsUtilities = new commercialDiagnosticsUtilities();
            this.asyncAction = asyncAction;
            this.id = id;
            this.title = title;
            this.getDispositionAction = getDispositionAction;
            this.actionIsParallelizable = isParallelizableAction;
            this.actionResult = {
                actionSucceeded: false,
                statusMessage: null
            };
            this.asyncActionPromise = null;
            this.asyncActionPromiseCancelled = false;
            this.setSubcategoryStateCallbackAsync = null;

            let invalidParameter = null;
            if (null === title) {
                invalidParameter = "title";
            } else if (null === getDispositionAction) {
                invalidParameter = "getDispositionAction";
            } else if (null === asyncAction) {
                invalidParameter = "asyncAction";
            }

            if (invalidParameter !== null) {
                throw this.commercialDiagnosticsUtilities.formatMessage(`Invalid value for bootstrapStatusSubcategoryViewModel constructor parameter '${invalidParameter}'.`);
            }
        }



        getId() {
            return this.id;
        }

        getTitle() {
            return this.title;
        }

        isParallelizableAction() {
            return this.actionIsParallelizable;
        }

        setUiElement(uiElement) {
            this.uiElement = uiElement;
        }

        getUiElement() {
            return this.uiElement;
        }

        getActionResult() {
            return this.actionResult;
        }

        getDisposition() {
            return this.getDispositionAction();
        }

        startActionAsync(progressCallbackAsync, setSubcategoryStateCallbackAsync) {
            return new WinJS.Promise((completeDispatch, errorDispatch, progressDispatch) => {

                return setSubcategoryStateCallbackAsync(this.sessionUtilities.SUBCATEGORY_STATE_IN_PROGRESS).then(() => {
                    return this.sessionUtilities.startPhaseStateMachineAsync(
                        this.id,
                        this.sessionUtilities.ESP_COMMAND_PHASE_NAME_PREACTION,
                        () => {
                            return this.asyncAction(progressCallbackAsync).then((result) => {
                                return this.sessionUtilities.startPhaseStateMachineAsync(
                                    this.id,
                                    this.sessionUtilities.ESP_COMMAND_PHASE_NAME_POSTACTION,
                                    () => {
                                        if (!this.asyncActionPromiseCancelled) {
                                            return setSubcategoryStateCallbackAsync(result.actionResultState).then(() => {
                                                this.actionResult = result;
                                                completeDispatch(this.actionResult);

                                                return WinJS.Promise.as(true);
                                            });
                                        }

                                        return WinJS.Promise.as(true);
                                    },
                                    (actionResultToUse) => {
                                        this.actionResult = actionResultToUse;

                                        return setSubcategoryStateCallbackAsync(this.actionResult.actionResultState).then(() => {
                                            completeDispatch(this.actionResult);

                                            return WinJS.Promise.as(true);
                                        });
                                    }
                                );
                            });
                        },
                        (actionResultToUse) => {
                            this.actionResult = actionResultToUse;

                            return setSubcategoryStateCallbackAsync(this.actionResult.actionResultState).then(() => {
                                completeDispatch(this.actionResult);

                                return WinJS.Promise.as(true);
                            });
                        }
                    )
                });
            },
            () => {
                this.asyncActionPromiseCancelled = true;

                this.actionResult = this.sessionUtilities.createActionResult(
                    this.sessionUtilities.SUBCATEGORY_STATE_FAILED,
                    this.resourceStrings["BootstrapPageStatusFailed"]);

                this.commercialDiagnosticsUtilities.logInfoEvent(
                    `CommercialOOBE_BootstrapStatusSubcategory_${this.getTitle()}_Cancelled`,
                    `Subcategory status: ${this.getTitle()} is cancelled.`);
                this.asyncActionPromise.cancel();

                return setSubcategoryStateCallbackAsync(this.sessionUtilities.SUBCATEGORY_STATE_CANCELLED);
            });
        }
    }

    return bootstrapStatusSubcategoryViewModel;
});
