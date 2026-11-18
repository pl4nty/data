-- Threat: !InfrastructureShared
-- Name: 14540154e5470
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
