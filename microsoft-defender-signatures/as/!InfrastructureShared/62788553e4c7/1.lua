-- Threat: !InfrastructureShared
-- Name: 62788553e4c7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
