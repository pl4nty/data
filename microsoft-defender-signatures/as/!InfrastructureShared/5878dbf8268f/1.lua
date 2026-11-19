-- Threat: !InfrastructureShared
-- Name: 5878dbf8268f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
