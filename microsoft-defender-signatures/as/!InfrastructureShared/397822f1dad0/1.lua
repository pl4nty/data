-- Threat: !InfrastructureShared
-- Name: 397822f1dad0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
