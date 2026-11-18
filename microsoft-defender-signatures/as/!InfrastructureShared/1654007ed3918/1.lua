-- Threat: !InfrastructureShared
-- Name: 1654007ed3918
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
