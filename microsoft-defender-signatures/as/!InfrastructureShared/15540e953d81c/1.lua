-- Threat: !InfrastructureShared
-- Name: 15540e953d81c
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
