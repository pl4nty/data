-- Threat: !InfrastructureShared
-- Name: 11278246c2d3d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
