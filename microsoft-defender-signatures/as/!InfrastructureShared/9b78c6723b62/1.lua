-- Threat: !InfrastructureShared
-- Name: 9b78c6723b62
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
