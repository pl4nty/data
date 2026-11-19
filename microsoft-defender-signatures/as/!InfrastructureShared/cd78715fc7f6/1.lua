-- Threat: !InfrastructureShared
-- Name: cd78715fc7f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
