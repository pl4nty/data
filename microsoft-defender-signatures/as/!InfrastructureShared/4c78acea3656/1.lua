-- Threat: !InfrastructureShared
-- Name: 4c78acea3656
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
