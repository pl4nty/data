-- Threat: !InfrastructureShared
-- Name: 195401d441a11
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
