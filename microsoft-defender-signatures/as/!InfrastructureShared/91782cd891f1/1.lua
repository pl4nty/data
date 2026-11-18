-- Threat: !InfrastructureShared
-- Name: 91782cd891f1
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
