-- Threat: !InfrastructureShared
-- Name: 3d7873c5f71a
-- Type: 21

if mp.get_mpattribute("HSTR:Virus:Win64/Expiro.HNX!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
