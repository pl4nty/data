-- Threat: !InfrastructureShared
-- Name: 13878e1f88cfd
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
