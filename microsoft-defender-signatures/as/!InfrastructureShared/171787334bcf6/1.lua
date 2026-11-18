-- Threat: !InfrastructureShared
-- Name: 171787334bcf6
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
