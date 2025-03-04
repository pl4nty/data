import { Locators, portal, Views } from '@microsoft/azureportal-test';
import { Button, CommandBar} from '../Controls/ReactControls';
import { Timeout } from '../Utils/Constants';


const loadingText= 'Loading...';

export class ReactViewBlade extends Views.ReactView {
	private async waitUntilLoadingTextIsGone(timeout = Timeout.BladeLoadTimeout) {
		await portal.wait(
			async () => {
				try {
					const loadingMessage = await this.find(Locators.By.css('p'));

					if (
						(await loadingMessage.isDisplayed()) &&
						(await loadingMessage.getText()).includes(loadingText)
					) {
						return false;
					}
				} catch (e) {
					return false;
				}

				return true;
			},
			timeout,
			`Loading text is still visible`,
		);
	}

	public async waitUntilReactViewBladeLoaded({
		hasLoadingText = false,
		timeout = Timeout.BladeLoadTimeout,
	} = {}): Promise<this> {
		await super.waitUntilLoaded(timeout);
		if (hasLoadingText) {
			await this.waitUntilLoadingTextIsGone(timeout);
		}

		return this;
	}


	public async getCommandBarItems(commandBarIndex: number) {
		const commandBars = await this.findAll(CommandBar);
		if (commandBars.length <= commandBarIndex) {
			throw new Error('Cannot find command bar');
		} else {
			return commandBars[commandBarIndex].commands();
		}
	}

	public async clickCommand(commandBarIndex: number, commandName: string, partialMatch?: boolean) {
		const commands = await this.getCommandBarItems(commandBarIndex);
		let command: Button;
		for (const c of commands) {
			const name = await c.getText();
			if (partialMatch ? name.includes(commandName) : name === commandName) {
				command = c;
				break;
			}
		}

		if (!command) {
			throw new Error(`Cannot find command with name ${commandName}`);
		} else {
			await command.click();
		}
	}
}
