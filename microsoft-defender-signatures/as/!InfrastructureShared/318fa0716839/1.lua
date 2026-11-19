-- Threat: !InfrastructureShared
-- Name: 318fa0716839
-- Type: 21

if mp.get_mpattribute("BM_OLE_FILE") and mp.get_mpattribute("RPF:XlsMacroSheetHidden") then
  return mp.INFECTED
end
return mp.CLEAN
