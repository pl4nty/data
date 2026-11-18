-- Threat: !InfrastructureShared
-- Name: 2a1782131c3b1
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
