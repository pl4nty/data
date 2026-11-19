-- Threat: !InfrastructureShared
-- Name: 5540e419bac6
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
