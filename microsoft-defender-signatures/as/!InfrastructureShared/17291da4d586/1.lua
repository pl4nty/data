-- Threat: !InfrastructureShared
-- Name: 17291da4d586
-- Type: 21

if not mp.get_mpattribute("MpIsExhaustiveScriptScan") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
