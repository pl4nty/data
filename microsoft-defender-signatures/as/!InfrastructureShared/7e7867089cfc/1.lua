-- Threat: !InfrastructureShared
-- Name: 7e7867089cfc
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
