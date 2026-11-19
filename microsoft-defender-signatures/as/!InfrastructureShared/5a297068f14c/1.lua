-- Threat: !InfrastructureShared
-- Name: 5a297068f14c
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
