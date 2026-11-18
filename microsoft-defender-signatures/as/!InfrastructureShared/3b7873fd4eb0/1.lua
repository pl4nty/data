-- Threat: !InfrastructureShared
-- Name: 3b7873fd4eb0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
