-- Threat: !InfrastructureShared
-- Name: e540479b9b37
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
