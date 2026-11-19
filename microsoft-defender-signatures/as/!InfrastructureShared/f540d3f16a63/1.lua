-- Threat: !InfrastructureShared
-- Name: f540d3f16a63
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
