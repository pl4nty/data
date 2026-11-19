-- Threat: !InfrastructureShared
-- Name: fd78ae2c6e93
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
