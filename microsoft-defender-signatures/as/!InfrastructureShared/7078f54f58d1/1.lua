-- Threat: !InfrastructureShared
-- Name: 7078f54f58d1
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
