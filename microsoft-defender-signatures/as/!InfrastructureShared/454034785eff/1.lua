-- Threat: !InfrastructureShared
-- Name: 454034785eff
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
