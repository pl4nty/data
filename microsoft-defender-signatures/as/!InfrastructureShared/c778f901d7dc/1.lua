-- Threat: !InfrastructureShared
-- Name: c778f901d7dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
