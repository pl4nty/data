-- Threat: !InfrastructureShared
-- Name: db78f8f7e840
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
