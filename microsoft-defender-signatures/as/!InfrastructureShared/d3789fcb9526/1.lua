-- Threat: !InfrastructureShared
-- Name: d3789fcb9526
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
