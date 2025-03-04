import * as testFx from '@microsoft/azureportal-test';
import { ElementArrayFinder } from '@microsoft/azureportal-test';

const By = testFx.Locators.By;
const PortalElement = testFx.PortalElement;

class DetailsListColumn extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-DetailsHeader-cellName');
	}
}

export class DetailsListHeader extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.css('.ms-DetailsHeader');
	}

	public async check(): Promise<void> {
		// Checkbox
		try {
			const checkbox = this.element(By.className('ms-Check'));
			await checkbox.click();
		} catch (e) {
			testFx.Logger.default.warning(`DetailsListHeader: check(): Checkbox click failed. Exception(${e})`);
		}
	}
}

class DetailsListCell extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.css('.ms-DetailsRow-fields > .ms-DetailsRow-cell');
	}

	public async value(): Promise<string> {
		// Link
		try {
			const button = this.element(By.css('button'));
			return await button.getText();
		} catch (e) {
			testFx.Logger.default.warning(`DetailsList: DetailsListCell: value(): Button Exception(${e})`);
		}

		// Text/Span
		try {
			const span = this.element(By.css('span'));
			return await span.getText();
		} catch (e) {
			testFx.Logger.default.warning(`DetailsList: DetailsListCell: value(): Span Exception(${e})`);
		}

		// Input
		try {
			const input = this.element(By.css('input'));
			return await input.getAttribute('value');
		} catch (e) {
			testFx.Logger.default.warning(`DetailsList: DetailsListCell: value(): Input Exception(${e})`);
		}

		try {
			return await this.getText();
		} catch (e) {
			throw new Error(
				`DetailsListCell: Unsupported cell type. Update test code to support this type of cell. Exception(${e})`,
			);
		}
	}

	public click(): Promise<void> {
		// Link
		try {
			const button = this.element(By.css('button'));
			return button.click();
		} catch {}

		return super.click();
	}
}

export class DetailsListRow extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-DetailsRow');
	}

	public cells(): ElementArrayFinder<DetailsListCell> {
		return this.all(DetailsListCell);
	}

	public async textForColumn(columnIndex: number): Promise<string> {
		const text = await this.getText();
		const values = text.split('\n');
		return values[columnIndex];
	}
}

export class DetailsList extends PortalElement {
	public get locator(): testFx.Locators.Locator {
		return By.className('ms-DetailsList');
	}

	public rows(): ElementArrayFinder<DetailsListRow> {
		return this.all(DetailsListRow);
	}

	public columns(): ElementArrayFinder<DetailsListColumn> {
		return this.all(DetailsListColumn);
	}

	public async hasColumns(columnNames: string[]): Promise<boolean> {
		testFx.Logger.default.information(`DetailsList: Searching for columns(${columnNames.join()})`);
		const allColumns = await this.columns();

		for (const columnName of columnNames) {
			let found = false;

			for (const column of allColumns) {
				const name = await column.getText();

				if (name === columnName) {
					found = true;
					break;
				}
			}

			if (!found) {
				testFx.Logger.default.information(`DetailsList: Unable to find column '${columnName}'`);
				return false;
			}
		}

		testFx.Logger.default.information(`All columns(${columnNames.join()}) found`);
		return true;
	}

	public async getCell(
		rowId: { column: string; value: string },
		columnId: { column: string; value: string },
		partialMatch?: boolean,
	): Promise<DetailsListCell> {
		testFx.Logger.default.information(
			`DetailsList: Searching - RowId: (column: ${rowId.column}, value: ${rowId.value}), Cell: (column: ${columnId.column}, value: ${
				columnId.value
			}), partialMatch: ${!!partialMatch}`,
		);
		const cols = await this.columns();
		let rowIdColIdx = -1;
		let cellColIdx = -1;

		for (let i = 0; i < cols.length; i++) {
			const colText = await cols[i].getText();

			if (colText === rowId.column) {
				rowIdColIdx = i;
			}

			if (colText === columnId.column) {
				cellColIdx = i;
			}
		}

		if (rowIdColIdx === -1 || cellColIdx === -1) {
			throw new Error(
				`DetailsList: COLUMNS NOT FOUND - RowId: (column: ${rowId.column}, value: ${rowId.value}), Cell: (column: ${
					columnId.column
				}, value: ${columnId.value}), partialMatch: ${!!partialMatch}`,
			);
		}

		const listRows = await this.rows();

		for (let i = 0; i < listRows.length; i++) {
			const cells = await listRows[i].cells();
			const keyValue = await cells[rowIdColIdx].value();
			const cellValue = await cells[cellColIdx].value();

			if (
				(partialMatch ? keyValue.indexOf(rowId.value) !== -1 : keyValue === rowId.value) &&
				(partialMatch ? cellValue.indexOf(columnId.value) !== -1 : columnId.value === cellValue)
			) {
				testFx.Logger.default.information(
					`DetailsList: FOUND - RowId: (column: ${rowId.column}, value: ${rowId.value}), Cell: (column: ${
						columnId.column
					}, value: ${columnId.value}), partialMatch: ${!!partialMatch}`,
				);
				return cells[cellColIdx];
			}
		}

		throw new Error(
			`DetailsList: VALUE NOT FOUND - RowId: (column: ${rowId.column}, value: ${rowId.value}), Cell: (column: ${
				columnId.column
			}, value: ${columnId.value}), partialMatch: ${!!partialMatch}`,
		);
	}

