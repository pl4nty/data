-- Threat: !InfrastructureShared
-- Name: 10e78ce0aaa15
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
