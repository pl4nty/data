-- Threat: !InfrastructureShared
-- Name: 9a2902f556d7
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
