-- Threat: !InfrastructureShared
-- Name: 1236141ebeeff
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
