-- Threat: !InfrastructureShared
-- Name: 9478a7385e38
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
