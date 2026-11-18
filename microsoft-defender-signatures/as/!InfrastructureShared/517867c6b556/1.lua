-- Threat: !InfrastructureShared
-- Name: 517867c6b556
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
