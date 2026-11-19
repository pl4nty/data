-- Threat: !InfrastructureShared
-- Name: 4c784d55d243
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
