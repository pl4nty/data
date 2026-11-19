-- Threat: !InfrastructureShared
-- Name: 1b54039beae74
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
