-- Threat: !InfrastructureShared
-- Name: 61788d14fc7c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
