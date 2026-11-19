-- Threat: !InfrastructureShared
-- Name: 11f78b17e2209
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
