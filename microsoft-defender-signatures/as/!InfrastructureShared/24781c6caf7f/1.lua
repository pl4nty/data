-- Threat: !InfrastructureShared
-- Name: 24781c6caf7f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
