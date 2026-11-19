-- Threat: !InfrastructureShared
-- Name: e540ee4c332c
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
