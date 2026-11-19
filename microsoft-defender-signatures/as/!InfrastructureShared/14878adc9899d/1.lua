-- Threat: !InfrastructureShared
-- Name: 14878adc9899d
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
