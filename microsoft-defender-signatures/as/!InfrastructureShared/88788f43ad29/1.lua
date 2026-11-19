-- Threat: !InfrastructureShared
-- Name: 88788f43ad29
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
