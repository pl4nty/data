-- Threat: !InfrastructureShared
-- Name: b778c17e7c0f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
