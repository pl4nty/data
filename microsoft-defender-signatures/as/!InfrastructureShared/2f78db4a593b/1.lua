-- Threat: !InfrastructureShared
-- Name: 2f78db4a593b
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
