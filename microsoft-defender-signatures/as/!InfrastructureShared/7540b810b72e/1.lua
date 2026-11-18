-- Threat: !InfrastructureShared
-- Name: 7540b810b72e
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
