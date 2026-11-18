-- Threat: !InfrastructureShared
-- Name: 85408e5e4fa3
-- Type: 21

if mp.getfilesize() < 1536000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
