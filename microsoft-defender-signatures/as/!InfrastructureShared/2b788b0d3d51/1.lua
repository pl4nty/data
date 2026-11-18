-- Threat: !InfrastructureShared
-- Name: 2b788b0d3d51
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
