-- Threat: !InfrastructureShared
-- Name: 6d78b3d3bb35
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
