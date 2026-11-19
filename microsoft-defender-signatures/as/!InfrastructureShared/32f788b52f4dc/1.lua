-- Threat: !InfrastructureShared
-- Name: 32f788b52f4dc
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
