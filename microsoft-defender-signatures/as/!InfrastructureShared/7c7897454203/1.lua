-- Threat: !InfrastructureShared
-- Name: 7c7897454203
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
