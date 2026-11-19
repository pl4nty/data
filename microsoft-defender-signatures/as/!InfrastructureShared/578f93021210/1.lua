-- Threat: !InfrastructureShared
-- Name: 578f93021210
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
