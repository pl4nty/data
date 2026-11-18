-- Threat: !InfrastructureShared
-- Name: 4b78c52e7731
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
