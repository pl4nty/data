-- Threat: !InfrastructureShared
-- Name: 1d78d3a05ae7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
