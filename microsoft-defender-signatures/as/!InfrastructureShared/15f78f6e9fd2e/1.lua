-- Threat: !InfrastructureShared
-- Name: 15f78f6e9fd2e
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
