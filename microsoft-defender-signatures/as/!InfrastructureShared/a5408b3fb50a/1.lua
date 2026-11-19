-- Threat: !InfrastructureShared
-- Name: a5408b3fb50a
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
