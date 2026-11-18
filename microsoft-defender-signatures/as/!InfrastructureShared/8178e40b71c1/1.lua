-- Threat: !InfrastructureShared
-- Name: 8178e40b71c1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
