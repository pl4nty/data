-- Threat: !InfrastructureShared
-- Name: b778ed1f90c0
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
