-- Threat: !InfrastructureShared
-- Name: e378b6a69528
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
