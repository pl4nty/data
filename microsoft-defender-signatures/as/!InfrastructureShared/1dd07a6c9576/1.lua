-- Threat: !InfrastructureShared
-- Name: 1dd07a6c9576
-- Type: 21

if mp.get_mpattribute("BM_OLE_FILE") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
