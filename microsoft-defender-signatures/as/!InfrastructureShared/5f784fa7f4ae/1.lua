-- Threat: !InfrastructureShared
-- Name: 5f784fa7f4ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
