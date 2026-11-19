-- Threat: !InfrastructureShared
-- Name: 5d787eb0dcdc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
