-- Threat: !InfrastructureShared
-- Name: 2529b114eaa5
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.INFECTED
