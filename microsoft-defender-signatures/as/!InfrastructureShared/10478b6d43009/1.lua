-- Threat: !InfrastructureShared
-- Name: 10478b6d43009
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
