-- Threat: !InfrastructureShared
-- Name: 8b78c83b95d2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
