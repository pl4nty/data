-- Threat: !InfrastructureShared
-- Name: 3278409c50c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
