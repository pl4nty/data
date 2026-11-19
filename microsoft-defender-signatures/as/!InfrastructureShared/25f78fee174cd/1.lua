-- Threat: !InfrastructureShared
-- Name: 25f78fee174cd
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
