-- Threat: !InfrastructureShared
-- Name: 16540909a02ce
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
