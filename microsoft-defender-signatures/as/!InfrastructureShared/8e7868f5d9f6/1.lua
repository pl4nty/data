-- Threat: !InfrastructureShared
-- Name: 8e7868f5d9f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
