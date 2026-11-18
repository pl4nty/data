-- Threat: !InfrastructureShared
-- Name: 9b291b457102
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
