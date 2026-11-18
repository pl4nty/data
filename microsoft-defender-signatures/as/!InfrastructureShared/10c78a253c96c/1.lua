-- Threat: !InfrastructureShared
-- Name: 10c78a253c96c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
