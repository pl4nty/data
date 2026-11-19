-- Threat: !InfrastructureShared
-- Name: 15278d242e03e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
