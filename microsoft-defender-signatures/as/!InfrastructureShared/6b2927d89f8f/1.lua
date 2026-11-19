-- Threat: !InfrastructureShared
-- Name: 6b2927d89f8f
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
