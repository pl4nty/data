-- Threat: !InfrastructureShared
-- Name: 397807941fd7
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
