-- Threat: !InfrastructureShared
-- Name: c4784ee548d4
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
