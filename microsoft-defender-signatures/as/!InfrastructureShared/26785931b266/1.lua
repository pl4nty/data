-- Threat: !InfrastructureShared
-- Name: 26785931b266
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
