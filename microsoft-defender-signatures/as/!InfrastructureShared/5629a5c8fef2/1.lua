-- Threat: !InfrastructureShared
-- Name: 5629a5c8fef2
-- Type: 21

if not mp.get_mpattribute("MpIsExhaustiveScriptScan") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
