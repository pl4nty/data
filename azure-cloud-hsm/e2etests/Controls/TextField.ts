import * as testFx from '@microsoft/azureportal-test';
import { Label } from './Label';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

export class TextField extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-TextField-field');
	}

	public input(): testFx.PortalElement {
		return this.element(By.css('input'));
	}

	public async isDisabled(): Promise<boolean> {
		return await this.hasClass('is-disabled');
	}

	public async label(): Promise<string> {
		const label = this.element(Label);
		return await label.getText();
	}

	public async value(): Promise<string> {
		const input = this.input();
		return await input.getAttribute('value');
	}

	public async sendKeys(...var_args: string[]): Promise<void> {
		const input = this.input();
		return await input.sendKeys(...var_args);
	}

	public async clear(): Promise<void> {
		const input = this.input();
		return await input.clear();
	}

	public async clearAllText(): Promise<void> {
		const input = this.input();
		await input.sendKeys(testFx.Key.CONTROL, 'A', testFx.Key.NULL, testFx.Key.DELETE);
	}
}
