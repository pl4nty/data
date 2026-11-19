-- Threat: !InfrastructureShared
-- Name: 96783789a5bf
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
