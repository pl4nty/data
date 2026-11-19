-- Threat: !InfrastructureShared
-- Name: 19788929d178
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
