-- Threat: !InfrastructureShared
-- Name: 7540e7bb9e4d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
