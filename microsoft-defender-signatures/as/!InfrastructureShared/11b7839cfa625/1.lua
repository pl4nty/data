-- Threat: !InfrastructureShared
-- Name: 11b7839cfa625
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
