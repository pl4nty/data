-- Threat: !InfrastructureShared
-- Name: d2789b589da0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
