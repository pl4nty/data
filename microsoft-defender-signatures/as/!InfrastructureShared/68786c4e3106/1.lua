-- Threat: !InfrastructureShared
-- Name: 68786c4e3106
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
