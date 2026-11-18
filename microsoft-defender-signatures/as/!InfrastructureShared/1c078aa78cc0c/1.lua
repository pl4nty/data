-- Threat: !InfrastructureShared
-- Name: 1c078aa78cc0c
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
