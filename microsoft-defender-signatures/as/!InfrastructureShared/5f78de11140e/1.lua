-- Threat: !InfrastructureShared
-- Name: 5f78de11140e
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
