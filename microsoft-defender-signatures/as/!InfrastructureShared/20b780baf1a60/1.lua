-- Threat: !InfrastructureShared
-- Name: 20b780baf1a60
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
