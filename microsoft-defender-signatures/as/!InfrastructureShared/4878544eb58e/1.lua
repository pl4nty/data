-- Threat: !InfrastructureShared
-- Name: 4878544eb58e
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
