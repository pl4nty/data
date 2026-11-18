-- Threat: !InfrastructureShared
-- Name: 180786dd88b57
-- Type: 21

if pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
