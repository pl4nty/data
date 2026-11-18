-- Threat: !InfrastructureShared
-- Name: 17540f2561b45
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
