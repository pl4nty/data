-- Threat: !InfrastructureShared
-- Name: 10a78cf5fce00
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections <= 3 then
  return mp.INFECTED
end
return mp.CLEAN
