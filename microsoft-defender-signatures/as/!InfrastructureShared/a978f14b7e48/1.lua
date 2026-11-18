-- Threat: !InfrastructureShared
-- Name: a978f14b7e48
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
