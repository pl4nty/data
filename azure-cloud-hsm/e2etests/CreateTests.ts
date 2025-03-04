const lodash = require('lodash');
import * as testFx from '@microsoft/azureportal-test';
import { TestSupport } from './Utils/TestSupport';
import {
	subscriptionLabel,
	nameLabel,
	regionLabel,
	nextButtonLabel,
	createButtonLabel,
	regionName,
	resourceGroupLabel,
	deleteLabel,
	deletionTitle,
	deletionMessage,
	CreateBlade,
	providerName,
	subscriptionId,
	subscriptionName,
	resourceGroupName,
	Timeout,
} from './Utils/Constants';
import until = testFx.until;
import assert = require('assert');
import { TagItem } from '@microsoft/azureportal-test/Controls/TagsByResource';

describe('Create Test', function () {
	this.timeout(0);
	const testSupport = new TestSupport(this);
	let chsmName: string;

	before(async () => {
		testSupport.initializePortalContext();
		chsmName = CreateBlade.cloudhsmName + '-' + testSupport.generateUniqueResSuffix();
		testFx.Logger.default.information('Cloud HSM name: ' + chsmName);
	});

	it('Can Create and delete Cloud HSM resource', async () => {
		const resourceId = `/subscriptions/${subscriptionId}/resourcegroups/${resourceGroupName}/providers/${providerName}/${chsmName}`;
		//creating cloud hsm using create Form blade
		await createAzureCloudHsm();
		//deleting cloud hsm using delete button on overview blade
		await deleteAzureCloudHsm(resourceId);
	});

	async function createAzureCloudHsm(): Promise<void> {
		// Create Azure Cloud HSM
		await testFx.portal.navigateToUriFragment(CreateBlade.uri, testFx.Utils.DefaultTimeouts.longTimeout);
		await testFx.portal.wait(
			until.isPresent(testFx.portal.blade({ title: CreateBlade.title })),
			testSupport.waitTimeout,
		);
		var createBlade = testFx.portal.blade({
			title: CreateBlade.title,
		});
		await createBlade.waitUntilLoaded();

		const subscriptionGroupDropDown = createBlade.element(testFx.Controls.GroupDropDownField, {
			label: subscriptionLabel,
		});
		await subscriptionGroupDropDown.selectOptionsByText([subscriptionName]);
		const subState = await subscriptionGroupDropDown.getValidationState();
		testFx.Logger.default.information('subscription validation state:' + subState);

		//fill in resource group field
		const resourceGroupDropDown = createBlade.element(testFx.Controls.GroupDropDownField, {
			label: resourceGroupLabel,
		});
		await resourceGroupDropDown.selectOptionByText(resourceGroupName);
		await resourceGroupDropDown.waitOnValidationState(testFx.Constants.ControlValidationState.valid);
		const resState = await resourceGroupDropDown.getValidationState();
		assert.strictEqual(
			resState,
			testFx.Constants.ControlValidationState.valid,
			'Resource group dropdown validation is not valid',
		);
		// Fill in chsm name field
		const nameText = createBlade.element(testFx.Controls.TextField, { label: nameLabel });
		await nameText.setText(chsmName);
		await nameText.waitOnValidationState(testFx.Constants.ControlValidationState.valid);
		// Fill in region field
		const regionGroupDropDown = createBlade.element(testFx.Controls.GroupDropDownField, { label: regionLabel });
		await regionGroupDropDown.selectOptionsByText([regionName]);
		const regionState = await regionGroupDropDown.getValidationState();
		testFx.Logger.default.information('Region validation state:', regionState);
		await regionGroupDropDown.waitOnValidationState(
			testFx.Constants.ControlValidationState.valid,
			testFx.Utils.DefaultTimeouts.longTimeout,
		);

		// go to tag page. As cloud hsm form has isWizard set to true we cannot go to review + create page directly
		for (let i = 0; i < 3; i++) {
			const nextButton = createBlade.element(testFx.Controls.Button, { text: nextButtonLabel });
			await nextButton.click();
			await createBlade.waitUntilLoaded();
		}

		//fill the tags to use mockHFC
		const tagsControl: testFx.Controls.TagsByResource = await testFx.portal.wait<testFx.Controls.TagsByResource>(
			async () => {
				const tagsControl = createBlade.element(testFx.Controls.TagsByResource);
				if (await tagsControl.isDisplayed()) {
					return tagsControl;
				} else {
					return false;
				}
			},
		);
		const tagToAdd: TagItem = {
			key: 'UseMockHfc',
			value: 'true',
			resources: ['Microsoft.HardwareSecurityModules/cloudHsmClusters'],
		};
		await tagsControl.addTag(tagToAdd.key, tagToAdd.value);
		await testFx.portal.wait(
			async () => {
				const tags = await tagsControl.tags();
				return (
					tags.length === 1 &&
					tags[0].key === tagToAdd.key &&
					tags[0].value === tagToAdd.value &&
					lodash.isEqual(tags[0].resources, tagToAdd.resources)
				);
			},
			null,
			'Tag was not added to the grid',
		);
		// go to the review + create page
		const nextButton = createBlade.element(testFx.Controls.Button, { text: nextButtonLabel });
		await nextButton.click();
		await createBlade.waitUntilLoaded();

		const createButton = createBlade.element(testFx.Controls.Button, { text: createButtonLabel });
		assert(await createButton.isEnabled(), 'Create button is not enabled');
		await createButton.click();
		await createBlade.waitUntilLoaded();

		testFx.Logger.default.information('Waiting for deployment notification...');
		const deploymentDetailsBlade = testFx.portal.view({ viewType: testFx.Views.DeploymentOverview });
		await deploymentDetailsBlade.waitUntilLoaded(testFx.Utils.DefaultTimeouts.urlSettledTimeout);
		await deploymentDetailsBlade.waitForDeploymentCompletion(Timeout.DeploymentTimeout);
		await testFx.portal.wait(
			async () => {
				return testFx.until.isPresent(deploymentDetailsBlade);
			},
			testFx.Utils.DefaultTimeouts.longTimeout,
			'Could not find deployment details blade',
		);
		const deploymentName = (await (deploymentDetailsBlade as testFx.Views.DeploymentOverview).getTitle()).split(' ')[0];
		testFx.Logger.default.information('Deployment title name: ' + deploymentName);
		const deploymentStatus = await deploymentDetailsBlade.find(
			testFx.Locators.By.xpath('//*[@data-testid="deploymentoverview-status"]'),
			testFx.Utils.DefaultTimeouts.timeout,
		);
		const deploymentStatusText = await deploymentStatus.getText();
		assert.strictEqual(deploymentStatusText, 'Your deployment is complete', 'Deployment failed');
		testFx.Logger.default.information('Deployment status: ' + deploymentStatusText);
	}

	async function deleteAzureCloudHsm(resourceId: string): Promise<void> {
		await testFx.portal.openResourceBlade(resourceId + '/overview', chsmName);
		const overviewBlade = testFx.portal.blade({ title: chsmName });
		await overviewBlade.waitUntilBladeAndAllTilesLoaded({ postWaitDelay: testFx.Utils.DefaultTimeouts.longTimeout });

		const deleteButton = await overviewBlade.findCommandBar().getItem(deleteLabel);
		await deleteButton.click();

		const deleteMsgBox = overviewBlade.element(testFx.Controls.MessageBox);
		await deleteMsgBox.clickButton('Yes');

		const notification = testFx.portal.element(testFx.Notifications.NotificationsPane);
		await notification.waitForNewNotification(deletionTitle, `${deletionMessage} '${chsmName}'`, Timeout.DeploymentTimeout);
	}

	afterEach(function () {
		if (this.currentTest.state === 'failed') {
			return testSupport.gatherTestFailureDetails(this.currentTest.title);
		}
	});

	after(async () => {
		await testFx.portal.quit();
	});
});
