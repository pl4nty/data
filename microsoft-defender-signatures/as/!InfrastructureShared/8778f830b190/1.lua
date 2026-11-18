-- Threat: !InfrastructureShared
-- Name: 8778f830b190
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
