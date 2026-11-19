-- Threat: !InfrastructureShared
-- Name: 4e29ef6ce079
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
