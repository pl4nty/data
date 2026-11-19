-- Threat: !InfrastructureShared
-- Name: 7e78d4830d31
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
