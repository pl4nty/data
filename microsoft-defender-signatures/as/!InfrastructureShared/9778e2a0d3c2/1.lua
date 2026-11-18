-- Threat: !InfrastructureShared
-- Name: 9778e2a0d3c2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
