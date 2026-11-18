-- Threat: !InfrastructureShared
-- Name: 2a78d3aa0258
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
