-- Threat: !InfrastructureShared
-- Name: 5078ab1f8404
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
