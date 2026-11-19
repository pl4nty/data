-- Threat: !InfrastructureShared
-- Name: 1a2961021943
-- Type: 21

if not mp.get_mpattribute("MpIsExhaustiveScriptScan") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
