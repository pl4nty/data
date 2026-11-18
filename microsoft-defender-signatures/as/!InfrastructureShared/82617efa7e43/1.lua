-- Threat: !InfrastructureShared
-- Name: 82617efa7e43
-- Type: 21

if peattributes.ismsil and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
