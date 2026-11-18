-- Threat: !InfrastructureShared
-- Name: b478aae7d3ee
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
