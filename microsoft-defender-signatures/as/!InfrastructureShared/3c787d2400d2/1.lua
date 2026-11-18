-- Threat: !InfrastructureShared
-- Name: 3c787d2400d2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
