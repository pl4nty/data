-- Threat: !InfrastructureShared
-- Name: 16540f50d4252
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
