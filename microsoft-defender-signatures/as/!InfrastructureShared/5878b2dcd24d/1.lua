-- Threat: !InfrastructureShared
-- Name: 5878b2dcd24d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
