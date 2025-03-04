import * as testFx from '@microsoft/azureportal-test';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

export class Button extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-Button');
	}

	public async isDisabled(): Promise<boolean> {
		return await this.hasClass('is-disabled');
	}
}
