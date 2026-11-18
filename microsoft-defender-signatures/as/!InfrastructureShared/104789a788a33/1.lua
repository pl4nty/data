-- Threat: !InfrastructureShared
-- Name: 104789a788a33
-- Type: 21

if pehdr.NumberOfSections == 7 then
  return mp.INFECTED
end
return mp.CLEAN
