-- Threat: !InfrastructureShared
-- Name: 88781e1d725c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
