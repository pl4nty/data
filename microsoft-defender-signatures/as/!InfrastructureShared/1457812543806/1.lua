-- Threat: !InfrastructureShared
-- Name: 1457812543806
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
