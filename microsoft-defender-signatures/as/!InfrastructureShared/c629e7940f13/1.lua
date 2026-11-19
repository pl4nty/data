-- Threat: !InfrastructureShared
-- Name: c629e7940f13
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Lnk") then
  return mp.INFECTED
end
return mp.CLEAN
