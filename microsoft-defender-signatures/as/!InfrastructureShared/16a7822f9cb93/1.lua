-- Threat: !InfrastructureShared
-- Name: 16a7822f9cb93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
