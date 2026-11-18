-- Threat: !InfrastructureShared
-- Name: 15d787d27b88c
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
