-- Threat: !InfrastructureShared
-- Name: eb78f5e0ade6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
