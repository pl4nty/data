-- Threat: !InfrastructureShared
-- Name: a878e296fd34
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
