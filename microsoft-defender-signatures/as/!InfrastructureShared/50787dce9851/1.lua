-- Threat: !InfrastructureShared
-- Name: 50787dce9851
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
