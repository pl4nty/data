-- Threat: !InfrastructureShared
-- Name: f778d0f32bf7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
