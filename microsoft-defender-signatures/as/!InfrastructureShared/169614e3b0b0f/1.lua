-- Threat: !InfrastructureShared
-- Name: 169614e3b0b0f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
