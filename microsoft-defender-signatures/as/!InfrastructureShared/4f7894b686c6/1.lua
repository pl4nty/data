-- Threat: !InfrastructureShared
-- Name: 4f7894b686c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
