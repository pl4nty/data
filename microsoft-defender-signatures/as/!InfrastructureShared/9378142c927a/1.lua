-- Threat: !InfrastructureShared
-- Name: 9378142c927a
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
