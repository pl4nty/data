-- Threat: !InfrastructureShared
-- Name: 4f78c6ab3185
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
