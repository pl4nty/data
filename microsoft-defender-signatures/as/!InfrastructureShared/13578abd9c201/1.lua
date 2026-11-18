-- Threat: !InfrastructureShared
-- Name: 13578abd9c201
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
