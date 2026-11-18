-- Threat: !InfrastructureShared
-- Name: 3a7860d3d1bb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
