-- Threat: !InfrastructureShared
-- Name: 777852207e22
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
