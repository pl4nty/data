-- Threat: !InfrastructureShared
-- Name: 8f78933c1c3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
