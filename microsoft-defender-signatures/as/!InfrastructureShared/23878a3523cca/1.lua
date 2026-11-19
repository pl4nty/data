-- Threat: !InfrastructureShared
-- Name: 23878a3523cca
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
