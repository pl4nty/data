-- Threat: !InfrastructureShared
-- Name: 277849305f1f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
