-- Threat: !InfrastructureShared
-- Name: 8878ec079720
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
