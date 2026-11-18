-- Threat: !InfrastructureShared
-- Name: 295786626d51a
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
