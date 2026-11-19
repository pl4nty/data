-- Threat: !InfrastructureShared
-- Name: 2f78fd5a67c5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
