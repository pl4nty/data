-- Threat: !InfrastructureShared
-- Name: 173781974f09a
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
