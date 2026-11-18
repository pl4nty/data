-- Threat: !InfrastructureShared
-- Name: 49780eac51be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
