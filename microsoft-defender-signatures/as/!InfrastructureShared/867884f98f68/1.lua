-- Threat: !InfrastructureShared
-- Name: 867884f98f68
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
