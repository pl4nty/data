-- Threat: !InfrastructureShared
-- Name: 14b784bb11e4c
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
