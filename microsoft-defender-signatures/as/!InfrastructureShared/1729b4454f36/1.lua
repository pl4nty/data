-- Threat: !InfrastructureShared
-- Name: 1729b4454f36
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("//MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
