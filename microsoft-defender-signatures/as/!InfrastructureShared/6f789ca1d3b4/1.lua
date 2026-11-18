-- Threat: !InfrastructureShared
-- Name: 6f789ca1d3b4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
