-- Threat: !InfrastructureShared
-- Name: 1a294a6f54e8
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("//MpIsExhaustiveScriptScan")
end
return mp.INFECTED
