-- Threat: !InfrastructureShared
-- Name: 11578d35ad73f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
