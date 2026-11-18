-- Threat: !InfrastructureShared
-- Name: ba782fe9f3a9
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
