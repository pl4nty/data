-- Threat: !InfrastructureShared
-- Name: a9788df4fe09
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
