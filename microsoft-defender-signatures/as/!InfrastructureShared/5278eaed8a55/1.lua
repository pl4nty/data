-- Threat: !InfrastructureShared
-- Name: 5278eaed8a55
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
