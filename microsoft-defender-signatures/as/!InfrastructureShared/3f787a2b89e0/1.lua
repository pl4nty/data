-- Threat: !InfrastructureShared
-- Name: 3f787a2b89e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
