-- Threat: !InfrastructureShared
-- Name: 3478a487dc3e
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
