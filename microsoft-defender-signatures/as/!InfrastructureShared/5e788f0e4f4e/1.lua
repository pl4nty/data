-- Threat: !InfrastructureShared
-- Name: 5e788f0e4f4e
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
