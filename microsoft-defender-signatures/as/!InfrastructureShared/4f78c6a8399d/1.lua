-- Threat: !InfrastructureShared
-- Name: 4f78c6a8399d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
