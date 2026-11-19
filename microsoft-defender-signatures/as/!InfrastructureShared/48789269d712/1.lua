-- Threat: !InfrastructureShared
-- Name: 48789269d712
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
