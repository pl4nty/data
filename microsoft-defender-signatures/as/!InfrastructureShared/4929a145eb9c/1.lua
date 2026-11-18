-- Threat: !InfrastructureShared
-- Name: 4929a145eb9c
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
