-- Threat: !InfrastructureShared
-- Name: 7029dd6e2c38
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
