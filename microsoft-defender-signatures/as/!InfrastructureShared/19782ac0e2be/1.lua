-- Threat: !InfrastructureShared
-- Name: 19782ac0e2be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
