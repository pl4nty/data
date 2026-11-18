-- Threat: !InfrastructureShared
-- Name: 3b7852e66579
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
