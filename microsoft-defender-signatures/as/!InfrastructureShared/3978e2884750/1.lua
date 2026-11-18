-- Threat: !InfrastructureShared
-- Name: 3978e2884750
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
