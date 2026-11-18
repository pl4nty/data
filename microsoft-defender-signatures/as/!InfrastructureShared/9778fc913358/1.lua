-- Threat: !InfrastructureShared
-- Name: 9778fc913358
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
