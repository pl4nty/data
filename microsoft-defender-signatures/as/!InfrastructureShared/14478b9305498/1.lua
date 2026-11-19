-- Threat: !InfrastructureShared
-- Name: 14478b9305498
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
