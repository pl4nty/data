import * as testFx from '@microsoft/azureportal-test';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

export class Label extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-Label');
	}
}
