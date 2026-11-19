-- Threat: !InfrastructureShared
-- Name: 2c97857e32483
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
