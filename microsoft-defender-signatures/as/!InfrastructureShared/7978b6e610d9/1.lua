-- Threat: !InfrastructureShared
-- Name: 7978b6e610d9
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
