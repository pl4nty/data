-- Threat: !InfrastructureShared
-- Name: 18299fa803b4
-- Type: 21

if mp.get_mpattribute("InEmail") then
  mp.set_mpattribute("//MpIsExhaustiveScriptScan")
end
return mp.INFECTED
