-- Threat: !InfrastructureShared
-- Name: 1b278be93c9e8
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
