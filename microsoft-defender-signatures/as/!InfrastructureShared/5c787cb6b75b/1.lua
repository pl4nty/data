-- Threat: !InfrastructureShared
-- Name: 5c787cb6b75b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
