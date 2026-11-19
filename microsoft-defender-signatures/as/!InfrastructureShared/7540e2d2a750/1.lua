-- Threat: !InfrastructureShared
-- Name: 7540e2d2a750
-- Type: 21

if mp.getfilesize() < 1536000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
