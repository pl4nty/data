-- Threat: !InfrastructureShared
-- Name: 8540f0fff560
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
