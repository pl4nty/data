-- Threat: !InfrastructureShared
-- Name: a778c851e8db
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
