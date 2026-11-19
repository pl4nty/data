-- Threat: !InfrastructureShared
-- Name: 2f78d3a7a23d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
