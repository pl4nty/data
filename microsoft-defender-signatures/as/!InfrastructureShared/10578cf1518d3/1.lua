-- Threat: !InfrastructureShared
-- Name: 10578cf1518d3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
