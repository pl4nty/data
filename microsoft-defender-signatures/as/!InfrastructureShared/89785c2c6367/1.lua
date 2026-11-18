-- Threat: !InfrastructureShared
-- Name: 89785c2c6367
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
