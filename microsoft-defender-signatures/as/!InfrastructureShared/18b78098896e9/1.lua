-- Threat: !InfrastructureShared
-- Name: 18b78098896e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
