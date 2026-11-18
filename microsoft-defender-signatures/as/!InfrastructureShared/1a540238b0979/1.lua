-- Threat: !InfrastructureShared
-- Name: 1a540238b0979
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
