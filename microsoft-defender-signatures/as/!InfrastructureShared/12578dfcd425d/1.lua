-- Threat: !InfrastructureShared
-- Name: 12578dfcd425d
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
