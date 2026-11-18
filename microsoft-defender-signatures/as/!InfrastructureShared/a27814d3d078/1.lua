-- Threat: !InfrastructureShared
-- Name: a27814d3d078
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
