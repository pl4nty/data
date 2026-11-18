-- Threat: !InfrastructureShared
-- Name: 7378c919240b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
