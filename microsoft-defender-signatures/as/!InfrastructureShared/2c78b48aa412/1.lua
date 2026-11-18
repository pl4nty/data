-- Threat: !InfrastructureShared
-- Name: 2c78b48aa412
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
