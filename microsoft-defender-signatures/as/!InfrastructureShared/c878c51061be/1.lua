-- Threat: !InfrastructureShared
-- Name: c878c51061be
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
