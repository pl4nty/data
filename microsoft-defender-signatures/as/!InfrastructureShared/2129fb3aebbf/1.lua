-- Threat: !InfrastructureShared
-- Name: 2129fb3aebbf
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("//MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
