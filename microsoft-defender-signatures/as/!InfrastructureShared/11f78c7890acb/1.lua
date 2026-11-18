-- Threat: !InfrastructureShared
-- Name: 11f78c7890acb
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
