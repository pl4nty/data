-- Threat: !InfrastructureShared
-- Name: 8378031c0ecc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
