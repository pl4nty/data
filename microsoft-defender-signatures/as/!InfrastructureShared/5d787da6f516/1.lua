-- Threat: !InfrastructureShared
-- Name: 5d787da6f516
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
