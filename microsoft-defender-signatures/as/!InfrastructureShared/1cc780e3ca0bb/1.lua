-- Threat: !InfrastructureShared
-- Name: 1cc780e3ca0bb
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
