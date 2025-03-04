import * as testFx from '@microsoft/azureportal-test';
import { TestSupport } from './Utils/TestSupport';
import {
	resourceId,
	resourceName,
	TagsBlade,
	Timeout,
	command
} from './Utils/Constants';
import { Blades, Logger } from '@microsoft/azureportal-test';
import { Views } from '@microsoft/azureportal-test';
import assert = require('assert');

describe('On the Tags Blade', function () {
	this.timeout(0);
	const testSupport = new TestSupport(this);
	var tagsBlade: Blades.MenuBlade;
	before(async () => {
		Logger.default.information('Before started');
		testSupport.initializePortalContext();
		tagsBlade = await openTagsBlade(TagsBlade.title, resourceName, resourceId);
		await testFx.portal.wait(
			testFx.until.isPresent(testFx.portal.blade({ title: TagsBlade.title })),
			testSupport.waitTimeout,
		);
		Logger.default.information('Before completed');
	});
	after(async () => {
		await testFx.portal.quit();
	});
	afterEach(function () {
		if (this.currentTest.state === 'failed') {
			return testSupport.gatherTestFailureDetails(this.currentTest.title);
		}
	});

	specify('Validate command bar items', async () => {
		const expectedCommandBarItems = [
			{ label: command.deleteAll },
			{ label: command.feedback },
		];
		var commandBarItems = await Promise.all((await tagsBlade.findAll(testFx.Commands.CommandBarItem))
			.map(async (el) => {
				return { label: await el.getText() }
			}));

		assert.equal(
			commandBarItems.length,
			expectedCommandBarItems.length,
			'Number of command bar items mismatch.',
		);
		expectedCommandBarItems.sort((a, b) => a.label.localeCompare(b.label));
		commandBarItems.sort((a, b) => a.label.localeCompare(b.label));
		for (let i = 0; i < expectedCommandBarItems.length; i++) {
			assert.equal(commandBarItems[i].label, expectedCommandBarItems[i].label, 'Label mismatch.');
		}
	});


	async function openTagsBlade(bladeTitle: string, resourceName: string, resourceId: string) {
		const resourceBlade = await testFx.portal.openResourceBlade(resourceId, `${resourceName}`);
		await resourceBlade.waitUntilBladeAndAllTilesLoaded({ postWaitDelay: 2000 });
		const url = await testFx.portal.getCurrentUrl();
		Logger.default.information(`Current URL: ${url}`);
		await resourceBlade.openMenuItem("Tags");
		const blade = testFx.portal.view({ title: bladeTitle, viewType: Views.ReactView });
		await blade.waitUntilLoaded(Timeout.ElementValidationTimeout);
		assert(await blade.isDisplayed(), 'TagsBlade view still not visible after clicking menu item');
		Logger.default.information('TagsBlade opened');
		return blade.asType(Blades.MenuBlade);
	}
});
