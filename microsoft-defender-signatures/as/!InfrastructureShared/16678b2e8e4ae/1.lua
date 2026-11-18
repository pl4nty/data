-- Threat: !InfrastructureShared
-- Name: 16678b2e8e4ae
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
