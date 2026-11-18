-- Threat: !InfrastructureShared
-- Name: a540ac4cafe6
-- Type: 21

if mp.getfilesize() < 1536000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
