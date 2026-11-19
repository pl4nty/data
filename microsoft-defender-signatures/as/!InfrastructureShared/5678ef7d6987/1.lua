-- Threat: !InfrastructureShared
-- Name: 5678ef7d6987
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
