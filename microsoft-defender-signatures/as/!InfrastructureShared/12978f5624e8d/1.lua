-- Threat: !InfrastructureShared
-- Name: 12978f5624e8d
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