	public async clickCell(
		rowId: { column: string; value: string },
		columnId: { column: string; value: string },
		partialMatch?: boolean,
	): Promise<void> {
		const selectedCell = await this.getCell(rowId, columnId, partialMatch);
		await selectedCell.click();
		testFx.Logger.default.information(
			`Cell([${rowId.column}, ${rowId.value}][${columnId.column}, ${columnId.value}]) clicked`,
		);
	}

	public async getCellByRowAndColumnIdx(rowIdx: number, columnIdx: number): Promise<DetailsListCell> {
		const listRows = await this.rows();

		const rowCells = await listRows[rowIdx].cells();
		const cellValue = await rowCells[columnIdx].value();
		if (!cellValue) {
			throw new Error(`DetailsList: NODE VALUE NOT FOUND - RowId: ${rowIdx}, ColId: ${columnIdx}`);
		}

		return rowCells[columnIdx];
	}

	public async clickCellByRowAndColumnIdx(rowIdx: number, columnIdx: number): Promise<void> {
		const selectedCell = await this.getCellByRowAndColumnIdx(rowIdx, columnIdx);
		await selectedCell.click();
		testFx.Logger.default.information(`Cell([${rowIdx}][${columnIdx}]) clicked`);
	}

	public async cellColumnValuesAreNonEmptyStrings(columnIdx: number): Promise<boolean> {
		const listRows = await this.rows();

		for (let currRowIdx = 0; currRowIdx < listRows.length; currRowIdx++) {
			const cells = await listRows[currRowIdx].cells();
			const cellValue = await cells[columnIdx].value();
			if (!cellValue) {
				throw new Error(`DetailsList: NODE VALUE NOT FOUND - RowId: ${currRowIdx}, ColId: ${columnIdx}`);
			}
		}

		return true;
	}

	public async findRowIndexWithLabel(resourceName: string, findLabelInColumnIndex: number): Promise<number> {
		const gridRows = await this.rows();
		testFx.Logger.default.information('Total gridRows found: ' + gridRows.length);
		for (let index = 0; index < gridRows.length; index++) {
			const cellLabel = await this.getCellByRowAndColumnIdx(index, findLabelInColumnIndex);
			const cellText = await cellLabel.getText();
			if (cellText === resourceName) {
				return index;
			}
		}
		return -1;
	}

	public async rowsWithLabel(resourceName: string, findLabelInColumnIndex: number): Promise<DetailsListRow[]> {
		const gridRows = await this.rows();
		testFx.Logger.default.information('Total gridRows found: ' + gridRows.length);
		return await asyncFilter(gridRows, async (row) => {
			const cellLabels = (await row.getText()).split('\n');
			return cellLabels[findLabelInColumnIndex] === resourceName;
		});
	}

	public async findAndSelectRow(options: {
		rowText: string;
		findLabelInColumnIndex: number;
		checkboxColumnIndex: number;
	}): Promise<boolean> {
		const rowIndex = await this.findRowIndexWithLabel(options.rowText, options.findLabelInColumnIndex);
		if (rowIndex > -1) {
			await this.clickCellByRowAndColumnIdx(rowIndex, options.checkboxColumnIndex);
			return true;
		}
		return false;
	}
}

async function asyncFilter<T>(arr: T[], predicate: (value: T) => Promise<boolean>): Promise<T[]> {
	const results = await Promise.all(arr.map(predicate));
	return arr.filter((_, index) => results[index]);
}
