-- Threat: !InfrastructureShared
-- Name: 13540e88fe3a7
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
