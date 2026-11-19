-- Threat: !InfrastructureShared
-- Name: 65402e04f3f4
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
