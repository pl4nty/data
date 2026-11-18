-- Threat: !InfrastructureShared
-- Name: 3c78b3c7c94f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
