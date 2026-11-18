-- Threat: !InfrastructureShared
-- Name: 5b787ab9c68b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
