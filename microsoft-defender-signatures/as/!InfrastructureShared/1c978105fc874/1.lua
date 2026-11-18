-- Threat: !InfrastructureShared
-- Name: 1c978105fc874
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections <= 3 then
  return mp.INFECTED
end
return mp.CLEAN
