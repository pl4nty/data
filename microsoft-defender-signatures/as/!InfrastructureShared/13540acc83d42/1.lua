-- Threat: !InfrastructureShared
-- Name: 13540acc83d42
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
