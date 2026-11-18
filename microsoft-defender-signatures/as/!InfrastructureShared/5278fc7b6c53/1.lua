-- Threat: !InfrastructureShared
-- Name: 5278fc7b6c53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
