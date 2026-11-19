-- Threat: !InfrastructureShared
-- Name: 88781e7c1fb9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
