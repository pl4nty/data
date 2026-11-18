-- Threat: !InfrastructureShared
-- Name: 2147895d69e3e
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
