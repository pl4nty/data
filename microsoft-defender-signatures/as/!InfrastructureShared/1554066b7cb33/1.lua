-- Threat: !InfrastructureShared
-- Name: 1554066b7cb33
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
