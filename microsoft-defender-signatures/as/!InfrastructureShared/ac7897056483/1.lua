-- Threat: !InfrastructureShared
-- Name: ac7897056483
-- Type: 21

if peattributes.isvbpcode == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
