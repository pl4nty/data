-- Threat: !InfrastructureShared
-- Name: 5378cf722170
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
