-- Threat: !InfrastructureShared
-- Name: 378f4296e8ee
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") and mp.get_mpattribute("MpExcelFormulaRoutines") and mp.get_mpattribute("RPF:XlsWorksheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
