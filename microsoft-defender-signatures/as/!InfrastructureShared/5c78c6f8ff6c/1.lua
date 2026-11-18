-- Threat: !InfrastructureShared
-- Name: 5c78c6f8ff6c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
