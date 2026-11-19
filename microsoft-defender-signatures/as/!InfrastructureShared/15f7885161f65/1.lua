-- Threat: !InfrastructureShared
-- Name: 15f7885161f65
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
