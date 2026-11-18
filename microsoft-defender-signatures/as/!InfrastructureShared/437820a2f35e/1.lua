-- Threat: !InfrastructureShared
-- Name: 437820a2f35e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
