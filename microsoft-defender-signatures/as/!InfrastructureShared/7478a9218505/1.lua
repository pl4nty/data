-- Threat: !InfrastructureShared
-- Name: 7478a9218505
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
