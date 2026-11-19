-- Threat: !InfrastructureShared
-- Name: 16578ae1478d7
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
