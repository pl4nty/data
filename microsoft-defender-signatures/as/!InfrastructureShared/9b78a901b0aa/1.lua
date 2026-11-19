-- Threat: !InfrastructureShared
-- Name: 9b78a901b0aa
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
