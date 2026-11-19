-- Threat: !InfrastructureShared
-- Name: 4929a9b42a5e
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
