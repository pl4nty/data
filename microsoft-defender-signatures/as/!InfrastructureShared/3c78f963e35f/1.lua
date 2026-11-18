-- Threat: !InfrastructureShared
-- Name: 3c78f963e35f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
