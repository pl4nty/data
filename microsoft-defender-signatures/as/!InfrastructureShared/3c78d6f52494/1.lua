-- Threat: !InfrastructureShared
-- Name: 3c78d6f52494
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
