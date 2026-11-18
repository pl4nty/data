-- Threat: !InfrastructureShared
-- Name: 498f5a273386
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") and mp.get_mpattribute("MpExcelFormulaRoutines") and mp.get_mpattribute("RPF:XlsWorksheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
