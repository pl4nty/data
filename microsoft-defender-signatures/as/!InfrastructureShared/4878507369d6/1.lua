-- Threat: !InfrastructureShared
-- Name: 4878507369d6
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
