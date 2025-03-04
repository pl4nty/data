import * as testFx from '@microsoft/azureportal-test';
import { TestSupport } from '../Utils/TestSupport';
import until = testFx.until;
import { MangedIdentityBlade, command } from '../Utils/Constants';
import { providerName, subscriptionId, resourceGroupName, Timeout , subscriptionLabel} from '../Utils/Constants';
import assert = require('assert');
import { Blades, Logger, Views } from '@microsoft/azureportal-test';

describe('Test Managed Identity', function () {
	this.timeout(0);
	const testSupport = new TestSupport(this);
	var managedIdentityBlade: Blades.MenuBlade;
	let chsmName = MangedIdentityBlade.chsmName;
	let msiName = MangedIdentityBlade.msiName;
	let resourceId = `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/${providerName}/${chsmName}`;

	before(async () => {
		Logger.default.information('Before started');
		testSupport.initializePortalContext();
		managedIdentityBlade = await openMenuBlade(MangedIdentityBlade.title, chsmName, resourceId, 'Managed Identity');
		await testFx.portal.wait(
			testFx.until.isPresent(testFx.portal.blade({ title: MangedIdentityBlade.title })),
			testSupport.waitTimeout,
		);
		Logger.default.information('Before completed');
	});

	it('Add Managed Identity', async () => {
		const userAssignedIdentity = managedIdentityBlade.element(testFx.Controls.OptionsGroupField, {
			label: MangedIdentityBlade.userAssignedIdentityLable,
		});
		userAssignedIdentity.click();
		managedIdentityBlade.waitUntilLoaded();
		const uami = managedIdentityBlade.element(testFx.Controls.Button, { text: MangedIdentityBlade.selectUserAssignedIdentityButton });
		uami.click();
		managedIdentityBlade.waitUntilLoaded();
		const subscriptionGroupDropDown = managedIdentityBlade.element(testFx.Controls.GroupDropDownField, {
			label: subscriptionLabel,
		});
		await subscriptionGroupDropDown.selectOptionsByText([subscriptionId]);
		managedIdentityBlade.waitUntilLoaded();
		const msiResourceDropDown = managedIdentityBlade.element(testFx.Controls.GroupDropDownField, {
			label: MangedIdentityBlade.userAssignedIdentitySelectionLabel,
		});
		await msiResourceDropDown.selectOptionByText(MangedIdentityBlade.msiName);
		managedIdentityBlade.waitUntilLoaded();
		const addButton = managedIdentityBlade.element(testFx.Controls.Button, { text: command.add });
		addButton.click();
		managedIdentityBlade.waitUntilLoaded();
		const saveButton = managedIdentityBlade.element(testFx.Controls.Button, { text: command.save });
		saveButton.click();
		managedIdentityBlade.waitUntilLoaded();
		const notification = testFx.portal.element(testFx.Notifications.NotificationsPane);
		await notification.waitForNewNotification(
			`Added the user assigned managed identity '${msiName}' to the resource '${chsmName}'.`,
			`The user assigned identity '${msiName}' has been successfully added to the resource '${chsmName}'.`,
			Timeout.DeploymentTimeout,
		);
	});

	it('Delete Managed Identity', async () => {
		const noIdentity = managedIdentityBlade.element(testFx.Controls.OptionsGroupField, {
			label: MangedIdentityBlade.noIdentityLable,
		});
		noIdentity.click();
		managedIdentityBlade.waitUntilLoaded();
		const saveButton = managedIdentityBlade.element(testFx.Controls.Button, { text: command.save });
		saveButton.click();
		managedIdentityBlade.waitUntilLoaded();
		const notification = testFx.portal.element(testFx.Notifications.NotificationsPane);
		await notification.waitForNewNotification(
			`Removed the user assigned managed identity '${msiName}' from the resource '${chsmName}'.`,
			`The user assigned identity '${msiName}' has been successfully removed from the resource '${chsmName}'.`,
			Timeout.DeploymentTimeout,
		);
	});

	afterEach(function () {
		if (this.currentTest.state === 'failed') {
			return testSupport.gatherTestFailureDetails(this.currentTest.title);
		}
	});

	after(async () => {
		await testFx.portal.quit();
	});

	async function openMenuBlade(bladeTitle: string, resourceName: string, resourceId: string, menuBladeName: string) {
		const resourceBlade = await testFx.portal.openResourceBlade(resourceId, `${resourceName}`);
		await resourceBlade.waitUntilBladeAndAllTilesLoaded({ postWaitDelay: 2000 });
		const url = await testFx.portal.getCurrentUrl();
		Logger.default.information(`Current URL: ${url}`);
		await resourceBlade.openMenuItem(menuBladeName);
		const blade = testFx.portal.view({ title: bladeTitle, viewType: Views.ReactView });
		await blade.waitUntilLoaded(Timeout.ElementValidationTimeout);
		assert(await blade.isDisplayed(), `${menuBladeName} view still not visible after clicking menu item`);
		Logger.default.information(`${menuBladeName} opened`);
		return blade.asType(Blades.MenuBlade);
	}
});
