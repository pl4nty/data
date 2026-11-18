-- Threat: !InfrastructureShared
-- Name: 51785e4831be
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
