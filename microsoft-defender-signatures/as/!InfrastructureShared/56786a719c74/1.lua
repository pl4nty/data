-- Threat: !InfrastructureShared
-- Name: 56786a719c74
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
