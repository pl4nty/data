-- Threat: !InfrastructureShared
-- Name: 5d78c99b4890
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
