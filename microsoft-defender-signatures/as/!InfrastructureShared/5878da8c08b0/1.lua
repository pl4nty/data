-- Threat: !InfrastructureShared
-- Name: 5878da8c08b0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
