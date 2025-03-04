import { add } from "nconf";

export const deleteLabel = "Delete";
export const nextButtonLabel = "Next";
export const regionName = "Central US EUAP";
export const deletionTitle = "Executed delete command";
export const deletionMessage = "Executed delete command on";
export const createButtonLabel = "Create";
export const subscriptionLabel = "Subscription";
export const resourceGroupLabel = "Resource group";
export const regionLabel = "Region";
export const nameLabel = "Name";
export const providerName = "Microsoft.HardwareSecurityModules/cloudHsmClusters";

export namespace CreateBlade {
    export const uri = "view/Microsoft_Azure_CloudHSM/CreateCloudHSM_dx";
    export const title = "Create Azure Cloud HSM";
    export const cloudhsmName = "chsmE2E";
}

export const subscriptionName = "Cloud Security Management Plane Dev";
export const subscriptionId = "dfa259d7-270a-46b7-b73d-d659947dc8be"
export const resourceGroupName = "Azure-CloudHSM-E2E-Test-RG";
export const rpProviderName = "Microsoft.HardwareSecurityModules";
export const resourceType = "cloudHsmClusters";
export const resourceName = "e2e-test-dont-terminate";
export const resourceId = `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/${rpProviderName}/${resourceType}/${resourceName}`;

export namespace TagsBlade {
    export const title = `${resourceName} | Tags`;
}

export namespace NetworkingBlade {
    export const title = `${resourceName} | Networking`;
    export const createNetworkRegion = "UK West";
}

export namespace MangedIdentityBlade{
	export const title = `chsm-e2e-uami-test | Managed Identity`;
	export const msiName = 'test-e2e-uami';
	export const chsmName = 'chsm-e2e-uami-test';
	export const noIdentityLable = 'No identity';
	export const userAssignedIdentityLable = 'User-assigned identity';
	export const selectUserAssignedIdentityButton = 'Select a user-assigned Identity';
	export const userAssignedIdentitySelectionLabel = 'User assigned managed identities';
}

export class Timeout {
	public static readonly Default = 30 * 1000;
	public static readonly BladeLoadTimeout = 2 * 60 * 1000;
	public static readonly ElementLoadTimeout = 3 * 1000;
	public static readonly ValidationTimeout = 4 * 1000;
	public static readonly ElementValidationTimeout = 5 * 1000;
	public static readonly BladePostWaitDelay = 10 * 1000; 
	public static readonly DeploymentTimeout = 15 * 60 * 1000; 
}


export const command = {
	// CHSM commands
	approve: 'Approve',
	create: 'Create',
	refresh: 'Refresh',
	reject: 'Reject',
	separator: '',
	remove: 'Remove',
	deleteAll: 'Delete all',
	feedback: 'Feedback',
	save : 'Save',
	add: 'Add'
};
