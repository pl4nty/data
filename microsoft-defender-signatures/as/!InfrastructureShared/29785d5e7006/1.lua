-- Threat: !InfrastructureShared
-- Name: 29785d5e7006
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
