-- Threat: !InfrastructureShared
-- Name: 1207819a275c8
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 8192 then
  return mp.INFECTED
end
return mp.CLEAN
