-- Threat: !InfrastructureShared
-- Name: 6a8fea1a2045
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("RPF:XlsAbnormalSheetStateBits") or mp.get_mpattribute("RPF:XlsWorksheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
