-- Threat: !InfrastructureShared
-- Name: 13178063d42b2
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
