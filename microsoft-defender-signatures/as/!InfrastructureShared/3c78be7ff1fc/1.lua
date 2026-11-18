-- Threat: !InfrastructureShared
-- Name: 3c78be7ff1fc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
