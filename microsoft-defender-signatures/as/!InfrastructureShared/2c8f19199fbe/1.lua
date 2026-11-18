-- Threat: !InfrastructureShared
-- Name: 2c8f19199fbe
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
