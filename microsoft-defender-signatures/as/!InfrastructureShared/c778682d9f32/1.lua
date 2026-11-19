-- Threat: !InfrastructureShared
-- Name: c778682d9f32
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
