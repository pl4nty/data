import * as testFx from '@microsoft/azureportal-test';
import { Button } from './Button';
import { ElementArrayFinder } from '@microsoft/azureportal-test';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

export class CommandBar extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-CommandBar');
	}

	public commands(): ElementArrayFinder<Button> {
		return this.all(Button);
	}
	public async label(): Promise<string> {
		return await this.getAttribute('aria-label');
	}

	public async findCommand(commandName: string): Promise<Button> {
		const commands = await this.commands();

		for (let i = 0; i < commands.length; i++) {
			const command = await commands[i].getText();
			if (command.includes(commandName)) {
				return commands[i];
			}
		}
		throw new Error(`Fail to find command button : ${commandName}`);
	}

	public async clickCommand(commandName: string): Promise<void> {
		const selectedCommand = await this.findCommand(commandName);
		await selectedCommand.click();
	}
}
