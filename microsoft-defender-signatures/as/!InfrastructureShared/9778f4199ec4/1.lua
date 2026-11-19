-- Threat: !InfrastructureShared
-- Name: 9778f4199ec4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
