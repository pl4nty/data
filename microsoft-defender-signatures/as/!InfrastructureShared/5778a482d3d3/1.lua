-- Threat: !InfrastructureShared
-- Name: 5778a482d3d3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
