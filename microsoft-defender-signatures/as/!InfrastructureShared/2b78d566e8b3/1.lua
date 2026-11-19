-- Threat: !InfrastructureShared
-- Name: 2b78d566e8b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
