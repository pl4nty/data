-- Threat: !InfrastructureShared
-- Name: 44789112a27d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
