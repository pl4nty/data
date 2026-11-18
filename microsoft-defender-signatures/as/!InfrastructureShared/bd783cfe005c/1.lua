-- Threat: !InfrastructureShared
-- Name: bd783cfe005c
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
