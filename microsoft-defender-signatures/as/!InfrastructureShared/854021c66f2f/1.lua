-- Threat: !InfrastructureShared
-- Name: 854021c66f2f
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
