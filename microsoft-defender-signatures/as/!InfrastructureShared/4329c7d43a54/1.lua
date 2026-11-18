-- Threat: !InfrastructureShared
-- Name: 4329c7d43a54
-- Type: 21

if not mp.get_mpattribute("MpIsExhaustiveScriptScan") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
