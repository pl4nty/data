-- Threat: !InfrastructureShared
-- Name: 1e5408ebf1c34
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 8192 then
  return mp.INFECTED
end
return mp.CLEAN
