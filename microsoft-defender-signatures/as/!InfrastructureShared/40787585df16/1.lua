-- Threat: !InfrastructureShared
-- Name: 40787585df16
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
