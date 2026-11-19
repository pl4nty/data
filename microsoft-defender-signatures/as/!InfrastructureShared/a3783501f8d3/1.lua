-- Threat: !InfrastructureShared
-- Name: a3783501f8d3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
