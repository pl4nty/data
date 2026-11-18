-- Threat: !InfrastructureShared
-- Name: 17c78d3b0857d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
