-- Threat: !InfrastructureShared
-- Name: 4529b6ff4416
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
