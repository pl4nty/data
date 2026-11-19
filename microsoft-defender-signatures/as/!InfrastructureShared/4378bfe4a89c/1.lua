-- Threat: !InfrastructureShared
-- Name: 4378bfe4a89c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
