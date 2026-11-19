-- Threat: !InfrastructureShared
-- Name: 3278367e68e6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
