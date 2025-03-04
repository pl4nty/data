import * as testFx from '@microsoft/azureportal-test';
import { Timeout } from '../Utils/Constants';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

export class CheckBox extends PortalElement {
	private input = this.element(By.tagName('input'));
	private label = this.element(By.tagName('label'));

	public get locator(): testFx.Locators.Locator {
		return By.className('ms-Check');
	}

	public async setChecked(value: boolean): Promise<void> {
		const currentValue = await this.isChecked();
		if (currentValue !== value) {
			await testFx.portal.wait(
				async () => {
					const disabled = await this.isDisabled();
					if (disabled) {
						throw new Error('Checkbox is disabled');
					} else {
						return true;
					}
				},
				Timeout.ElementLoadTimeout,
				"Can't toggle checkbox",
			);
			await this.label.click();
		}
	}

	public async isChecked(): Promise<boolean> {
		const checked = await this.input.getAttribute('checked');
		return checked === 'true';
	}

	public async isDisabled(): Promise<boolean> {
		const disabled = await this.input.getAttribute('disabled');
		return !testFx.Utils.String.isNullOrEmptyOrUndefined(disabled);
	}
}
