-- Threat: !InfrastructureShared
-- Name: ac7819d2bf59
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
