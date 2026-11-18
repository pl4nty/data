-- Threat: !InfrastructureShared
-- Name: 1f278011b9a86
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
