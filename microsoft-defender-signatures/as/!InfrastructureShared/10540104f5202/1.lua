-- Threat: !InfrastructureShared
-- Name: 10540104f5202
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
