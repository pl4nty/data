-- Threat: !InfrastructureShared
-- Name: b07889c272b9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
