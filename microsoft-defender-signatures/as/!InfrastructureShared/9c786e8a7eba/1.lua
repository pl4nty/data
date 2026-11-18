-- Threat: !InfrastructureShared
-- Name: 9c786e8a7eba
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
