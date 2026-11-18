-- Threat: !InfrastructureShared
-- Name: 9d78b0b0c399
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
