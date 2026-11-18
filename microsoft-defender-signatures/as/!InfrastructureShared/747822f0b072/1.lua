-- Threat: !InfrastructureShared
-- Name: 747822f0b072
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
