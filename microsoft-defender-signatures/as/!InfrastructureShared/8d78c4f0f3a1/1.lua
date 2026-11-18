-- Threat: !InfrastructureShared
-- Name: 8d78c4f0f3a1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
