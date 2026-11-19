-- Threat: !InfrastructureShared
-- Name: 85401e1dfe71
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
