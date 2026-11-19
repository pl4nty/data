-- Threat: !InfrastructureShared
-- Name: 9b78c62d44a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
