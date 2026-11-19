-- Threat: !InfrastructureShared
-- Name: 352994f6b2c6
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
