-- Threat: !InfrastructureShared
-- Name: 517840457b12
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
