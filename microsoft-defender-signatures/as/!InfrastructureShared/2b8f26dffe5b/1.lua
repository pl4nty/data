-- Threat: !InfrastructureShared
-- Name: 2b8f26dffe5b
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
