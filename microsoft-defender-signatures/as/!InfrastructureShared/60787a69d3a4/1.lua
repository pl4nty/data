-- Threat: !InfrastructureShared
-- Name: 60787a69d3a4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
