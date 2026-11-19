-- Threat: !InfrastructureShared
-- Name: 5a7859f40b72
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
