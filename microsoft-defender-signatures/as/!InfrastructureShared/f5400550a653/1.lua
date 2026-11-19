-- Threat: !InfrastructureShared
-- Name: f5400550a653
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
