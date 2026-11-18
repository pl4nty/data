-- Threat: !InfrastructureShared
-- Name: 2e785f32d8f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
