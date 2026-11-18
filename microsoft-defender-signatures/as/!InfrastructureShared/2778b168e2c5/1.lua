-- Threat: !InfrastructureShared
-- Name: 2778b168e2c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
