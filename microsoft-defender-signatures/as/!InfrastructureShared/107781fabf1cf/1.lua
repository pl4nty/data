-- Threat: !InfrastructureShared
-- Name: 107781fabf1cf
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
