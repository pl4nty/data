-- Threat: !InfrastructureShared
-- Name: 5078345f6133
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
