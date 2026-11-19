-- Threat: !InfrastructureShared
-- Name: 217840f2f32f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
