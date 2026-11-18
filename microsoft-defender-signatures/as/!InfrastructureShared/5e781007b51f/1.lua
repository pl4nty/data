-- Threat: !InfrastructureShared
-- Name: 5e781007b51f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
