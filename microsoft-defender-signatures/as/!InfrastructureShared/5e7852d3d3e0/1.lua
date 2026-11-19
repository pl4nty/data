-- Threat: !InfrastructureShared
-- Name: 5e7852d3d3e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
