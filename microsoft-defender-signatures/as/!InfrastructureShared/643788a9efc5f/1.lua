-- Threat: !InfrastructureShared
-- Name: 643788a9efc5f
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
