-- Threat: !InfrastructureShared
-- Name: 25296a9441a8
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("//MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
