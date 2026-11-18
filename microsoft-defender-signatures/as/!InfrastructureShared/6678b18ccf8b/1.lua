-- Threat: !InfrastructureShared
-- Name: 6678b18ccf8b
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
