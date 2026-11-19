-- Threat: !InfrastructureShared
-- Name: 4478cd367e7f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
