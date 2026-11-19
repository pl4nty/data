-- Threat: !InfrastructureShared
-- Name: 45787e5d2a24
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
