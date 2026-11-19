-- Threat: !InfrastructureShared
-- Name: 18478f0c60f78
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections <= 3 then
  return mp.INFECTED
end
return mp.CLEAN
