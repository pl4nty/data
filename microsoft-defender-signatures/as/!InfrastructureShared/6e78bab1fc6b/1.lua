-- Threat: !InfrastructureShared
-- Name: 6e78bab1fc6b
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
