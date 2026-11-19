-- Threat: !InfrastructureShared
-- Name: 8a786501d230
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
