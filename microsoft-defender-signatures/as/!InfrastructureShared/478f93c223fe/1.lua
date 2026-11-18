-- Threat: !InfrastructureShared
-- Name: 478f93c223fe
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") and mp.get_mpattribute("MpExcelFormulaRoutines") and mp.get_mpattribute("RPF:XlsWorksheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
