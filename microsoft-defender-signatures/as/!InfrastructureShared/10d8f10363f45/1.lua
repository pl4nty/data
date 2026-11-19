-- Threat: !InfrastructureShared
-- Name: 10d8f10363f45
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") and mp.get_mpattribute("MpExcelFormulaRoutines") and mp.get_mpattribute("RPF:XlsAbnormalSheetStateBits") and mp.get_mpattribute("RPF:XlsWorksheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
