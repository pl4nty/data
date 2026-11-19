-- Threat: !InfrastructureShared
-- Name: b97825fe1d34
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
