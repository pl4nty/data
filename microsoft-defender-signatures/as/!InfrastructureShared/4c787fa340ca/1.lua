-- Threat: !InfrastructureShared
-- Name: 4c787fa340ca
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
