-- Threat: !InfrastructureShared
-- Name: 125408a55ea74
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
