-- Threat: !InfrastructureShared
-- Name: 2e07839a0e3d2
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
