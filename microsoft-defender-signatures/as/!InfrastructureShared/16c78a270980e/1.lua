-- Threat: !InfrastructureShared
-- Name: 16c78a270980e
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
