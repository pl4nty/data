-- Threat: !InfrastructureShared
-- Name: 8178d0202df8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
