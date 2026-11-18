-- Threat: !InfrastructureShared
-- Name: 14278ec923fd5
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
