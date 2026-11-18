-- Threat: !InfrastructureShared
-- Name: 947878cf7ff9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
