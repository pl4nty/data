-- Threat: !InfrastructureShared
-- Name: 1cf7864e3ff28
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
