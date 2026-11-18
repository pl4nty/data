-- Threat: !InfrastructureShared
-- Name: 13540639e9f09
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
