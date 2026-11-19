-- Threat: !InfrastructureShared
-- Name: 7978413b3e06
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
