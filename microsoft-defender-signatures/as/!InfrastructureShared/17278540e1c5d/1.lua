-- Threat: !InfrastructureShared
-- Name: 17278540e1c5d
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
