-- Threat: !InfrastructureShared
-- Name: 10c7847df6222
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
