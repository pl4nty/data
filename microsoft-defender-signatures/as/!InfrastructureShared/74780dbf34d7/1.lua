-- Threat: !InfrastructureShared
-- Name: 74780dbf34d7
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 7168 then
  return mp.INFECTED
end
return mp.CLEAN
