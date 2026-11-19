-- Threat: !InfrastructureShared
-- Name: 278f1fb69b05
-- Type: 21

if mp.get_mpattribute("RPF:XlsUnknownSheetVeryHidden") and mp.get_mpattribute("BM_OLE_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
