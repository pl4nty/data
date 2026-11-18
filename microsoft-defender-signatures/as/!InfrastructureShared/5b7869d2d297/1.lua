-- Threat: !InfrastructureShared
-- Name: 5b7869d2d297
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
