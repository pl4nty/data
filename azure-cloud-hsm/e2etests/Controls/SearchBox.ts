import { TextField } from './TextField';
import * as testFx  from '@microsoft/azureportal-test';

const By = testFx.Locators.By;

export class SearchBox extends TextField {
    public get locator(): testFx.Locators.Locator {
        return By.className('ms-SearchBox');
    }
}
