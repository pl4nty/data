-- Threat: !InfrastructureShared
-- Name: 21540796447b2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
